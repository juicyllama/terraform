resource "aws_lightsail_key_pair" "key_pair" {
  count = var.create_lightsail_key_pair ? 1 : 0
  name  = "ASLACK-AWS"
}