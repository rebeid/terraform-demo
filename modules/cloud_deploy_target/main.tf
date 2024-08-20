resource "google_clouddeploy_target" "primary" {
  location         = var.region
  name             = "${var.env}-environment"
  description      = "Target environment: ${var.env}"
  require_approval = false

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/${var.target_cluster}"
  }
}