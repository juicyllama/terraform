resource "random_password" "mongodb_password" {
  count   = var.connect_to_mongodb ? 1 : 0
  length  = 40
  special = false
  keepers = {
    pass_version = 1
  }
}

resource "mongodbatlas_database_user" "data_lake_user" {
  count              = var.connect_to_mongodb ? 1 : 0
  username           = var.prefix
  password           = random_password.mongodb_password[0].result
  project_id         = var.mongodb_atlas_project_id
  auth_database_name = "admin"

  roles {
    role_name     = var.prefix == "juicyllama" ? "atlasAdmin" : "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "aws_secretsmanager_secret" "mongodb_atlas_credentials" {
  count = length(mongodbatlas_database_user.data_lake_user)
  name  = "${var.prefix}-mongodb-atlas-credentials"
}

resource "aws_secretsmanager_secret_version" "mongodb_atlas_credentials" {
  count     = length(mongodbatlas_database_user.data_lake_user)
  secret_id = aws_secretsmanager_secret.mongodb_atlas_credentials[count.index].id
  secret_string = jsonencode({
    username = mongodbatlas_database_user.data_lake_user[count.index].username
    password = mongodbatlas_database_user.data_lake_user[count.index].password
  })
}
