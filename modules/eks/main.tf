module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.name
  kubernetes_version = var.kubernetes_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  control_plane_subnet_ids = var.private_subnet_ids

  endpoint_private_access = true
  endpoint_public_access  = true
  # Enabling Public Access for testing only, later it should be limited through CIDR
  # Or disabled and use vpn / bastion host instead
  # endpoint_public_access_cidrs

  authentication_mode                      = "API_AND_CONFIG_MAP"
  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns                = {}
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
    eks-pod-identity-agent = {
      before_compute = true
    }
    aws-ebs-csi-driver = {}
  }

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    system = {
      subnet_ids     = var.private_subnet_ids
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = var.system_ami_type
      instance_types = var.system_instance_types

      min_size     = var.system_min_size
      max_size     = var.system_max_size
      desired_size = var.system_desired_size

      labels = {
        role = "system"
      }

      taints = {
        system = {
          key    = "dedicated"
          value  = "system"
          effect = "NO_SCHEDULE"
        }
      }
    }

    workload = {
      subnet_ids     = var.private_subnet_ids
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = var.workload_ami_type
      instance_types = var.workload_instance_types

      min_size     = var.workload_min_size
      max_size     = var.workload_max_size
      desired_size = var.workload_desired_size

      labels = {
        role = "workload"
      }
    }
  }

  tags = var.tags
}
