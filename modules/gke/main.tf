# Create a VPC network
module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "9.1.0"
  project_id   = var.project
  network_name = var.target_env

  subnets = [
    {
      subnet_name   = var.target_env
      subnet_ip     = local.subnet_ip
      subnet_region = var.region
    },
  ]
}

# Create a GKE autopilot cluster
resource "google_container_cluster" "autopilot_cluster" {
  name             = var.target_env  # GKE cluster name
  location         = var.region
  network          = var.target_env  # VPC network name
  subnetwork       = var.target_env  # VPC subnetwork name
  enable_autopilot = true

  # Set this flag to false to enable Terraform to destroy cluster
  deletion_protection = false
}