# Terraform Learning Journey 🚀

A hands-on Terraform learning repository focused on provisioning and managing AWS infrastructure using Infrastructure as Code (IaC).

## What I'm Learning

- Terraform fundamentals and workflow
- AWS provider configuration
- Resources and data sources
- Variables and `terraform.tfvars`
- Outputs
- Local values
- Conditional expressions
- `count` and `for_each`
- Terraform modules
- Reusable infrastructure components
- Terraform state management
- Remote state and state locking
- Terraform workspaces
- Infrastructure dependencies
- Terraform project structure
- Terraform best practices
- Infrastructure provisioning and destruction

## AWS Infrastructure

- VPC
- Subnets
- Route tables
- Internet Gateway
- NAT Gateway
- Security Groups
- EC2
- Launch Templates
- Auto Scaling Groups
- Application Load Balancer
- Target Groups
- High-availability infrastructure
- Multi-AZ architecture

## What I'm Building

A production-style AWS infrastructure using Terraform with reusable modules.

The infrastructure will include:

- Custom VPC
- Public and private subnets
- Internet and NAT connectivity
- Security Groups
- EC2 instances
- Launch Template
- Auto Scaling Group
- Application Load Balancer
- Target Group
- Multi-AZ architecture

## Terraform Architecture

```text
                    Terraform
                        │
                        ▼
                 Root Configuration
                        │
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
       VPC        Security Groups       ALB
        │                               │
        │                               ▼
        │                         Target Group
        │                               │
        ▼                               ▼
     Subnets                         ASG
                                        │
                                        ▼
                                      EC2
