resource "aws_secretsmanager_secret" "db-pass" {
  count = var.create_mysql ? 1 : 0
  name  = length(split("staging", var.domain)) > 1 ? "db-pass-staging-${var.mysql_cluster_name}" : "db-pass-${var.mysql_cluster_name}"
}

resource "aws_secretsmanager_secret_version" "db-pass-val" {
  count         = var.create_mysql ? 1 : 0
  secret_id     = aws_secretsmanager_secret.db-pass[0].id
  secret_string = random_password.db_master_pass[0].result
}

resource "random_password" "db_master_pass" {
  count   = var.create_mysql ? 1 : 0
  length  = 40
  special = false
  keepers = {
    pass_version = 1
  }
}
