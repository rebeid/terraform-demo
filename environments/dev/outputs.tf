output "cluster" {
    value = module.gke.cluster
}

output "network" {
  value = module.vpc.network
}

output "subnet" {
  value = module.vpc.subnet
}

output "subnet_ips" {
  value = module.vpc.subnet_ips
}