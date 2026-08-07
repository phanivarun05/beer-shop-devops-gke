resource "google_container_node_pool" "default" {
  name     = var.node_pool_name
  location = var.location

  cluster = var.cluster_name


  node_count = var.node_count

  node_config {

    machine_type = var.machine_type

    disk_size_gb = var.disk_size_gb

    disk_type = "pd-balanced"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      environment = var.environment
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}