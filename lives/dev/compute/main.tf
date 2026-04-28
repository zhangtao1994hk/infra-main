data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "zhangtao-tf-state"
    prefix = "infra-main/lives/dev/network"  # 👈 指向 network 的 state
  }
}


resource "google_compute_instance" "vm" {
  name         = "dev-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.subnet_self_links["subnet-a"]

    access_config {}
  }
}
