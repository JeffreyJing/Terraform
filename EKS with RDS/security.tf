resource "aws_security_group" "eks_rds_sg" {
    name = "eks-rds-sg-${var.env}"
    description = "Allow EKS and RDS communication"
    vpc_id = var.vpc_id

    ingress {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "eks-rds-sg"
    }
}

resource "aws_security_group_rule" "allow_eks_api_from_local" {
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["104.33.79.186/32"]  # Replace with your public IP
    security_group_id = module.eks.cluster_security_group_id
}