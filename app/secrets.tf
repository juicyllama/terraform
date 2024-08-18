resource "aws_secretsmanager_secret" "key-pair" {
  count = var.create_lightsail_key_pair ? 1 : 0
  name  = startswith(var.prefix, "staging") ? "${terraform.workspace}-staging-key-pair" : "${terraform.workspace}-key-pair"
}

resource "aws_secretsmanager_secret_version" "key-pair-val" {
  count     = var.create_lightsail_key_pair ? 1 : 0
  secret_id = aws_secretsmanager_secret.key-pair[0].id
  secret_string = jsonencode({
    public_key  = module.lightsail[0].key_pair_public_key
    private_key = module.lightsail[0].key_pair_private_key
  })
}