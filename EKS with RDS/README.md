This is a modular Terraform configuration that deploys an EKS cluster and connects it to a PostgreSQL RDS instance.

---

**How to Run**

1. Initially, the environment variable files will be missing some values that depend on the VPC module.

   Run the following to apply only the VPC module and generate required outputs (`vpc_id`, `subnet_ids`):

   ```bash
   terraform apply -target=module.vpc -var-file="environments/dev/terraform.tfvars"

2. Paste the results of the outputted values from 1. into either the dev or prod environment variables.

3. Run the following to create your EKS and RDS cluster:

   ```bash
   terraform apply -var-file="environments/dev/terraform.tfvars"



**Contents**

- [Environments](./environments)
   
  This directory contains hardcoded environment variables for the [dev](./environments/dev) and [prod](./environments/prod) environments.
  
  To apply an environment, run:
  
  `terraform apply -var-file="environments/dev/terraform.tfvars"` (or swap `dev` with `prod`).

- [Modules](./modules)
  
  This directory is currently unused, as modules are sourced from the [Terraform Registry](https://registry.terraform.io/).  
  It’s reserved for future modularization if needed.

- [backend.tf](./backend.tf)
  
  This file saves the Terraform state to AWS S3.
  
- [main.tf](./main.tf)
  
  This is the main Terraform file that contains all modules that will be executed to build out your AWS cloud infrastructure with all the necessary components.

- [outputs.tf](./outputs.tf)
  
  outputs.tf is an executable that will output the values of the VPC, Security Groups, and subnets that are needed before the creation of the EKS Cluster and RDS instance.

- [security.tf](./security.tf)
  
  This file contains all of the security components that will be created for your cloud infrastructure.
  
- [variables.tf](./variables.tf)

  variables.tf contains a declaration of all the necessary variables for each instance of the entire application. 

- [version.tf](./version.tf)

  Contains the version of Terraform software and AWS configurations.
