resource "google_compute_network" "vpc" {
  name                    = "${var.name}-${var.env}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each = {
    for s in var.subnets : s.name => s
  }

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = google_compute_network.vpc.id
}

# 基础防火墙（允许内部通信）
resource "google_compute_firewall" "internal" {
  name    = "${var.name}-${var.env}-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/8"]
}

# 允许 SSH（你可以后面收紧）
resource "google_compute_firewall" "ssh" {
  name    = "${var.name}-${var.env}-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges
}
