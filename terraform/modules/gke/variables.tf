variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "region" {
  description = "GCP region where the GKE cluster will be created."
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network used by the GKE cluster."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet used by the GKE cluster."
  type        = string
}

variable "pods_range_name" {
  description = "Secondary IP range name used for Kubernetes Pods."
  type        = string
}

variable "services_range_name" {
  description = "Secondary IP range name used for Kubernetes Services."
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection for the GKE cluster."
  type        = bool
  default     = false
}

variable "remove_default_node_pool" {
  description = "Remove the default node pool created by GKE."
  type        = bool
  default     = true
}

variable "initial_node_count" {
  description = "Initial node count required during cluster creation."
  type        = number
  default     = 1
}

variable "location" {
  description = "Region or zone where the GKE cluster will be created."
  type        = string
}