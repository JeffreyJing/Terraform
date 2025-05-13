env                     = "prod"

vpc_name                = "prod-vpc"
vpc_cidr                = "10.1.0.0/16"
azs                     = ["us-west-2a", "us-west-2b"]
public_subnets          = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets         = ["10.1.3.0/24", "10.1.4.0/24"]

cluster_name            = "prod-eks"
cluster_version         = "1.32"
vpc_id                  = ""  # fill after VPC created
subnets                 = []  # fill with private subnet IDs

node_group_name         = "prod-node-group"
desired_capacity        = 3
instance_types          = ["t3.large"]

db_identifier           = "prod-db"
db_engine               = "postgres"
db_engine_version       = "15.7"
db_instance_class       = "db.t3.medium"
db_storage              = 50
db_name                 = "prod_app_db"
db_username             = var.db_username
db_password             = var.db_password
