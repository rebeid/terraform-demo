locals {
  env = "prod"
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = "${file(var.svc_acct_key_file)}"
}

provider "google-beta" {
  project     = var.project
  region      = var.region
  credentials = "${file(var.svc_acct_key_file)}"
}

module "vpc" {
  source  = "../../modules/vpc"

  env     = local.env
  project = var.project
  region  = var.region
}

module "gke" {
  source  = "../../modules/gke"

  env     = local.env
  network = module.vpc.network
  region  = var.region
  subnet  = module.vpc.subnet
}

module "cloud_deploy_target" {
  source  = "../../modules/cloud_deploy_target"

  env            = local.env
  project        = var.project
  region         = var.region
  target_cluster = module.gke.cluster
}