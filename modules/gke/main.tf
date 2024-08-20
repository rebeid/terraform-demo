resource "google_container_cluster" "autopilot_cluster" {
  name             = "${var.env}-cluster"
  location         = var.region
  network          = var.network
  subnetwork       = var.subnet
  enable_autopilot = true

  # Set this flag to false to enable Terraform to destroy cluster
  deletion_protection = false
}