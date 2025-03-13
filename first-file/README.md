main.tf is the first Terraform file I created. 


**Objective:**

Create a Terraform file that creates two t2.micro ec2 instances in my AWS account (success)



**Note:**

I enabled AWS SSO for authentication to provide credentials for Terraform.

Both the ssh key and the security group are needed in order to successfully ssh into either machine.

I created an instance state object to be able to start and stop the ec2 instances.

Run terraform apply -var="ssh_ip=<YOUR_IP>" to be able to ssh from your IP. 

**curl ifconfig.me** to get YOUR_IP.
