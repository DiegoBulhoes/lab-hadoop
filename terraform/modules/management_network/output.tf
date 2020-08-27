output "network" {
  description = "VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "public_subnetwork" {
  description = "public subnetwork"
  value       = google_compute_subnetwork.public_subnetwork.self_link
}
