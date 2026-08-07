output "node_pool_name" {
  description = "Name of the GKE node pool."

  value = google_container_node_pool.default.name
}

output "node_pool_id" {
  description = "ID of the GKE node pool."

  value = google_container_node_pool.default.id
}

output "instance_group_urls" {
  description = "Managed instance groups backing the node pool."

  value = google_container_node_pool.default.managed_instance_group_urls
}

output "node_count" {
  description = "Number of nodes in the node pool."

  value = google_container_node_pool.default.node_count
}