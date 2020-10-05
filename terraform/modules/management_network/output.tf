output "network" {
  description = "VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "subnetwork" {
  description = "subnetwork"
  value       = google_compute_subnetwork.subnetwork.self_link
}
