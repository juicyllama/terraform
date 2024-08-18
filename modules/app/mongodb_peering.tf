resource "mongodbatlas_network_peering" "peering" {
  count                  = var.create_vpc ? 1 : 0
  accepter_region_name   = var.region
  project_id             = var.mongodb_atlas_project_id
  container_id           = "64fbfc062bcb7f05aee2ab93"
  provider_name          = "AWS"
  route_table_cidr_block = var.vpc_cidr
  vpc_id                 = local.vpc_id
  aws_account_id         = data.aws_caller_identity.current.account_id
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  count                     = var.create_vpc ? 1 : 0
  vpc_peering_connection_id = mongodbatlas_network_peering.peering[0].connection_id
  auto_accept               = true
}

resource "aws_route" "peer_access" {
  count                     = var.create_vpc ? length(module.shared[0].route_table_ids) : 0
  route_table_id            = module.shared[0].route_table_ids[count.index]
  destination_cidr_block    = "10.8.0.0/21"
  vpc_peering_connection_id = mongodbatlas_network_peering.peering[0].connection_id
  depends_on                = [aws_vpc_peering_connection_accepter.peer[0]]
}
