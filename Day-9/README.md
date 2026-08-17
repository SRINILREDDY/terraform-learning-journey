# Day-9 — Terraform Data Sources, Conditionals, Count & For_Each

## Overview

In Day-9, I practiced Terraform features used to make infrastructure configurations more dynamic and reusable.

### Topics Covered

- Terraform Data Sources
- Conditional Expressions
- `count`
- `for_each`
- Terraform Variables
- Instance type selection using conditions
- Creating multiple EC2 instances

---

## 1. Data Sources

A Terraform data source is used to retrieve information about an **existing AWS resource** without creating it.

Example:

```hcl
data "aws_instance" "srinil" {
  instance_id = "i-xxxxxxxxxxxxxxxxx"
}