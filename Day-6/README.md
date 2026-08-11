# Terraform Day 6 — AWS Infrastructure

## Overview

This project provisions AWS infrastructure using Terraform.

## Architecture

Terraform
   |
   └── VPC
        |
        ├── Public Subnet 1
        │     └── ap-south-1a
        |
        ├── Public Subnet 2
        │     └── ap-south-1b
        |
        ├── Internet Gateway
        |
        ├── Public Route Table
        |
        ├── ALB Security Group
        |
        ├── Application Load Balancer
        |
        └── Target Group

## Resources

- VPC
- Public Subnets
- Internet Gateway
- Route Table
- Route Table Associations
- Security Group
- Application Load Balancer
- Target Group
- ALB Listener

## Terraform Concepts Practiced

- AWS provider
- Terraform resources
- Resource dependencies
- Variables
- Security Groups
- Route tables
- ALB
- Target Groups
- Health checks
- Multiple Availability Zones
- Terraform state
- Git/GitHub

## Availability Zones

The ALB uses two public subnets in different Availability Zones:

- `ap-south-1a`
- `ap-south-1b`

## ALB Traffic Flow

Internet
→ ALB
→ Listener :80
→ Target Group :80
→ EC2

## Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply