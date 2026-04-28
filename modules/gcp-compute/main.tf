resource "google_compute_instance" "vm" {
  name         = "${var.name}-${var.env}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size_gb
    }
  }

  network_interface {
    subnetwork = var.subnetwork

    # 是否分配公网IP
    dynamic "access_config" {
      for_each = var.assign_public_ip ? [1] : []
      content {}
    }
  }

  metadata = {
    ssh-keys = var.ssh_keys
  }

  labels = {
    env = var.env
  }
}
