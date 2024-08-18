resource "google_artifact_registry_repository" "docker-repository" {
  location      = var.gcp_region
  repository_id = "my-docker-repo"
  format        = "DOCKER"
}