locals {
  service     = "cloud-asset-inventory"
  name_prefix = "${var.env}-${local.service}"
}
