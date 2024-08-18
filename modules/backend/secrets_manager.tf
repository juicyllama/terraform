resource "aws_secretsmanager_secret" "doppler" {
  count = length(var.doppler_secrets)
  name  = var.doppler_secrets[count.index]
}