# name                   = "sparrowx-labs-dev"
# vpc_cidr               = "10.20.0.0/16"
# cli_access_role_name   = "eks-admin"
dns_parent_domain      = "mo2cloud.com"
dns_domain             = "prod.mo2cloud.com"
dns_certificate_domain = "*.prod.mo2cloud.com"
private_dns_domain     = "prod.sparrowx.internal"
# azs                    = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

# same order as azs
# public_subnets  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
# private_subnets = ["10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]

# dev: one NAT gateway per AZ
# enable_nat_gateway     = true
# single_nat_gateway     = false
# one_nat_gateway_per_az = true

# enable_dns_hostnames = true
# enable_dns_support   = true

tags = {
  Project     = "sparrowx-labs"
  Environment = "dev"
  ManagedBy   = "terraform"
}
