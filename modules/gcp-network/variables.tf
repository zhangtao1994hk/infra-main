variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "project_id" {
  type = string
}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}

variable "ssh_source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
