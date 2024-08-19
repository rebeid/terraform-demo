output "network" {
  value = module.vpc.network_name
}

output "subnet" {
  value = element(module.vpc.subnets_names, 0)
}

output "subnet_ips" {
  value = element(module.vpc.subnets_ips, 0)
}