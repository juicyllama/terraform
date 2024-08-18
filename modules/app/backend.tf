module "backend" {
  count  = length(var.backends)
  source = "../backend"

  # Elasticache
  create_elasticache                   = lookup(var.backends[count.index], "elasticache", null) == null ? false : true
  elasticache_cluster_name             = lookup(lookup(var.backends[count.index], "elasticache", {}), "cluster_name", "")
  elasticache_node_type                = lookup(lookup(var.backends[count.index], "elasticache", {}), "node_type", "cache.t3.micro")
  elasticache_tags                     = lookup(lookup(var.backends[count.index], "elasticache", {}), "tags", {})
  elasticache_snapshot_retention_limit = lookup(lookup(var.backends[count.index], "elasticache", {}), "snapshot_retention_limit", 0)
  elasticache_subnet_ids               = local.private_subnet_ids

  # Elastic Beanstalk
  create_elastic_beanstalk = lookup(var.backends[count.index], "elastic_beanstalk", null) == null ? false : true
  eb_stack_name            = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "stack_name", "64bit Amazon Linux 2 v5.8.4 running Node.js 18")
  eb_ami_id                = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "ami_id", "")
  eb_app_name              = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "app_name", "API")
  eb_env_name              = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "env_name", "API-ENV")
  create_eb_iam_profile    = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "create_eb_iam_profile", false)
  eb_env_vars              = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "env_vars", {})
  domain                   = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "domain", "")
  eb_instance_type         = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "instance_type", "t4g.micro")
  zone_id                  = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "zone_id", "")
  key_pair_name            = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "key_pair", "")
  eb_max_size              = lookup(lookup(var.backends[count.index], "elastic_beanstalk", {}), "eb_max_size", 2)
  eb_subnet_ids            = local.private_subnet_ids
  lb_subnet_ids            = local.subnet_ids

  # Secrets Manager
  doppler_secrets = lookup(var.backends[count.index], "doppler_secrets", [])

  # AWS Tunnel
  create_ec2_tunnel     = lookup(var.backends[count.index], "tunnel", null) == null ? false : true
  tunnel_subnet_id      = local.subnet_ids[1]
  tunnel_instance_tags  = lookup(lookup(var.backends[count.index], "tunnel", {}), "tags", {})
  tunnel_sg_description = lookup(lookup(var.backends[count.index], "tunnel", {}), "sg_description", "")
  tunnel_ami            = lookup(lookup(var.backends[count.index], "tunnel", {}), "ami_id", "ami-08cd358d745620807")
  tunnel_type           = lookup(lookup(var.backends[count.index], "tunnel", {}), "instance_type", "t2.micro")
  vpc_id                = local.vpc_id

  # MySQL
  create_mysql                       = lookup(var.backends[count.index], "rds", null) == null ? false : true
  mysql_vpc_id                       = local.vpc_id
  mysql_username                     = lookup(lookup(var.backends[count.index], "rds", {}), "master_username", "admin")
  mysql_cluster_name                 = lookup(lookup(var.backends[count.index], "rds", {}), "cluster_name", "juicyllama")
  mysql_instance_name                = lookup(lookup(var.backends[count.index], "rds", {}), "instance_name", "shared-instance-1")
  mysql_min_capacity                 = lookup(lookup(var.backends[count.index], "rds", {}), "min_capacity", 1)
  mysql_max_capacity                 = lookup(lookup(var.backends[count.index], "rds", {}), "max_capacity", 2)
  mysql_tags                         = lookup(lookup(var.backends[count.index], "rds", {}), "tags", {})
  mysql_preferred_maintenance_window = lookup(lookup(var.backends[count.index], "rds", {}), "preferred_maintenance_window", "thu:00:31-thu:01:01")
  mysql_preferred_backup_window      = lookup(lookup(var.backends[count.index], "rds", {}), "preferred_backup_window", "03:02-03:32")
  mysql_backup_retention_period      = lookup(lookup(var.backends[count.index], "rds", {}), "backup_retention_period", 7)
  mysql_subnet_group_name            = local.db_subnet_group_name
  mysql_security_group_ids = [
    local.mysql_security_group_id
  ]
  redis_security_group_ids = [
    local.redis_security_group_id
  ]
}
