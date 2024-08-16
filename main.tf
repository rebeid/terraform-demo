
# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project     = var.project
  region      = var.region
  credentials = "${file(var.credentials_file)}"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
resource "google_compute_firewall" "custom-rule" {
    name        = "custom-allow-8090"
    network     = "default"
    description = "Firewall rule targeting tagged instances"

    allow {
      protocol = "tcp"
      ports    = ["8090"]
    }

    target_tags   = ["allow-8090"]
    source_ranges = ["0.0.0.0/0"]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger
