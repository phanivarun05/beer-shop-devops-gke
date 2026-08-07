variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_cidr" {
  description = "Primary CIDR block."
  type        = string
}

variable "pods_cidr" {
  description = "Secondary CIDR block for Pods."
  type        = string
}

variable "services_cidr" {
  description = "Secondary CIDR block for Services."
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "node_pool_name" {
  description = "Name of the GKE node pool."
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes."
  type        = number
}

variable "machine_type" {
  description = "Machine type for worker nodes."
  type        = string
}

variable "disk_size_gb" {
  description = "Boot disk size in GB."
  type        = number
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "location" {
  description = "GCP zone or region."
  type        = string
}

