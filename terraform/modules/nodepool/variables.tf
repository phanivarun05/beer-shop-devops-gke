variable "region" {
  description = "GCP region."
  type        = string
}

variable "location" {
  description = "GCP zone or region where the node pool will be created."
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "node_pool_name" {
  description = "Name of the node pool."
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the node pool."
  type        = number
}

variable "machine_type" {
  description = "Machine type for the nodes in the node pool."
  type        = string
}

variable "disk_size_gb" {
  description = "Disk size in GB for the nodes in the node pool."
  type        = number
}

variable "environment" {
  description = "Environment label for the node pool."
  type        = string
}

