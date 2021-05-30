terraform {
  required_version = ">= 0.14.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.64.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source                          = "./modules/management_network"
  region                          = var.region
  ip_cidr_range_public            = var.ip_cidr_range_public
  list_TCP_ports_internal_cluster = var.list_TCP_ports_internal_cluster
  list_UDP_ports_internal_cluster = var.list_UDP_ports_internal_cluster
  list_TCP_ports_external_cluster = var.list_TCP_ports_external_cluster
  list_UDP_ports_external_cluster = var.list_UDP_ports_external_cluster
  range_IP_access_cluster         = var.range_IP_access_cluster
}

module "compute_instance" {
  source        = "./modules/compute_instance"
  user_name     = var.user_name
  machine_type  = var.machine_type
  count_manager = var.count_manager
  count_worker  = var.count_worker
  key_ssh       = var.key_ssh
  subnetwork    = module.management_network.subnetwork
}
