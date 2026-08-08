module "network" {
  source = "../../modules/network"

  network_name = var.network_name
  subnet_name  = var.subnet_name

  region = var.region

  subnet_cidr   = var.subnet_cidr
  pods_cidr     = var.pods_cidr
  services_cidr = var.services_cidr
}

module "gke" {
  source = "../../modules/gke"

  cluster_name = var.cluster_name

  region = var.region

  location = var.location

  network_name = module.network.network_name
  subnet_name  = module.network.subnet_name

  pods_range_name     = module.network.pods_range_name
  services_range_name = module.network.services_range_name
}

module "nodepool" {
  source = "../../modules/nodepool"

  node_pool_name = var.node_pool_name

  region   = var.region
  location = var.location

  cluster_name = module.gke.cluster_name

  node_count = var.node_count

  machine_type = var.machine_type

  disk_size_gb = var.disk_size_gb

  environment = var.environment
}