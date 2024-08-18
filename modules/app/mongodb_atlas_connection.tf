data "mongodbatlas_serverless_instances" "mongodb" {
  count      = var.connect_to_mongodb ? 1 : 0
  project_id = var.mongodb_atlas_project_id
}

resource "mongodbatlas_project_ip_access_list" "data_lake_ip_access_list" {
  count      = length(module.shared) > 0 && var.connect_to_mongodb ? length(module.shared[0].nat_gateway_ips) : 0
  project_id = var.mongodb_atlas_project_id
  ip_address = module.shared[0].nat_gateway_ips[count.index]
  comment    = "IP address for ${var.prefix} network"
}

resource "mongodbatlas_project_ip_access_list" "data_lake_cidr_block" {
  count      = length(module.shared) > 0 && var.connect_to_mongodb ? 1 : 0
  project_id = var.mongodb_atlas_project_id
  cidr_block = var.vpc_cidr
  comment    = "CIDR range for ${var.prefix} network"
}

resource "mongodbatlas_project_ip_access_list" "data_lake_ip_tunnel" {
  count      = length(module.backend) > 0 && var.connect_to_mongodb ? (module.backend[0].tunnel_ip != "" ? 1 : 0) : 0
  project_id = var.mongodb_atlas_project_id
  ip_address = module.backend[0].tunnel_ip
  comment    = "IP address for ${var.prefix} tunnel"
}
