

terraform {
  backend "s3" {
    bucket         = "terraform-state-1406"
    key            = "Terraform/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
    encrypt        = true
  }
}