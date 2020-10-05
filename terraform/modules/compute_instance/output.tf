output "manager_public" {
  value = google_compute_instance.manager.*.network_interface.0.access_config.0.nat_ip
}

output "worker_internal" {
  value = google_compute_instance.worker.*.network_interface.0.network_ip
}
