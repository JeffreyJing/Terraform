variable "ssh_ip" {}

provider "aws" {
    region = "us-west-1"
}

resource "aws_key_pair" "jeff_key" {
    key_name = "jeff_aws_key"
    public_key = file("~/.ssh/my_aws_key.pub")
}

resource "aws_security_group" "jeff_ssh" {
    name        = "jeff_ssh"
    description = "Allow Jeff to SSH"

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${var.ssh_ip}/32"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # "-1" = all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my_ec2" {
    count                  = 2
    ami                    = "ami-038d74967dbfcdee5"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.jeff_ssh.id]
    key_name               = aws_key_pair.jeff_key.key_name
    tags = {
        Name = "Terraform-EC2-${count.index + 1}"
    }
}

resource "aws_ec2_instance_state" "stop_my_ec2" {
    for_each    = { for index, instance in aws_instance.my_ec2 : index => instance }
    instance_id = each.value.id
    state       = "stopped"
}