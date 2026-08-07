# Day 2 - Terraform EC2 with Variables and Outputs

## Objective
Learn how to create reusable Terraform code using variables and outputs.

## AWS Services
- EC2

## What I Built
- Created 3 EC2 instances:
  - dev
  - test
  - prod
- Used variable.tf to define input variables.
- Used terraform.tfvars to provide variable values.
- Used output.tf to display:
  - Instance IDs
  - Public IP addresses
- Added tags to identify each instance.

## Files
- provider.tf
- main.tf
- variable.tf
- terraform.tfvars.example
- output.tf

## Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
