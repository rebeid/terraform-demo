resource "google_clouddeploy_delivery_pipeline" "primary" {
  location    = var.region
  name        = "delivery-pipeline"

  serial_pipeline {
    stages {
      target_id = google_clouddeploy_target.dev.name
    }

    stages {
      target_id = google_clouddeploy_target.prod.name
    }
  }
}

resource "google_clouddeploy_target" "dev" {
  location         = var.region
  name             = "dev"
  description      = "dev gke environment"
  require_approval = false

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/dev-cluster"
  }
}

resource "google_clouddeploy_target" "prod" {
  location         = var.region
  name             = "prod"
  description      = "prod gke environment"
  require_approval = true

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/prod-cluster"
  }
}