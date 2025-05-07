module "rds" {
    source                 = "terraform-aws-modules/rds/aws"
    identifier             = var.db_identifier
    engine                 = var.db_engine
    engine_version         = var.db_engine_version
    instance_class         = var.db_instance_class
    allocated_storage      = var.db_storage
    name                   = var.db_name
    username               = var.db_username
    password               = var.db_password
    db_subnet_group_name   = var.db_subnet_group_name
    vpc_security_group_ids = var.vpc_security_group_ids
}