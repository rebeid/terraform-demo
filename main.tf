
provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  credentials = "${file(var.gcp_svc_acct_key_file)}"
}

module "firewall" {
  source     = "./modules/firewall"

  name       = var.firewall_name
  port       = var.firewall_port
  target_tag = var.firewall_target_tag
}

module "github_repo" {
  source     = "./modules/github_repo"

  gcp_project_number         = var.gcp_project_number
  gcp_region                 = var.gcp_region
  github_app_installation_id = var.github_app_installation_id
}

module "cloudbuild" {
  source     = "./modules/cloudbuild"

  gcp_project_id   = var.gcp_project_id
  gcp_region       = var.gcp_region
  github_repositry = module.github_repo.my_repository
}