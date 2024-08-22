resource "google_compute_firewall" "rule" {
  name        = var.name
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = [var.port]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.target_tag]
}
