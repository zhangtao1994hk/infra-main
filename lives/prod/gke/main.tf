data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "zhangtao-tf-state"
    prefix = "infra-main/lives/prod/network"
  }
}

module "gke" {
  source = "../../../modules/gcp-gke"

  name       = "core"
  env        = "prod"
  project_id = "project-ef3e3c7b-875b-4ab7-a17"
  region     = "us-central1"
  
  use_spot   = false

  network    = data.terraform_remote_state.network.outputs.vpc_self_link
  subnetwork = data.terraform_remote_state.network.outputs.subnet_self_links["subnet-a"]
  
  min_nodes = 1
  max_nodes = 3
}
