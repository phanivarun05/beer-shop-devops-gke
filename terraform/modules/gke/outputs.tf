output "cluster_name" {
  description = "Name of the GKE cluster."

  value = google_container_cluster.cluster.name
}

output "cluster_id" {
  description = "ID of the GKE cluster."

  value = google_container_cluster.cluster.id
}

output "endpoint" {
  description = "Endpoint of the Kubernetes API server."

  value = google_container_cluster.cluster.endpoint
}

output "ca_certificate" {
  description = "Base64 encoded public CA certificate used by the Kubernetes API server."

  value = google_container_cluster.cluster.master_auth[0].cluster_ca_certificate

  sensitive = true
}