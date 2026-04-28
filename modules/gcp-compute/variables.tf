variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-11"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

variable "subnetwork" {
  type = string
}

variable "assign_public_ip" {
  type    = bool
  default = true
}

variable "ssh_keys" {
  type    = string
  default = ""
}

variable "tags" {
  type    = list(string)
  default = []
}
