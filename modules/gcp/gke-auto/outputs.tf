output "cluster_id" {
  value = google_container_cluster.gcp-cluster.id
}

output "cluster_endpoint" {
  value = google_container_cluster.gcp-cluster.endpoint
}