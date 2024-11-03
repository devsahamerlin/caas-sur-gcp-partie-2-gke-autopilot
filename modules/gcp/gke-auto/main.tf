resource "google_container_cluster" "gcp-cluster" {
  name             = var.name
  location         = var.region
  enable_autopilot = true
  network          = var.vpc_network
  subnetwork       = var.vpc_subnetwork
  deletion_protection  = var.deletion_protection
  lifecycle {
    ignore_changes = all
  }
}