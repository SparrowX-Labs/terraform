data "aws_iam_role" "cli_access" {
  name = var.cli_access_role_name
}

resource "aws_iam_role" "ebs_csi" {
  name               = "${var.name}-ebs-csi"
  assume_role_policy = data.aws_iam_policy_document.pod_identity_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "aws_load_balancer_controller" {
  name               = "${var.name}-aws-load-balancer-controller"
  assume_role_policy = data.aws_iam_policy_document.pod_identity_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "external_dns" {
  name               = "${var.name}-external-dns"
  assume_role_policy = data.aws_iam_policy_document.pod_identity_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "cluster_autoscaler" {
  name               = "${var.name}-cluster-autoscaler"
  assume_role_policy = data.aws_iam_policy_document.pod_identity_assume_role.json

  tags = var.tags
}

resource "aws_iam_role" "external_secrets" {
  name               = "${var.name}-external-secrets"
  assume_role_policy = data.aws_iam_policy_document.pod_identity_assume_role.json

  tags = var.tags
}

resource "aws_eks_pod_identity_association" "aws_load_balancer_controller" {
  cluster_name    = var.name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.aws_load_balancer_controller.arn
}

resource "aws_eks_pod_identity_association" "external_dns" {
  cluster_name    = var.name
  namespace       = "external-dns"
  service_account = "external-dns"
  role_arn        = aws_iam_role.external_dns.arn
}

resource "aws_eks_pod_identity_association" "cluster_autoscaler" {
  cluster_name    = var.name
  namespace       = "kube-system"
  service_account = "cluster-autoscaler"
  role_arn        = aws_iam_role.cluster_autoscaler.arn
}

resource "aws_eks_pod_identity_association" "external_secrets" {
  cluster_name    = var.name
  namespace       = "external-secrets"
  service_account = "external-secrets"
  role_arn        = aws_iam_role.external_secrets.arn
}
