terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  profile = "${var.aws_profile}"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_execution_role}"
  }

}