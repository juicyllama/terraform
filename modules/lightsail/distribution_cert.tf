resource "aws_lightsail_certificate" "cdn" {
  provider    = aws.us-east-1
  count       = var.create_lightsail ? 1 : 0
  name        = "${var.prefix}-cache-ssl"
  domain_name = var.cdn_domain_name
}
