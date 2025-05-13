# This file defines and stores variable values for the dev environment.
# Some variables like vpc_id, subnets, subnet_ids, etc. require values 
# after resources are created. In order to create them successfully,
# run `terraform apply -target=module.<label>` to target subsections
# of main.tf to create items needed first.

env                     = "dev"

vpc_name                = "dev-vpc"
vpc_cidr                = "10.0.0.0/16"
azs                     = ["us-west-1a", "us-west-1b"]
public_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets         = ["10.0.3.0/24", "10.0.4.0/24"]

cluster_name            = "dev-eks"
cluster_version         = "1.32"
vpc_id                  = "vpc-007fb033b3dc7d285" # Change this field to your own VPC ID that is outputted
subnets                 = ["subnet-0bef5825725d3af04", "subnet-0b4457edc957c468a"] # Change this field to your own subnets that is outputted

node_group_name         = "dev-node-group"
desired_capacity        = 3
instance_types          = ["t2.nano"]

db_identifier           = "dev-db"
db_engine               = "postgres"
db_engine_version       = "15.7"
db_instance_class       = "db.t3.micro"
db_storage              = 20
db_name                 = "app_db"
db_username             = var.db_username
db_password             = var.db_password
