output "eb_app_name" {
  value = length(aws_elastic_beanstalk_application.api) > 0 ? aws_elastic_beanstalk_application.api[0].name : ""
}

output "eb_env_name" {
  value = length(aws_elastic_beanstalk_environment.api) > 0 ? aws_elastic_beanstalk_environment.api[0].name : ""
}

output "eb_cname" {
  value = length(aws_elastic_beanstalk_environment.api) > 0 ? aws_elastic_beanstalk_environment.api[0].cname : ""
}

output "doppler_secrets_length" {
  value = length(var.doppler_secrets)
}

output "tunnel_ip" {
  value = length(aws_instance.tunnel) > 0 ? aws_instance.tunnel[0].public_ip : ""
}

output "REDIS_HOST" {
  value = length(aws_elasticache_replication_group.this) > 0 ? aws_elasticache_replication_group.this[0].primary_endpoint_address : ""
}

output "REDIS_PORT" {
  value = length(aws_elasticache_replication_group.this) > 0 ? aws_elasticache_replication_group.this[0].port : 6379
}

output "MYSQL_HOSTNAME" {
  value = length(module.aurora_mysql) > 0 ? module.aurora_mysql[0].cluster_endpoint : ""
}

output "MYSQL_PORT" {
  value = length(module.aurora_mysql) > 0 ? module.aurora_mysql[0].cluster_port : 3306
}

output "MYSQL_USERNAME" {
  value = length(module.aurora_mysql) > 0 ? module.aurora_mysql[0].cluster_master_username : ""
}
