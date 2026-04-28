module "network" {
  source = "../../../modules/gcp-network"

  name       = "main"
  env        = "dev"
  project_id = "project-ef3e3c7b-875b-4ab7-a17"

  subnets = [
    {
      name   = "subnet-a"
      cidr   = "10.0.1.0/24"
      region = "us-central1"
    },
    {
      name   = "subnet-b"
      cidr   = "10.0.2.0/24"
      region = "us-central1"
    }
  ]

  ssh_source_ranges = ["0.0.0.0/0"] # 后面建议改成你自己的IP
}

output "subnet_self_links" {
  value = module.network.subnet_self_links
}

output "vpc_name" {
  value = module.network.vpc_name
}
