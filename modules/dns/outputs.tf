output "zone_id" {
  description = "ID of the public child hosted zone."
  value       = module.public_zone.id
}

output "name_servers" {
  description = "Name servers to which the parent zone delegates the child zone."
  value       = module.public_zone.name_servers
}

output "certificate_arn" {
  description = "Validated ACM certificate ARN."
  value       = aws_acm_certificate_validation.this.certificate_arn
}

output "certificate_domain_name" {
  description = "Domain name covered by the ACM certificate."
  value       = var.certificate_domain_name
}

output "private_zone_id" {
  description = "ID of the private hosted zone associated with the EKS VPC."
  value       = module.private_zone.id
}
