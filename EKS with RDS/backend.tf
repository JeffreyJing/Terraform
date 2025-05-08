terraform {
  backend "s3" {
    bucket = "jeffs-eks-terraform-state"
    key    = "eks/dev/terraform.tfstate"
    region = "us-west-1"
  }
}