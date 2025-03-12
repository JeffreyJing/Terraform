variable "ssh_ip" {}
provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "my_first_ec2" {
    ami           = "ami-038d74967dbfcdee5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jeff_ssh.id]
    tags = {
        Name = "1st EBS-Terraform-EC2 Demo Machine"
    }
}

resource "aws_instance" "my_second_ec2" {
    ami           = "ami-038d74967dbfcdee5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jeff_ssh.id]
    tags = {
        Name = "2nd EBS-Terraform-EC2 Demo Machine"
    }
}

resource "aws_security_group" "jeff_ssh" {
    name = "jeff_ssh"
    description = "allow jeff to ssh"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["${var.ssh_ip}/32"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}