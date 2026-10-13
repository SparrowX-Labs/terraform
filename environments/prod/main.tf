module "network" {
  source = "../../modules/network"

  name = "sparrowx-prod-vpc"

  vpc_cidr = "10.10.0.0/16"

  azs = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c",
  ]

  public_subnets = [
    "10.10.1.0/24",
    "10.10.2.0/24",
    "10.10.3.0/24",
  ]

  private_subnets = [
    "10.10.4.0/24",
    "10.10.5.0/24",
    "10.10.6.0/24",
  ]

  tags = {
    Project     = "sparrowx"
    Environment = "prod"
    Terraform   = "true"
  }
}
