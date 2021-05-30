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

resource "google_compute_firewall" "firewall_ingress_cluster_internal" {
  name        = "hadoop-firewall-ingress-cluster-internal"
  network     = google_compute_network.vpc_network.id
  direction   = "INGRESS"
  source_tags = ["hadoop-ingress"]
  priority    = 9000

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.list_TCP_ports_internal_cluster
  }

  allow {
    protocol = "udp"
    ports    = var.list_UDP_ports_internal_cluster
  }

  source_ranges = [var.ip_cidr_range_public]
  depends_on    = [google_compute_network.vpc_network]
}
resource "google_compute_firewall" "firewall_ingress_cluster_external" {
  name        = "hadoop-firewall-ingress-cluster-external"
  network     = google_compute_network.vpc_network.id
  direction   = "INGRESS"
  source_tags = ["hadoop-ingress"]
  priority    = 9000

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.list_UDP_ports_external_cluster
  }

  allow {
    protocol = "udp"
    ports    = var.list_UDP_ports_external_cluster
  }

  source_ranges = var.range_IP_access_cluster
  depends_on    = [google_compute_network.vpc_network]
}
