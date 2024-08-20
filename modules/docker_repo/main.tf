resource "google_artifact_registry_repository" "docker-repository" {
  location      = var.gcp_region
  repository_id = "my-docker-repo"
  format        = "DOCKER"

  cleanup_policies {
    id     = "delete-old-versions"
    action = "DELETE"
    condition {
      older_than   = "3600s"
    }
  }

  cleanup_policies {
    id     = "keep-minimum-versions"
    action = "KEEP"
    most_recent_versions {
      keep_count = 5
    }
  }
}