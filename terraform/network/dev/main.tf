resource "cloudflare_record" "test_atlantis" {
  zone_id = var.cloudflare_zone_id
  name    = "atlantis-test"
  value   = "36.161.119.39"
  type    = "A"
  proxied = true
}

variable "cloudflare_zone_id" {}

