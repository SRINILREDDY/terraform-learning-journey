# Terraform VPC Module – Day 4

This project demonstrates how to create an AWS VPC using Terraform modules.

## Architecture

The project uses a root module and a child VPC module:

```text
Root Module
    |
    └── modules/vpc
          |
          ├── VPC
          ├── Public Subnet
          ├── Private Subnet
          ├── Internet Gateway
          ├── Public Route Table
          ├── Private Route Table
          ├── NAT Gateway
          └── Route Table Associations
