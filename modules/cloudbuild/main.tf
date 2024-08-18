# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger#example-usage---cloudbuild-trigger-service-account
resource "google_cloudbuild_trigger" "cloudbuild_trigger" {
  location        = var.gcp_region
  name            = "my-trigger"
  filename        = "cloudbuild.yaml"

  service_account = google_service_account.service_account.id
  depends_on = [
    google_project_iam_member.sa_user,
    google_project_iam_member.log_writer,
    google_project_iam_member.repo_admin,
  ]

  repository_event_config {
    repository = var.github_repositry
    push {
      branch = ".*"
    }
  }
}

resource "google_service_account" "service_account" {
  account_id = "cloudbuild-sa"
}

resource "google_project_iam_member" "sa_user" {
  project = var.gcp_project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "log_writer" {
  project = var.gcp_project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "repo_admin" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.repoAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "instance_admin" {
  project = var.gcp_project_id
  role    = "roles/compute.instanceAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}