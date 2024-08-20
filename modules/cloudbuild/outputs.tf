output "service_account" {
  value = google_service_account.service_account.display_name
}

output "sa_user" {
  value = google_project_iam_member.sa_user.role
}

output "log_writer" {
  value = google_project_iam_member.log_writer.role
}

output "repo_admin" {
  value = google_project_iam_member.repo_admin.role
}

output "instance_admin" {
  value = google_project_iam_member.instance_admin.role
}

output "cloud_deploy_operator" {
  value = google_project_iam_member.cloud_deploy_operator.role
}

output "storage_admin" {
  value = google_project_iam_member.storage_admin.role
}