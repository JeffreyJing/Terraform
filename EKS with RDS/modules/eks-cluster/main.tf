module "eks_internal" {
    source          = "terraform-aws-modules/eks/aws"
    cluster_name    = var.cluster_name
    cluster_version = var.cluster_version
    vpc_id          = var.vpc_id
    subnets         = var.subnets
}