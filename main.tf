# Source repo (GitHub) connection setup
module "github_repo" {
  source     = "./modules/github_repo"

  gcp_project_number         = var.project_number
  gcp_region                 = var.region
  github_app_installation_id = var.github_app_installation_id
}

# App container repository setup
module "docker_repo" {
  source     = "./modules/docker_repo"

  gcp_region       = var.region
}

# One GKE autipilot cluster per target environment
module "gke" {
  for_each = local.target_environments

  source  = "./modules/gke"

  project      = var.project
  region       = var.region
  target_env   = each.key
}

# Allow access to app in all target environments
module "firewall" {
  source     = "./modules/firewall"

  name       = "custom-allow-${var.app_port}"
  port       = var.app_port
  target_tag = "allow-${var.app_port}"
}

# Cloud Build setup
module "cloudbuild" {
  source     = "./modules/cloudbuild"

  gcp_project_id   = var.project
  gcp_region       = var.region
  github_repositry = module.github_repo.my_repository
}

# Cloud Deploy setup
module "clouddeploy" {
  source     = "./modules/clouddeploy"

  project = var.project
  region  = var.region
}