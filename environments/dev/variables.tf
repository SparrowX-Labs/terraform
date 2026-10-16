variable "name" {
  description = "Name assigned to the VPC and its related resources."
  type        = string
}

variable "cli_access_role_name" {
  description = "IAM role name used for local CLI access to the EKS cluster."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block assigned to the VPC."
  type        = string
}

variable "azs" {
  description = "Availability Zones used by the VPC subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets, in the same order as azs."
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets, in the same order as azs."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT gateways for private subnet egress."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to create a single NAT gateway for all private subnets."
  type        = bool
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Whether to create one NAT gateway in each Availability Zone."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether DNS support is enabled in the VPC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the VPC and related resources."
  type        = map(string)
  default     = {}
}
