resource "google_compute_network" "vpc" {
  name                    = "${var.name_prefix}-vpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  mtu                     = 1460
}

resource "google_compute_subnetwork" "cloud_run" {
  name          = "${var.name_prefix}-cloud-run-subnet"
  ip_cidr_range = "10.0.10.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_subnetwork" "vm" {
  name          = "${var.name_prefix}-vm-subnet"
  ip_cidr_range = "10.0.20.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_subnetwork" "db" {
  name          = "${var.name_prefix}-db-subnet"
  ip_cidr_range = "10.0.30.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_route" "default_route" {
  name             = "${var.name_prefix}-default-route"
  description      = "Default route to the Internet."
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.self_link
  next_hop_gateway = "projects/${var.project_id}/global/gateways/default-internet-gateway"
  priority         = 1000
}
