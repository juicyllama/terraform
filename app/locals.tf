locals {
  create_amplify_app      = length(var.frontends) > 0 ? true : false
  create_shared           = var.create_vpc
  create_lightsail        = var.create_lightsail
  subnet_ids              = (local.create_shared && length(var.subnet_ids) == 0) ? module.shared[0].public_subnet_ids : var.subnet_ids
  db_subnet_group_name    = (local.create_shared && length(var.subnet_ids) == 0) ? module.shared[0].db_subnet_group_name : "default"
  private_subnet_ids      = (local.create_shared && length(var.subnet_ids) == 0) ? module.shared[0].private_subnet_ids : var.subnet_ids
  vpc_id                  = (local.create_shared && var.vpc_id == "") ? module.shared[0].vpc_id : var.vpc_id
  mysql_security_group_id = (local.create_shared && var.mysql_security_group_id == "") ? module.shared[0].default_security_group_id : var.mysql_security_group_id
  redis_security_group_id = (local.create_shared && var.redis_security_group_id == "") ? module.shared[0].default_security_group_id : var.redis_security_group_id

  pipeline_iam_username = "${var.prefix}-pipeline"
  bucket_iam_username = "${var.prefix}-bucket"
}
