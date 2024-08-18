resource "aws_lightsail_static_ip" "this" {
  count = local.create_static_ip ? 1 : 0
  name  = "${var.prefix}-ip"
}

resource "aws_lightsail_static_ip_attachment" "test" {
  count          = local.create_static_ip ? 1 : 0
  static_ip_name = aws_lightsail_static_ip.this[0].id
  instance_name  = aws_lightsail_instance.www[0].id
}