
resource "google_compute_instance" "worker" {
  count        =  var.count_worker
  name         = "worker-${count.index + 1}"
  machine_type = "n1-standard-1"
  description  = "worker"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "${var.user_name}:${file(var.key_ssh)}"
  }

  network_interface {
    subnetwork = var.public_subnetwork
    access_config {
    }
  }
}

resource "google_compute_instance" "manager" {
  count        = var.count_manager
  name         = "manager-${count.index + 1}"
  machine_type = "n1-standard-1"
  description  = "manager"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "${var.user_name}:${file(var.key_ssh)}"
  }

  network_interface {
    subnetwork = var.public_subnetwork
    access_config {
    }
  }
}
