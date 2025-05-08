module "rds_internal" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.12.0"

  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_ids             = var.subnets
  create_db_subnet_group = true
  family                 = "postgres14"
  major_engine_version   = "14"
}