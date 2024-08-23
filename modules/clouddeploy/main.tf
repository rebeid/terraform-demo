resource "google_clouddeploy_delivery_pipeline" "primary" {
  location    = var.region
  name        = "cd-pipeline"
  description = "demo"

  serial_pipeline {
    stages {
      profiles  = ["dev"]
      target_id = google_clouddeploy_target.dev.name
    }

    stages {
      profiles  = ["stage"]
      target_id = google_clouddeploy_target.stage.name
    }

    stages {
      profiles  = ["prod"]
      target_id = google_clouddeploy_target.prod.name
      strategy {
        canary {
          runtime_config {
            kubernetes {
              service_networking {
                service    = "my-service"
                deployment = "my-app"
              }
            }
          }
          canary_deployment {
            percentages = [25, 50]
            verify = false
          }
        }
      }
    }
  }
}

resource "google_clouddeploy_target" "dev" {
  location         = var.region
  name             = "dev"
  description      = "dev environment"
  require_approval = false

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/dev"
  }
}

resource "google_clouddeploy_target" "stage" {
  location         = var.region
  name             = "stage"
  description      = "stage environment"
  require_approval = true

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/stage"
  }
}

resource "google_clouddeploy_target" "prod" {
  location         = var.region
  name             = "prod"
  description      = "prod environment"
  require_approval = true

  gke {
    cluster = "projects/${var.project}/locations/${var.region}/clusters/prod"
  }
}