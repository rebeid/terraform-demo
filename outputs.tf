#output "firewall_rule" {
#  value = module.firewall.firewall_rule
#}

output "docker_repo" {
  value = module.docker_repo.my_repository
}

output "github_repo" {
  value = module.github_repo.my_repository
}

# service account -------------------------------------------------------------

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

# dev -------------------------------------------------------------------------

output "gke_cluster_dev" {
  value = module.gke.dev.cluster.id
}

output "vpc_network_dev" {
  value = module.gke.dev.cluster.network
}

output "vpc_subnet_dev" {
  value = module.gke.dev.cluster.subnetwork
}

output "vpc_subnet_ip_range_dev" {
  value = module.gke.dev.subnet_ip_range
}

# stage -----------------------------------------------------------------------

output "gke_cluster_stage" {
  value = module.gke.stage.cluster.id
}

output "vpc_network_stage" {
  value = module.gke.stage.cluster.network
}

output "vpc_subnet_stage" {
  value = module.gke.stage.cluster.subnetwork
}

output "vpc_subnet_ip_range_stage" {
  value = module.gke.stage.subnet_ip_range
}

# prod ------------------------------------------------------------------------

output "gke_cluster_prod" {
  value = module.gke.prod.cluster.id
}

output "vpc_network_prod" {
  value = module.gke.prod.cluster.network
}

output "vpc_subnet_prod" {
  value = module.gke.prod.cluster.subnetwork
}

output "vpc_subnet_ip_range_prod" {
  value = module.gke.prod.subnet_ip_range
}