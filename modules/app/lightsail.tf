module "lightsail" {
  count = local.create_lightsail ? 1 : 0
  providers = {
    aws           = aws.lightsail
    aws.us-east-1 = aws.us-east-1
  }
  source                              = "../lightsail"
  prefix                              = var.prefix
  create_lightsail                    = var.create_lightsail
  static_ip_name                      = var.static_ip_name
  lightsail_tags                      = var.lightsail_tags
  lightsail_domain_name               = var.lightsail_domain_name
  cdn_domain_name                     = var.cdn_domain_name
  lightsail_instance_prefix           = var.lightsail_instance_prefix
  lightsail_zone_id                   = var.lightsail_zone_id
  lightsail_lb_name                   = var.lightsail_lb_name
  lightsail_lb_cert_name              = var.lightsail_lb_cert_name
  create_lightsail_key_pair           = var.create_lightsail_key_pair
  lightsail_subject_alternative_names = var.lightsail_subject_alternative_names
}
