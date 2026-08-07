output "network_name" {
  description = "Name of the VPC network."

  value = google_compute_network.vpc.name
}

output "network_id" {
  description = "ID of the VPC network."

  value = google_compute_network.vpc.id
}

output "subnet_name" {
  description = "Name of the subnetwork."

  value = google_compute_subnetwork.subnet.name
}

output "subnet_id" {
  description = "ID of the subnetwork."

  value = google_compute_subnetwork.subnet.id
}

output "pods_range_name" {
  description = "Secondary IP range name used for Kubernetes Pods."

  value = "pods"
}

output "services_range_name" {
  description = "Secondary IP range name used for Kubernetes Services."

  value = "services"
}