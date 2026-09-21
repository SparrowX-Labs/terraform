terraform {
  backend "s3" {
    bucket       = "sparrowx-terraform-state-1237712"
    key          = "dev/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
  }
}