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