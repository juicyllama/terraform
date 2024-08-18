resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.ssh_key.public_key_openssh
  tags = {
    Name = "ssh-key"
  }
}

resource "aws_secretsmanager_secret" "ssh_key" {
  name = "private-${var.key_pair_name}"
}

resource "aws_secretsmanager_secret_version" "ssh_key" {
  secret_id     = aws_secretsmanager_secret.ssh_key.id
  secret_string = tls_private_key.ssh_key.private_key_pem
}
