provider "aws" {
  region = "us-west-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      name             = var.node_group_name
      instance_types   = var.instance_types
      desired_capacity = var.desired_capacity
    }
  }
}



module "rds" {
    source  = "terraform-aws-modules/rds/aws"
    version = "6.12.0"

    identifier             = var.db_identifier
    engine                 = var.db_engine
    engine_version         = var.db_engine_version
    instance_class         = var.db_instance_class
    allocated_storage      = var.db_storage

    db_name                = var.db_name
    username               = var.db_username
    password               = var.db_password
    vpc_security_group_ids = [aws_security_group.eks_rds_sg.id]
    subnet_ids             = var.subnets

    create_db_subnet_group = true
    family                 = "postgres15"
    major_engine_version   = "15"
}

module "vpc" {
    source          = "terraform-aws-modules/vpc/aws"
    name            = var.vpc_name
    cidr            = var.vpc_cidr
    azs             = var.azs
    public_subnets  = var.public_subnets
    private_subnets = var.private_subnets
    enable_nat_gateway = true
    enable_vpn_gateway = true
    tags = {
        Terraform = "true"
        Environment = "dev"
    }
}