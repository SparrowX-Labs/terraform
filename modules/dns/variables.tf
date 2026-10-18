variable "domain_name" {
  description = "Public DNS name of the child hosted zone."
  type        = string
}

variable "parent_zone_id" {
  description = "Route 53 zone ID of the existing parent public hosted zone."
  type        = string
}

variable "certificate_domain_name" {
  description = "Domain name covered by the ACM certificate."
  type        = string
}

variable "private_domain_name" {
  description = "Private DNS zone name associated with the EKS VPC."
  type        = string
}

variable "private_zone_vpc_id" {
  description = "VPC ID associated with the private hosted zone."
  type        = string
}

variable "private_zone_vpc_region" {
  description = "AWS region of the VPC associated with the private hosted zone."
  type        = string
}

variable "tags" {
  description = "Tags applied to DNS resources."
  type        = map(string)
  default     = {}
}
