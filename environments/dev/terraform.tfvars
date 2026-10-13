name     = "sparrowx-labs-dev"
vpc_cidr = "10.0.0.0/16"
azs      = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

# same order as azs
public_subnets  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
private_subnets = ["10.0.14.0/24", "10.0.15.0/24", "10.0.16.0/24"]

# dev: one NAT gateway per AZ
enable_nat_gateway     = true
single_nat_gateway     = false
one_nat_gateway_per_az = true

enable_dns_hostnames = true
enable_dns_support   = true

tags = {
  Project     = "sparrowx-labs"
  Environment = "dev"
  ManagedBy   = "terraform"
}