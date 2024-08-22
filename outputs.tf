#output "firewall_rule" {
#  value = module.firewall.firewall_rule
#}

output "docker_repo" {
  value = module.docker_repo.my_repository
}

output "github_repo" {
  value = module.github_repo.my_repository
}

output "service_account" {
  value = module.cloudbuild.service_account
}

output "service_account_role_1" {
  value = module.cloudbuild.sa_user
}

output "service_account_role_2" {
  value = module.cloudbuild.log_writer
}

output "service_account_role_3" {
  value = module.cloudbuild.repo_admin
}

output "service_account_role_4" {
  value = module.cloudbuild.instance_admin
}

output "service_account_role_5" {
  value = module.cloudbuild.cloud_deploy_operator
}

output "service_account_role_6" {
  value = module.cloudbuild.storage_admin
}

output "delivery_pipeline" {
  value = module.clouddeploy.delivery_pipeline
}

output "vpc_networks" {
  value = module.vpc
}