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

  access_entries = {
    cli_access = {
      principal_arn = data.aws_iam_role.cli_access.arn

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
      configuration_values = jsonencode({
        env = {
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
    eks-pod-identity-agent = {
      before_compute = true
    }
    aws-ebs-csi-driver = {
      namespace_config = {
        namespace = "kube-system"
      }

      pod_identity_association = [
        {
          service_account = "ebs-csi-controller-sa"
          role_arn        = aws_iam_role.ebs_csi.arn
        }
      ]
    }
  }

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    system = {
      subnet_ids = var.private_subnet_ids
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
      subnet_ids             = var.private_subnet_ids
      vpc_security_group_ids = [aws_security_group.workload_nodes.id]
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

resource "aws_security_group" "workload_nodes" {
  name        = "${var.name}-workload-nodes"
  description = "Additional security group for workload nodes"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL from private VPC subnets"
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = var.private_subnet_cidrs
  }

  egress {
    description = "Allow workload node egress"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.name}-workload-nodes"
  })
}
