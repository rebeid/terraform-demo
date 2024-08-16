output "firewall_rule" {
  value = google_compute_firewall.custom-rule.name
}