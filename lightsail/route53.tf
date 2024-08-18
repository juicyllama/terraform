resource "aws_route53_record" "cdn" {
  count           = var.lightsail_zone_id != "" ? 1 : 0
  allow_overwrite = true
  name            = tolist(aws_lightsail_certificate.cdn[0].domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_lightsail_certificate.cdn[0].domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_lightsail_certificate.cdn[0].domain_validation_options)[0].resource_record_type
  zone_id         = var.lightsail_zone_id
  ttl             = 60
}
resource "aws_route53_record" "lb" {
  count           = var.lightsail_zone_id != "" ? 1 : 0
  allow_overwrite = true
  name            = tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[0].resource_record_name
  records         = [tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[0].resource_record_value]
  type            = tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[0].resource_record_type
  zone_id         = var.lightsail_zone_id
  ttl             = 60
}

resource "aws_route53_record" "www_lb" {
  count           = var.lightsail_zone_id != "" ? 1 : 0
  allow_overwrite = true
  name            = tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[1].resource_record_name
  records         = [tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[1].resource_record_value]
  type            = tolist(aws_lightsail_lb_certificate.this[0].domain_validation_records)[1].resource_record_type
  zone_id         = var.lightsail_zone_id
  ttl             = 60
}


resource "aws_route53_record" "lb_a" {
  count   = var.lightsail_zone_id != "" ? 1 : 0
  zone_id = var.lightsail_zone_id
  name    = var.lightsail_domain_name
  type    = "A"
  alias {
    evaluate_target_health = false

    name    = aws_lightsail_lb.this[0].dns_name
    zone_id = "ZHURV8PSTC4K8"
  }
}

resource "aws_route53_record" "cdn_ampli_co_a" {
  count   = var.lightsail_zone_id != "" ? 1 : 0
  zone_id = var.lightsail_zone_id
  name    = var.cdn_domain_name
  type    = "A"
  alias {
    evaluate_target_health = false
    name                   = aws_lightsail_distribution.cdn[0].domain_name
    zone_id                = "Z2FDTNDATAQYW2"
  }
}
