module "vpc" {
  count   = var.create_vpc ? 1 : 0
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                         = var.prefix
  cidr                         = var.vpc_cidr
  azs                          = local.azs
  public_subnets               = local.public_subnets_cidrs
  database_subnets             = local.database_subnets_ciders
  private_subnets              = local.private_subnets_ciders
  enable_ipv6                  = false
  enable_dns_hostnames         = true
  enable_dns_support           = true
  enable_nat_gateway           = true
  enable_vpn_gateway           = false
  single_nat_gateway           = true
  map_public_ip_on_launch      = true
  create_database_subnet_group = true
  database_subnet_group_name   = "${var.prefix}-dbsubnet"
  default_security_group_name  = "default"
  default_route_table_name     = "${var.prefix}-public"
}

resource "aws_security_group_rule" "allow_local_rds_access" {
  count       = var.create_vpc ? 1 : 0
  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "TCP"
  cidr_blocks = [var.vpc_cidr]

  security_group_id = module.vpc[0].default_security_group_id
}

resource "aws_security_group_rule" "allow_local_elasticache_access" {
  count       = var.create_vpc ? 1 : 0
  type        = "ingress"
  from_port   = 6379
  to_port     = 6379
  protocol    = "TCP"
  cidr_blocks = [var.vpc_cidr]

  security_group_id = module.vpc[0].default_security_group_id
}

resource "aws_security_group_rule" "ingress_security_groups_mq" {
  count       = var.create_vpc ? 1 : 0
  type        = "ingress"
  from_port   = 5671
  to_port     = 5671
  protocol    = "TCP"
  cidr_blocks = [var.vpc_cidr]

  security_group_id = module.vpc[0].default_security_group_id
}

resource "aws_security_group_rule" "allow_all_egress_access" {
  count       = var.create_vpc ? 1 : 0
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = module.vpc[0].default_security_group_id
}
