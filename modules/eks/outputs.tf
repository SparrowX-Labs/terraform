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
  value       = module.eks.eks_managed_node_groups["system"].iam_role_arn
}

output "workload_node_iam_role_arn" {
  description = "IAM role ARN used by the managed node group."
  value       = module.eks.eks_managed_node_groups["workload"].iam_role_arn
}

output "ebs_csi_role_arn" {
  description = "IAM role ARN used by the EBS CSI driver through EKS Pod Identity."
  value       = aws_iam_role.ebs_csi.arn
}

output "aws_load_balancer_controller_role_arn" {
  description = "IAM role ARN used by the AWS Load Balancer Controller through EKS Pod Identity."
  value       = aws_iam_role.aws_load_balancer_controller.arn
}

output "external_dns_role_arn" {
  description = "IAM role ARN used by ExternalDNS through EKS Pod Identity."
  value       = aws_iam_role.external_dns.arn
}

output "cluster_autoscaler_role_arn" {
  description = "IAM role ARN used by Cluster Autoscaler through EKS Pod Identity."
  value       = aws_iam_role.cluster_autoscaler.arn
}

output "external_secrets_role_arn" {
  description = "IAM role ARN used by External Secrets through EKS Pod Identity."
  value       = aws_iam_role.external_secrets.arn
}

output "crossplane_aws_s3_role_arn" {
  description = "IAM role ARN used by the Crossplane AWS S3 provider through EKS Pod Identity."
  value       = aws_iam_role.crossplane_aws_s3.arn
}

output "crossplane_aws_rds_role_arn" {
  description = "IAM role ARN used by the Crossplane AWS RDS provider through EKS Pod Identity."
  value       = aws_iam_role.crossplane_aws_rds.arn
}

output "crossplane_aws_ec2_role_arn" {
  description = "IAM role ARN used by the Crossplane AWS EC2 provider through EKS Pod Identity."
  value       = aws_iam_role.crossplane_aws_ec2.arn
}

output "crossplane_aws_secretsmanager_role_arn" {
  description = "IAM role ARN used by the Crossplane AWS Secrets Manager provider through EKS Pod Identity."
  value       = aws_iam_role.crossplane_aws_secretsmanager.arn
}
