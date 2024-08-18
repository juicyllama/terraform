resource "aws_lightsail_lb_certificate" "this" {
  count                     = length(aws_lightsail_lb.this)
  name                      = var.lightsail_lb_cert_name
  lb_name                   = aws_lightsail_lb.this[count.index].id
  domain_name               = var.lightsail_domain_name
  subject_alternative_names = var.lightsail_subject_alternative_names
}

resource "aws_lightsail_lb_certificate_attachment" "cdn" {
  count            = length(aws_lightsail_lb.this)
  lb_name          = aws_lightsail_lb.this[0].name
  certificate_name = aws_lightsail_lb_certificate.this[0].name
}
