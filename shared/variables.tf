variable "prefix" {
  default = "juicyllama"
}

variable "vpc_cidr" {
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid IPv4 CIDR block address."
  }
}

variable "region" {
  type = string
}

variable "create_vpc" {
  default = false
}

variable "public_subnets_cidrs" {
  default = []
}


variable "eb_max_size" {
  default = 2
}

