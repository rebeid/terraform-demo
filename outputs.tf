output "firewall_rule" {
  value = module.firewall.firewall_rule
}

output "docker_repo" {
  value = module.docker_repo.my_repository
}

output "github_repo" {
  value = module.github_repo.my_repository
}

output "service_account" {
  value = module.cloudbuild.service_account
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