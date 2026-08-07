variable "network_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the GKE subnetwork."
  type        = string
}

variable "region" {
  description = "GCP region where the subnetwork will be created."
  type        = string
}

variable "subnet_cidr" {
  description = "Primary CIDR block for GKE nodes."
  type        = string
}

variable "pods_cidr" {
  description = "Secondary CIDR block allocated for Kubernetes Pods."
  type        = string
}

variable "services_cidr" {
  description = "Secondary CIDR block allocated for Kubernetes Services."
  type        = string
}