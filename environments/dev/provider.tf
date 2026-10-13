terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.7"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}