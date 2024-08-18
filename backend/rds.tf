module "aurora_mysql" {
  count  = var.create_mysql ? 1 : 0
  source = "terraform-aws-modules/rds-aurora/aws"

  name                           = var.mysql_cluster_name
  engine                         = "aurora-mysql"
  engine_mode                    = "provisioned"
  engine_version                 = "8.0.mysql_aurora.3.05.2"
  storage_encrypted              = true
  master_username                = var.mysql_username
  master_password                = random_password.db_master_pass[0].result
  create_monitoring_role         = true
  vpc_id                         = var.mysql_vpc_id
  db_subnet_group_name           = var.mysql_subnet_group_name
  copy_tags_to_snapshot          = true
  deletion_protection            = true
  allow_major_version_upgrade    = false
  enable_global_write_forwarding = false
  manage_master_user_password    = false
  ca_cert_identifier             = "rds-ca-rsa4096-g1"

  #  monitoring_role_arn            = "arn:aws:iam::893351006270:role/rds-monitoring-role"

  enabled_cloudwatch_logs_exports = [
    "error",
    "slowquery"
  ]
  preferred_backup_window      = var.mysql_preferred_backup_window
  preferred_maintenance_window = var.mysql_preferred_maintenance_window
  backup_retention_period      = var.mysql_backup_retention_period

  create_security_group  = false
  vpc_security_group_ids = var.mysql_security_group_ids

  monitoring_interval = 60
  skip_final_snapshot = true

  serverlessv2_scaling_configuration = {
    min_capacity = var.mysql_min_capacity
    max_capacity = var.mysql_max_capacity
  }

  instance_class = "db.serverless"
  instances = {
    (var.mysql_instance_name) = {
      publicly_accessible          = true
      promotion_tier               = 1
      preferred_maintenance_window = var.mysql_preferred_maintenance_window
      copy_tags_to_snapshot        = false
    }
  }

  tags = var.mysql_tags
}

resource "aws_security_group_rule" "allow_tunnel_rds_access" {
  count       = var.create_mysql && var.create_ec2_tunnel ? length(var.mysql_security_group_ids) : 0
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "TCP"
  cidr_blocks = ["${aws_instance.tunnel[0].public_ip}/32"]

  security_group_id = var.mysql_security_group_ids[count.index]
}
