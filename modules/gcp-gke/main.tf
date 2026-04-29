
resource "google_container_cluster" "primary" {
  name     = "${var.name}-${var.env}"
  location = var.region

  remove_default_node_pool = true
  initial_node_count = 1

  deletion_protection = false
  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.name}-${var.env}-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region

  autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }

  node_config {
    machine_type = var.machine_type

    spot =var.use_spot 

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
