# Ref: https://registry.terraform.io/modules/terraform-google-modules/network/google/latest
module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "9.1.0"
  project_id   = var.project
  network_name = "${var.env}-network"

  subnets = [
    {
      subnet_name   = "${var.env}-subnet"
      subnet_ip     = "10.${var.env == "dev" ? 10 : 20}.10.0/24"
      subnet_region = var.region
    },
  ]
}