resource "aws_route53_record" "certificate" {
  count           = var.zone_id != "" ? 1 : 0
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.certificate[0].domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.certificate[0].domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.certificate[0].domain_validation_options)[0].resource_record_type
  zone_id         = var.zone_id
  ttl             = 60
}

resource "aws_route53_record" "api" {
  count   = var.zone_id != "" ? length(aws_elastic_beanstalk_environment.api) : 0
  zone_id = var.zone_id
  name    = var.domain
  type    = "A"
  alias {
    evaluate_target_health = true
    name                   = aws_elastic_beanstalk_environment.api[count.index].cname
    zone_id                = "Z1GKAAAUGATPF1"
  }
}
