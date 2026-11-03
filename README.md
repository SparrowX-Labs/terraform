# Terraform AWS foundation

Terraform provisions the shared AWS foundation for the SparrowX EKS platform. The `dev` environment owns the VPC, subnets, NAT gateways, EKS cluster, IAM roles, DNS, and cluster access outputs. The `prod` environment reuses the development cluster and remote-state outputs for environment DNS rather than creating a second cluster.

This reflects the delivered architecture: `dev` and `prod` are isolated Kubernetes namespaces on one EKS cluster. The original two-cluster target remains represented by the modular structure, but was not needed for the completed demonstration.

## Layout

- `modules/network`: VPC and subnet foundation.
- `modules/eks`: EKS cluster, node groups, IAM, and pod identity.
- `modules/dns`: Route 53 zones and ACM DNS validation.
- `modules/cloudfront`: optional edge certificate resources.
- `environments/dev` and `environments/prod`: environment roots and state configuration.

Run Terraform from an environment directory with the required AWS credentials and `terraform.tfvars`; state is stored in the configured S3 backend.

## GitHub Actions configuration

Terraform uses repository-level variables in this repository, separate from the EKS Helm Charts repository: `AWS_ACCOUNT_ID`, `AWS_REGION`, and `AWS_ROLE_NAME`. The role is assumed through GitHub OIDC and must manage the Terraform state bucket and foundation resources. No long-lived AWS keys are required. `dev/terraform.tfvars` contains VPC, EKS, DNS, subnet, NAT, and tagging inputs; `prod/terraform.tfvars` contains production DNS inputs and reads the shared cluster VPC from dev remote state.

## License

See [LICENSE.md](LICENSE.md).
