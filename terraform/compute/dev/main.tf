# 开发环境业务服务器
resource "google_compute_instance" "dev_app" {
  name         = "dev-app-01"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  # 使用 Atlantis 专用服务账号
  service_account {
    email  = "atlantis-sa@project-ef3e3c7b-875b-4ab7-a17.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  tags = ["dev-app"]
}

# 防火墙：允许 80 端口
resource "google_compute_firewall" "dev_app_80" {
  name          = "dev-app-allow-80"
  network       = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["dev-app"]
}
