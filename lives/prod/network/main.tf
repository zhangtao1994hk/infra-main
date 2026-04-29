module "network" {
  source = "../../../modules/gcp-network"

  name       = "main"
  env        = "prod"
  project_id = "project-ef3e3c7b-875b-4ab7-a17"

  subnets = [
    {
      name   = "prod-a"
      cidr   = "10.2.0.0/20"
      region = "us-central1"
    },
    {
      name   = "prod-b"
      cidr   = "10.2.16.0/20"
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

output "vpc_self_link" {
  value = module.network.vpc_self_link
}
