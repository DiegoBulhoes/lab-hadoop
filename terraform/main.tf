provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source                     = "./modules/management_network"
  region                     = var.region
  ip_cidr_range_public       = var.ip_cidr_range_public
  firewall_ingress_port_UDP = var.firewall_ingress_port_UDP
  firewall_ingress_port_TCP = var.firewall_ingress_port_TCP
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
