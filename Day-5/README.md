# Day 5 — Terraform State & Remote Backend

## Overview

Today I focused on understanding Terraform State, Remote Backend, S3 state storage, Terraform Outputs, and State Locking.

---

## 1. Terraform State

### What I learned

Terraform State is a record of the infrastructure managed by Terraform.

The default state file is:

```text
terraform.tfstate

Terraform uses the state to track the infrastructure it manages and understand changes in the infrastructure.

I inspected a Terraform state file and saw information such as:

Resource information
Resource IDs
AMI ID
Instance information
Private IP
Public IP
Key name
Network information
Other resource attributes
Key takeaway

Terraform State = a record of Terraform-managed infrastructure.

2. Why Remote Backend?

I learned that with a local backend, the Terraform state file is stored on the engineer's local machine.

When multiple engineers work on the same Terraform project, separate local state files can create problems.

A Remote Backend provides a central location for the Terraform state.

Engineer 1 ──┐
Engineer 2 ──┼──→ Remote Backend
Engineer 3 ──┘          ↓
                        S3
                         ↓
                  terraform.tfstate
Key takeaway

Remote Backend = storing Terraform state in a central location so multiple engineers can work with shared state.

3. Created S3 Bucket

I created an Amazon S3 bucket:

srinil-539

The S3 bucket was created first because the S3 backend requires the bucket to already exist.

4. Configured S3 Remote Backend

I created a backend.tf file and configured the S3 backend:

terraform {
  backend "s3" {
    bucket = "srinil-539"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}

Then I initialized Terraform:

terraform init

Terraform successfully configured the S3 remote backend.

5. Verified Remote State

I checked the S3 bucket and verified that Terraform stored the state remotely:

srinil-539/
└── terraform.tfstate

I learned that I do not manually create the terraform.tfstate file.

Terraform manages the state in the configured backend.

Key takeaway
Terraform
    ↓
S3 Remote Backend
    ↓
terraform.tfstate
6. Terraform Outputs

I learned why Terraform Outputs are useful.

The Terraform state contains many resource attributes, but outputs allow us to display selected useful values.

Example:

output "public_ip" {
  value = aws_instance.srinil.public_ip
}

Outputs can be used to display useful values such as:

Public IP
Private IP
Resource IDs
DNS names
Endpoints
Key takeaway

Outputs provide convenient access to selected values from Terraform-managed resources.

7. State Security

I learned that Terraform state contains infrastructure information and should be protected.

Important security controls include:

Private S3 bucket
Proper IAM permissions
No public access
Encryption
S3 versioning
CloudTrail auditing

I also learned that S3 versioning can help recover previous versions of the state.

8. State Locking

I learned the concept of Terraform State Locking.

State locking prevents multiple Terraform operations from modifying the same shared state at the same time.

Example:

Engineer 1
    ↓
🔒 State Locked
    ↓
Terraform Operation
    ↓
🔓 Lock Released
    ↓
Engineer 2
    ↓
Can Proceed
Key takeaway

State Locking = allowing only one Terraform operation to modify the shared state at a time.

The detailed state-locking hands-on practice will be continued in the next session.

Commands Practiced
terraform init
terraform plan
terraform apply
terraform destroy

Git commands:

git add .
git commit
git pull --rebase origin main
git push
What I Learned Today
Terraform State is a record of Terraform-managed infrastructure.
terraform.tfstate is the default state file.
Terraform uses state to track managed infrastructure.
A Remote Backend stores state in a central location.
S3 can be used to store Terraform state remotely.
The S3 backend requires the bucket to exist before initialization.
Terraform automatically manages the state file.
Outputs provide selected useful resource values.
Terraform state should be protected.
S3 versioning can help recover previous state versions.
State Locking prevents conflicting Terraform operations.
