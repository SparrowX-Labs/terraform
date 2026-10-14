output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "EKS Kubernetes API endpoint."
  value       = module.eks.cluster_endpoint
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN for workload IAM integrations."
  value       = module.eks.oidc_provider_arn
}

output "system_node_iam_role_arn" {
  description = "IAM role ARN used by the managed node group."
  value       = module.eks.eks_managed_node_groups["system_node_group"].iam_role_arn
}

output "workload_node_iam_role_arn" {
  description = "IAM role ARN used by the managed node group."
  value       = module.eks.eks_managed_node_groups["workload_node_group"].iam_role_arn
}
