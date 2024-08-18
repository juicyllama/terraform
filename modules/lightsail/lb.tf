resource "aws_lightsail_lb" "this" {
  count             = var.create_lightsail ? 1 : 0
  name              = var.lightsail_lb_name
  health_check_path = "/"
  instance_port     = "80"
  tags              = var.lightsail_tags
}

resource "aws_lightsail_lb_attachment" "this" {
  count         = var.create_lightsail ? 1 : 0
  lb_name       = aws_lightsail_lb.this[0].name
  instance_name = aws_lightsail_instance.www[0].name
}
