output "my_firewall_rule" {
  value = module.firewall.firewall_rule
}

output "my_github_repo" {
  value = module.github_repo.my_repository
}

output "sa_role_1" {
  value = module.cloudbuild.sa_user
}

output "sa_role_2" {
  value = module.cloudbuild.log_writer
}

output "sa_role_3" {
  value = module.cloudbuild.repo_admin
}

output "sa_role_4" {
  value = module.cloudbuild.instance_admin
}