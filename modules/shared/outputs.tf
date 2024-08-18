output "public_subnet_ids" {
  value = length(module.vpc) > 0 ? module.vpc[0].public_subnets : []
}

output "vpc_id" {
  value = length(module.vpc) > 0 ? module.vpc[0].vpc_id : ""
}

output "default_security_group_id" {
  value = length(module.vpc) > 0 ? module.vpc[0].default_security_group_id : ""
}

output "nat_gateway_ips" {
  value = module.vpc[0].nat_public_ips
}

output "db_subnet_group_name" {
  value = length(module.vpc) > 0 ? module.vpc[0].database_subnet_group_name : ""
}

output "private_subnet_ids" {
  value = length(module.vpc) > 0 ? module.vpc[0].private_subnets : []
}

output "route_table_ids" {
  value = length(module.vpc) > 0 ? concat(module.vpc[0].private_route_table_ids, module.vpc[0].public_route_table_ids) : []
}
