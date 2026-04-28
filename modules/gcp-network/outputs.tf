output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "subnet_self_links" {
  value = {
    for k, s in google_compute_subnetwork.subnets :
    k => s.self_link
  }
}
