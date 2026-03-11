module "network" {
  source      = "../../modules/network"
  project_id  = var.project_id
  env         = var.env
  name_prefix = local.name_prefix
  region      = var.region
}
