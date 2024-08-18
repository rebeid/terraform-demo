# Note: These examples are almost same. The Google one seems slightly outdated (e.g. I had to change automatic=true to auto {}).
# https://cloud.google.com/build/docs/automating-builds/github/connect-repo-github#terraform
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection#example-usage---cloudbuildv2-connection-github
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_repository#example-usage---cloudbuildv2-repository-github-doc

resource "google_secret_manager_secret" "github_token_secret" {
    secret_id = "github-token-secret"

    replication {
        auto {}
    }
}

resource "google_secret_manager_secret_version" "github_token_secret_version" {
    secret      = google_secret_manager_secret.github_token_secret.id
    secret_data = file("my-github-token.txt")
}

data "google_iam_policy" "secret_accessor" {
    binding {
        role    = "roles/secretmanager.secretAccessor"
        members = ["serviceAccount:service-${var.gcp_project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
    }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  secret_id   = google_secret_manager_secret.github_token_secret.secret_id
  policy_data = data.google_iam_policy.secret_accessor.policy_data
}

resource "google_cloudbuildv2_connection" "my_connection" {
    location = var.gcp_region
    name     = "github"

    github_config {
        app_installation_id = var.github_app_installation_id
        authorizer_credential {
            oauth_token_secret_version = google_secret_manager_secret_version.github_token_secret_version.id
        }
    }
}

resource "google_cloudbuildv2_repository" "my_repository" {
  location          = var.gcp_region
  name              = "cloud-build-demo"
  parent_connection = google_cloudbuildv2_connection.my_connection.name
  remote_uri        = "https://github.com/rebeid/cloud-build-demo.git"
}