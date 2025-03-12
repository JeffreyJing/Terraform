main.tf is the first Terraform file I created. 


Objective:
create a Terraform file that creates two t2.micro ec2 instances in my AWS account (success)



Note: 
Although main.tf successfully creates two ec2 instances in the AWS account, it is now impossible to ssh into either of the two ec2 instances. 
When spinning up new ec2's manually, AWS will provide a .pem file that allows ssh access into the new instance. Spinning up an ec2 with Terraform skips this step, causing one to be locked out of ssh-ing into this instance. 