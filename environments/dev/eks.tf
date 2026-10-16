module "eks" {
  source = "../../modules/eks"

  name                 = var.name
  kubernetes_version   = "1.37"
  cli_access_role_name = var.cli_access_role_name

  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids

  # EKS Managed Node Group(s)
  system_ami_type       = "AL2023_x86_64_STANDARD"
  system_instance_types = ["t3.medium"]
  system_min_size       = 2
  system_max_size       = 4
  system_desired_size   = 2

  workload_ami_type       = "AL2023_x86_64_STANDARD"
  workload_instance_types = ["t3.medium"]
  workload_min_size       = 2
  workload_max_size       = 4
  workload_desired_size   = 2

  tags = var.tags
}
