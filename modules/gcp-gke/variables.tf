variable "region" {}
variable "project_id" {}

variable "network" {}
variable "subnetwork" {}

variable "min_nodes" {
  default = 1
}

variable "max_nodes" {
  default = 3
}

variable "machine_type" {
  default = "e2-medium"
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}
variable "use_spot" {
  description = "Whether to use spot instances"
  type        = bool
  default     = false
}
