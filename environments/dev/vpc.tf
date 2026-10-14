module "network" {
  source = "../../modules/network"

  name = var.name

  vpc_cidr = var.vpc_cidr

  azs = var.azs

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = var.tags
}

# Subnet Tags for EKS

resource "aws_ec2_tag" "public_subnet_elb" {
  for_each = toset(module.network.public_subnet_ids)

  resource_id = each.value
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "private_subnet_internal_elb" {
  for_each = toset(module.network.private_subnet_ids)

  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "public_subnet_cluster" {
  for_each = toset(module.network.public_subnet_ids)

  resource_id = each.value
  key         = "kubernetes.io/cluster/${var.name}"
  value       = "shared"
}

resource "aws_ec2_tag" "private_subnet_cluster" {
  for_each = toset(module.network.private_subnet_ids)

  resource_id = each.value
  key         = "kubernetes.io/cluster/${var.name}"
  value       = "shared"
}
