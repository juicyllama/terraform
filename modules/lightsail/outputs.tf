output "key_pair_private_key" {
  value = var.create_lightsail_key_pair ? aws_lightsail_key_pair.key_pair[0].private_key : ""
}
output "key_pair_public_key" {
  value = var.create_lightsail_key_pair ? aws_lightsail_key_pair.key_pair[0].public_key : ""
}