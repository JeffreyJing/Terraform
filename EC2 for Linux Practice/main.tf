provider "aws" {
    region = "us-west-1"
}

resource "aws_key_pair" "macbook_key" {
    key_name   = "my_aws_key"
    public_key = file("~/.ssh/my_aws_key.pub")
}

resource "aws_security_group" "allow_ssh_to_linux" {
    name        = "allow_ssh_to_linux"
    description = "Allow SSH inbound traffic to the learning Linux machine"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "linux_learning_vm" {
    ami                         = "ami-05cb9251eea88c2ef"
    instance_type               = "t3.micro"
    key_name                    = aws_key_pair.macbook_key.key_name
    vpc_security_group_ids      = [aws_security_group.allow_ssh_to_linux.id]
    associate_public_ip_address = true

    tags = {
        Name = "FreeTierLinuxForLearning"
    }
}

# resource "aws_ec2_instance_state" "stop_linux_vm" {
#   instance_id = aws_instance.linux_learning_vm.id
#   state       = "stopped"
# }