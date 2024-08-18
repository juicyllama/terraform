#Create an ACM Certificate
resource "aws_acm_certificate" "certificate" {
  count             = var.zone_id != "" ? 1 : 0
  domain_name       = var.domain
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "certificate" {
  count                   = var.zone_id != "" ? 1 : 0
  certificate_arn         = aws_acm_certificate.certificate[0].arn
  validation_record_fqdns = [aws_route53_record.certificate[0].fqdn]
}
