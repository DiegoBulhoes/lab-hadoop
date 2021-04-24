resource "google_compute_network" "vpc_network" {
  name                    = "hadoop-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnetwork" {
  region        = var.region
  name          = "hadoop-subnet"
  ip_cidr_range = var.ip_cidr_range_public
  network       = google_compute_network.vpc_network.id
  depends_on    = [google_compute_network.vpc_network]
}

resource "google_compute_firewall" "firewall_ingress" {
  name        = "hadoop-firewall-ingress"
  network     = google_compute_network.vpc_network.id
  direction   = "INGRESS"
  source_tags = ["hadoop-ingress"]
  priority    = 9000

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.firewall_ingress_port_TCP
  }

  allow {
    protocol = "udp"
    ports    = var.firewall_ingress_port_UDP
  }

  source_ranges = var.source_ranges
  depends_on    = [google_compute_network.vpc_network]
}
