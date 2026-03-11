provider "google" {
  project = var.project_id
  region  = "asia-northeast1-c"
}

terraform {
  required_version = ">= 1.7.4"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.22.0"
    }
  }
  backend "gcs" {
    bucket = "dmm-sec-gcp-asset-inventory-dev-test"
    prefix = "dev"
  }
}
