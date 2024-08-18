resource "aws_lightsail_instance" "www" {
  count             = var.create_lightsail ? 1 : 0
  name              = "${var.lightsail_instance_prefix}-www"
  availability_zone = "eu-west-2a"
  blueprint_id      = "wordpress"
  bundle_id         = "small_2_0"
  key_pair_name     = var.create_lightsail_key_pair ? aws_lightsail_key_pair.key_pair[0].id : "ASLACK-AWS"
  tags              = var.lightsail_tags
  add_on {
    snapshot_time = "01:00"
    status        = "Enabled"
    type          = "AutoSnapshot"
  }
}
