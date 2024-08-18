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