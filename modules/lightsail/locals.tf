locals {
  create_static_ip = var.create_lightsail && var.static_ip_name == ""
  static_ip_name   = local.create_static_ip ? aws_lightsail_static_ip.this[0].name : var.static_ip_name
}
