This is a modular Terraform configuration that deploys an EKS cluster and connects it to a PostgreSQL RDS instance.

---

**How to Run**

1. Initially, the environment variable files will be missing some values that depend on the VPC module.

   Run the following to apply only the VPC module and generate required outputs (`vpc_id`, `subnet_ids`):

   ```bash
   terraform apply -target=module.vpc -var-file="environments/dev/terraform.tfvars"


**Contents**

- [Environments](./environments)  
  This directory contains hardcoded environment variables for the [dev](./environments/dev) and [prod](./environments/prod) environments.
  
  To apply an environment, run:
  
  `terraform apply -var-file="environments/dev/terraform.tfvars"` (or swap `dev` with `prod`).

- [Modules](./modules)  
  This directory is currently unused, as modules are sourced from the [Terraform Registry](https://registry.terraform.io/).  
  It’s reserved for future modularization if needed.

- [backend.tf](./backend.tf)
