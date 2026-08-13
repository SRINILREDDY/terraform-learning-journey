# Day 8 — Terraform RDS and AWS Secrets Manager

## Overview

Today I used Terraform to create an Amazon RDS MySQL database and learned how AWS Secrets Manager can securely manage the database master password.

## What I Learned

* Created an Amazon RDS MySQL database using Terraform.
* Used `aws_db_instance` to define the RDS database.
* Configured RDS with:

  * MySQL
  * `db.t3.micro`
  * 20 GB `gp3` storage
  * Private database access
* Learned that RDS engine versions must be supported in the selected AWS region.
* Used:

```hcl
manage_master_user_password = true
```

to allow Amazon RDS to manage the master password through AWS Secrets Manager.

* Learned that Terraform state can contain sensitive information and should not be committed to GitHub.
* Used `.gitignore` to exclude Terraform state and `.terraform` files.

## Architecture

```text
                    Terraform
                        |
                        v
                  Amazon RDS
                  MySQL Database
                        |
                        | Master password managed by RDS
                        v
               AWS Secrets Manager
```

## Terraform Resource

The main resource used was:

```hcl
resource "aws_db_instance" "database" {
  identifier        = "database"
  engine            = "mysql"
  instance_class    = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "appdb"
  username = "srinil"

  manage_master_user_password = true

  publicly_accessible = false
  skip_final_snapshot = true
}
```

## Important Concepts

### RDS

Amazon RDS is a managed relational database service. AWS handles tasks such as database infrastructure provisioning, storage, backups, and maintenance.

### Secrets Manager

AWS Secrets Manager securely stores and manages sensitive information such as database credentials, API keys, and passwords.

### RDS + Secrets Manager

With:

```hcl
manage_master_user_password = true
```

RDS automatically manages the master database password using AWS Secrets Manager.

This is preferable to hard-coding the password in Terraform.

## Security

Terraform state files were excluded from Git:

```gitignore
*.tfstate
*.tfstate.*
.terraform/
*.tfvars
```

The Terraform state should never be committed to a public GitHub repository.

## Result

Successfully created the RDS MySQL database using Terraform and pushed the Day-8 Terraform work to GitHub.

## Commands Used

```bash
terraform init
terraform plan
terraform apply
terraform destroy

git add .
git commit -m "Add Day 8 RDS Terraform project"
git pull --rebase origin main
git push origin main
git status
```
