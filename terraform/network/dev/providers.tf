terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare" # 👈 关键：必须指定是 cloudflare 组织下的
      version = "~> 4.0"                # 建议固定主版本号
    }
  }

  backend "gcs" {
    bucket = "zhangtao-tf-state"
    prefix = "terraform/network/dev" # 👈 必须与 compute 不同
  }
}

variable "cloudflare_api_token" {} # 👈 声明变量

provider "cloudflare" {
  api_token = var.cloudflare_api_token # 👈 显式关联
}

