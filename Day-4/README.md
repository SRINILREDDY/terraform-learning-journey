# Terraform VPC Module

Created an AWS VPC using Terraform modules.

## Resources

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- NAT Gateway

## Structure

```text
main.tf
provider.tf
modules/
└── vpc/
    ├── main.tf
    ├── variable.tf
    └── output.tf
