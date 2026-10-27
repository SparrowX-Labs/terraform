terraform {
  backend "s3" {
    bucket       = "sparrowx-terraform-state-1237712"
    key          = "prod/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}

// Reading outputs from dev env
data "terraform_remote_state" "dev" {
  backend = "s3"

  config = {
    bucket = "sparrowx-terraform-state-1237712"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}