variable "prefix" {
  default = "juicyllama"
}

variable "create_lightsail" {
  default = false
}
variable "create_lightsail_key_pair" {
  default = false
}

variable "static_ip_name" {
  default = ""
}

variable "lightsail_tags" {
  type    = map(string)
  default = {}
}

variable "lightsail_domain_name" {
  default = "juicyllama.com"
}

variable "cdn_domain_name" {
  default = "cdn.juicyllama.com"
}

variable "lightsail_instance_prefix" {
  default = "Juicyllama"
}

variable "lightsail_lb_name" {
  default = "juicyllama-lb"
}

variable "lightsail_lb_cert_name" {
  default = "juicyllama-ssl"
}

variable "lightsail_zone_id" {
  default = ""
}
variable "lightsail_subject_alternative_names" {
  default = []
}