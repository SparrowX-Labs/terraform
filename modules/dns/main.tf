module "public_zone" {
  source  = "terraform-aws-modules/route53/aws"
  version = "6.5.1"

  name                  = var.domain_name
  comment               = "Public DNS zone for ${var.domain_name}"
  enable_dnssec         = false
  create_dnssec_kms_key = false
  tags                  = var.tags
}

module "private_zone" {
  source  = "terraform-aws-modules/route53/aws"
  version = "6.5.1"

  name         = var.private_domain_name
  comment      = "Private DNS zone for ${var.private_domain_name}"
  private_zone = true
  vpc = {
    eks = {
      vpc_id     = var.private_zone_vpc_id
      vpc_region = var.private_zone_vpc_region
    }
  }
  enable_dnssec         = false
  create_dnssec_kms_key = false
  tags                  = var.tags
}

# Delegate the child zone from the existing parent zone. This is the DNS
# equivalent of transferring traffic to the child zone; no A/ALIAS record is
# needed here.
resource "aws_route53_record" "delegation" {
  zone_id = var.parent_zone_id
  name    = var.domain_name
  type    = "NS"
  ttl     = 300

  records = module.public_zone.name_servers
}

resource "aws_acm_certificate" "this" {
  domain_name       = var.certificate_domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.tags, {
    Name = replace(var.certificate_domain_name, "*.", "wildcard.")
  })
}

resource "aws_route53_record" "certificate_validation" {
  for_each = {
    for option in aws_acm_certificate.this.domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      type   = option.resource_record_type
      record = option.resource_record_value
    }
  }

  zone_id         = module.public_zone.id
  name            = each.value.name
  type            = each.value.type
  ttl             = 60
  records         = [each.value.record]
  allow_overwrite = true

  # The child zone must be delegated before ACM can resolve its validation
  # record through the public DNS hierarchy.
  depends_on = [aws_route53_record.delegation]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn = aws_acm_certificate.this.arn

  validation_record_fqdns = [
    for record in aws_route53_record.certificate_validation : record.fqdn
  ]

  depends_on = [aws_route53_record.delegation]
}
