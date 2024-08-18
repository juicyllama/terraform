locals {
  azs = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets_cidrs = var.create_vpc ? [
    cidrsubnet(var.vpc_cidr, "4", "1"),
    cidrsubnet(var.vpc_cidr, "4", "2"),
    cidrsubnet(var.vpc_cidr, "4", "0"),
  ] : var.public_subnets_cidrs
  database_subnets_ciders = var.create_vpc ? [
    cidrsubnet(var.vpc_cidr, "4", "3"),
    cidrsubnet(var.vpc_cidr, "4", "4"),
    cidrsubnet(var.vpc_cidr, "4", "5")
  ] : var.public_subnets_cidrs

  private_subnets_ciders = var.create_vpc ? [
    cidrsubnet(var.vpc_cidr, "4", "6"),
    cidrsubnet(var.vpc_cidr, "4", "7"),
    cidrsubnet(var.vpc_cidr, "4", "8")
  ] : var.public_subnets_cidrs
  public_subnets_cidrs_new = var.create_vpc ? [
    cidrsubnet("10.31.0.0/16", "4", "1"),
    cidrsubnet("10.31.0.0/16", "4", "2"),
    cidrsubnet("10.31.0.0/16", "4", "0"),
  ] : var.public_subnets_cidrs
  database_subnets_ciders_new = var.create_vpc ? [
    cidrsubnet("10.31.0.0/16", "4", "3"),
    cidrsubnet("10.31.0.0/16", "4", "4"),
    cidrsubnet("10.31.0.0/16", "4", "5")
  ] : var.public_subnets_cidrs

  private_subnets_ciders_new = var.create_vpc ? [
    cidrsubnet("10.31.0.0/16", "4", "6"),
    cidrsubnet("10.31.0.0/16", "4", "7"),
    cidrsubnet("10.31.0.0/16", "4", "8")
  ] : var.public_subnets_cidrs
}
