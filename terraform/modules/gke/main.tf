resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.location

  network    = var.network_name
  subnetwork = var.subnet_name

  deletion_protection = var.deletion_protection

  remove_default_node_pool = var.remove_default_node_pool

  initial_node_count = var.initial_node_count

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }
}