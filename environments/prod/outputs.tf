output "vpc_id" {
  description = "ID of the prod VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the prod public subnets."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the prod private subnets."
  value       = module.network.private_subnet_ids
}
