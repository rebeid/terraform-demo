output "cluster" {
  description = "Object containing GKE cluster details"
  value       = google_container_cluster.autopilot_cluster
}

output "subnet_ip_range" {
  value = local.subnet_ip
}