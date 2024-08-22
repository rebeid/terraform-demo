module "cloudbuild" {
  source     = "./modules/cloudbuild"

  gcp_project_id   = var.project
  gcp_region       = var.region
  github_repositry = module.github_repo.my_repository
}

module "docker_repo" {
  source     = "./modules/docker_repo"

  gcp_region       = var.region
}

#module "firewall" {
#  source     = "./modules/firewall"
#
#  name       = var.firewall_name
#  port       = var.firewall_port
#  target_tag = var.firewall_target_tag
#}

module "github_repo" {
  source     = "./modules/github_repo"

  gcp_project_number         = var.project_number
  gcp_region                 = var.region
  github_app_installation_id = var.github_app_installation_id
}

module "clouddeploy" {
  source     = "./modules/clouddeploy"

  project = var.project
  region  = var.region
}

# One GKE autipilot cluster per target environment
module "gke" {
  for_each = local.target_environments

  source  = "./modules/gke"

  project      = var.project
  region       = var.region
  target_env   = each.key
}