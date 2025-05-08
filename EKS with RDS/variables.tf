# General 
variable "env" {}

# EKS Cluster + Node Group
variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnets" {
    type = list(string)
}

variable "node_group_name" {}     
variable "desired_capacity" {}
variable "instance_types" {
    type = list(string)
}

# RDS
variable "db_identifier" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_storage" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

# VPC 
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "azs" {
    type = list(string)
}
variable "public_subnets" {
    type = list(string)
}
variable "private_subnets" {
    type = list(string)
}