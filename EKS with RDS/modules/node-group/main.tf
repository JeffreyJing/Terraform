module "node_group" {
    source           = "terraform-aws-modules/eks/aws//modules/node_group"
    cluster_name     = var.cluster_name
    node_group_name  = var.node_group_name
    subnet_ids       = var.subnet_ids 
    desired_capacity = var.desired_capacity
    instance_types   = var.instance_types
}