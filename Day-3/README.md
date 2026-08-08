# Terraform Modules

## Overview

This section focuses on using Terraform Modules to create reusable and organized infrastructure code.

## What I Learned

- Terraform Modules
- Root Module and Child Modules
- Module `source`
- Passing values from the root module to child modules
- Module input variables
- Module outputs
- Reusable Terraform configurations
- Organizing Terraform projects with separate directories
- Terraform initialization when adding modules
- Terraform validation, planning, apply, and destroy

## Project Structure

```text
Day-3/
├── main.tf
├── terraform.lock.hcl
└── modules/
    └── ec2_instance/
        ├── main.tf
        ├── variable.tf
        ├── output.tf
        └── provider.tf