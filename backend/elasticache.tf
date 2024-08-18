resource "aws_elasticache_replication_group" "this" {
  count                    = var.create_elasticache ? 1 : 0
  snapshot_retention_limit = var.elasticache_snapshot_retention_limit
  replication_group_id     = var.elasticache_cluster_name
  engine                   = "redis"
  engine_version           = "7.0"
  node_type                = var.elasticache_node_type
  num_cache_clusters       = 1
  subnet_group_name        = aws_elasticache_subnet_group.this[0].name
  description              = var.elasticache_cluster_name
  tags                     = var.elasticache_tags
  port                     = 6379
  security_group_ids       = var.redis_security_group_ids
}

resource "aws_elasticache_subnet_group" "this" {
  count      = var.create_elasticache ? 1 : 0
  name       = var.elasticache_cluster_name
  subnet_ids = var.elasticache_subnet_ids
  tags       = var.elasticache_tags
}

resource "aws_security_group_rule" "allow_tunnel_elasticache_access" {
  count       = var.create_elasticache && var.create_ec2_tunnel ? length(var.redis_security_group_ids) : 0
  type        = "ingress"
  from_port   = 6379
  to_port     = 6379
  protocol    = "TCP"
  cidr_blocks = ["${aws_instance.tunnel[0].public_ip}/32"]

  security_group_id = var.redis_security_group_ids[count.index]
}
