data "aws_route53_zone" "parent" {
  name         = var.dns_parent_domain
  private_zone = false
}

module "dns" {
  source = "../../modules/dns"

  domain_name             = var.dns_domain
  parent_zone_id          = data.aws_route53_zone.parent.zone_id
  certificate_domain_name = var.dns_certificate_domain
  private_domain_name     = var.private_dns_domain
  private_zone_vpc_id     = module.network.vpc_id
  private_zone_vpc_region = "eu-west-1"
  tags                    = var.tags
}
