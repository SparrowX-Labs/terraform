variable "dns_parent_domain" {
  description = "Existing public parent domain whose Route 53 zone delegates the environment zone."
  type        = string
}

variable "dns_domain" {
  description = "Public DNS zone created for this environment."
  type        = string
}

variable "dns_certificate_domain" {
  description = "Domain name covered by the environment ACM certificate."
  type        = string
}

variable "private_dns_domain" {
  description = "Private DNS zone name associated with the EKS VPC."
  type        = string
}

variable "tags" {
  description = "Tags applied to the VPC and related resources."
  type        = map(string)
  default     = {}
}
