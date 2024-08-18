module "shared" {
  count  = local.create_shared ? 1 : 0
  source = "../shared"
  prefix = var.prefix
  region = var.region

  # VPC
  create_vpc           = var.create_vpc
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs

}
