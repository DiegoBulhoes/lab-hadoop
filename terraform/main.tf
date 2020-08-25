provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "management_network" {
  source                = "./modules/management_network"
  project               = var.project
  zone                  = var.zone
  region                = var.region
  ip_cidr_range_private = var.ip_cidr_range_private
  ip_cidr_range_public  = var.ip_cidr_range_public
  port_firewall_public  = var.port_firewall_public
  port_firewall_private = var.port_firewall_private
}

module "compute_instance" {
  source             = "./modules/compute_instance"
  project            = var.project
  user_name          = var.user_name
  count_manager      = var.count_manager
  count_worker       = var.count_worker
  key_ssh            = var.key_ssh
  private_subnetwork = module.management_network.private_subnetwork
  public_subnetwork  = module.management_network.public_subnetwork
}
