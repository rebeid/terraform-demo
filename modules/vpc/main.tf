# Ref: https://registry.terraform.io/modules/terraform-google-modules/network/google/latest
module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "9.1.0"
  project_id   = var.project
  network_name = "${var.env}-network"

  subnets = [
    {
      subnet_name   = "${var.env}-subnet"
      subnet_ip     = local.subnet_ip
      subnet_region = var.region
    },
  ]
}