output "vpc_id" {
  description = "ID of the dev VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the dev public subnets."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the dev private subnets."
  value       = module.network.private_subnet_ids
}

output "cluster_name" {
  description = "Name of the dev EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint of the dev EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "ARN of the dev EKS cluster."
  value       = module.eks.cluster_arn
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN of the dev EKS cluster."
  value       = module.eks.oidc_provider_arn
}

output "dns_zone_id" {
  description = "ID of the public dev.mo2cloud.com hosted zone."
  value       = module.dns.zone_id
}

output "dns_name_servers" {
  description = "Name servers used by the delegated dev.mo2cloud.com zone."
  value       = module.dns.name_servers
}

output "acm_certificate_arn" {
  description = "Validated ACM certificate ARN for *.dev.mo2cloud.com."
  value       = module.dns.certificate_arn
}

output "private_dns_zone_id" {
  description = "ID of the private dev.internal hosted zone."
  value       = module.dns.private_zone_id
}
