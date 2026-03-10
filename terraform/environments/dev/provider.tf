provider "google" {
  project = var.PROJECT_ID
  region  = "asia-northeast1-c"
}

terraform {
  backend "gcs" {
    bucket = "dmm-sec-gcp-asset-inventory-dev"
    prefix = "dev"
  }
}
