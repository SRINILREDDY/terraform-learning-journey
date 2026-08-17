Correct. 👍 **Day-9 only contains:**

* `count`
* Conditional expressions
* Using variables with them
* Creating **1 EC2 for dev** and **2 EC2 for prod**
* Conditional instance type (`t2.micro` vs `t3.medium`)

So the README should be much simpler. Use this:

````markdown
# Day-9 — Terraform Count & Conditional Expressions

## Topics Covered

- Terraform `count`
- Conditional expressions
- Using variables with `count`
- Conditional EC2 instance type

## 1. Count

Used `count` to create different numbers of EC2 instances based on the environment.

```hcl
resource "aws_instance" "srinil" {
  count = var.environment == "prod" ? 2 : 1

  ami           = "ami-035827357e3c7e810"
  instance_type = "t2.micro"
}
````

Result:

* `dev` → 1 EC2 instance
* `prod` → 2 EC2 instances

## 2. Conditional Expression

Used a conditional expression to select the EC2 instance type based on the environment.

```hcl
instance_type = var.environment == "prod" ? "t3.medium" : "t2.micro"
```

Result:

* `dev` → `t2.micro`
* `prod` → `t3.medium`

## 3. Variable

```hcl
variable "environment" {
  default = "dev"
}
```

The environment can be changed to `prod` when required.

## Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Key Takeaway

`count` controls **how many resources** Terraform creates.

Conditional expressions control **which value/configuration** Terraform uses.

This accurately represents what you actually completed on **Day-9**.
```
