terraform {
  backend "gcs" {
    bucket = "zhangtao-tf-state"
    prefix = "terraform/network/dev" # 👈 必须与 compute 不同
  }
}

provider "cloudflare" {
  # 变量会自动从你的 atlantis.env 中读取
}
