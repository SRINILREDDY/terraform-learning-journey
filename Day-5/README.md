Yes. For **Day 5**, use this as the final single `README.md`:

````markdown
# Day 5 — Terraform State & Remote Backend

## What I Did

Today I focused on understanding Terraform state and configuring a remote backend using Amazon S3.

### 1. Terraform State

I learned that:

> Terraform state is a record of Terraform-managed infrastructure.

The default state file is:

```text
terraform.tfstate
````

I inspected the state file and saw that it contains information about Terraform-managed resources, such as:

* Resource information
* Resource IDs
* AMI ID
* Private IP
* Public IP
* Key name
* Network information
* Other resource attributes

Terraform uses the state to track the infrastructure it manages and determine changes.

---

## 2. Remote Backend

I learned why a remote backend is needed.

With a local backend, the Terraform state file is stored on an engineer's machine. When multiple engineers work on the same Terraform project, having separate local state files can cause problems.

A remote backend stores the state in a central location.

```text
Engineer 1 ──┐
Engineer 2 ──┼──→ Remote Backend → S3
Engineer 3 ──┘
```

> Remote Backend = storing Terraform state in a central location so multiple engineers can work with shared state.

---

## 3. Created an S3 Bucket

I created an S3 bucket:

```text
srinil-539
```

The bucket was created before configuring the S3 backend because the backend requires the bucket to already exist.

---

## 4. Configured S3 Remote Backend

I created `backend.tf`:

```hcl
terraform {
  backend "s3" {
    bucket = "srinil-539"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
```

Then I initialized the backend:

```bash
terraform init
```

Terraform successfully configured the S3 remote backend.

---

## 5. Verified Remote State

I checked the S3 bucket and verified that Terraform stored the state remotely:

```text
srinil-539/
└── terraform.tfstate
```

I learned that I do not manually create the `terraform.tfstate` file.

Terraform manages the state in the configured backend.

---

## 6. Terraform Outputs

I learned why Terraform outputs are useful.

The state contains many resource attributes, but outputs allow us to display selected useful values.

Example:

```hcl
output "public_ip" {
  value = aws_instance.srinil.public_ip
}
```

Outputs can be used to display useful values such as resource IDs, IP addresses, and endpoints.

---

## 7. State Security

I learned that Terraform state contains infrastructure information and should be protected.

Important security controls include:

* Private S3 bucket
* Proper IAM permissions
* No public access
* Encryption
* S3 versioning
* CloudTrail auditing

S3 versioning can help recover previous versions of the state.

---

## 8. State Locking

I learned the concept of Terraform state locking.

> State locking prevents multiple Terraform operations from modifying the same shared state at the same time.

Example:

```text
Engineer 1 → 🔒 State Lock → Terraform operation
Engineer 2 → ⏳ Wait
Engineer 1 → 🔓 Lock Released
Engineer 2 → Can proceed
```

---

## 9. DynamoDB Locking

I learned the traditional S3 + DynamoDB approach for Terraform state locking.

Example:

```hcl
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "lock_id"

  attribute {
    name = "lock_id"
    type = "S"
  }
}
```

I learned:

```text
S = String
```

The `hash_key` and attribute name should match.

The state-locking hands-on practice will be continued in the next session.

---

## Commands Practiced

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

Git commands:

```bash
git add .
git commit
git pull --rebase origin main
git push
```

---

## What I Learned

* Terraform state is a record of Terraform-managed infrastructure.
* `terraform.tfstate` is the default state file.
* Terraform uses state to track managed infrastructure.
* A remote backend stores state in a central location.
* S3 can be used as a remote backend for Terraform state.
* The S3 bucket must exist before configuring the S3 backend.
* Terraform manages the state file automatically.
* Outputs display selected useful resource values.
* Terraform state should be protected.
* S3 versioning can help with state recovery.
* State locking prevents conflicting Terraform operations.
* DynamoDB is used for state locking in the traditional S3 + DynamoDB setup.
* `S` in DynamoDB means String.

---

## Day 5 Status

* ✅ Learned Terraform State
* ✅ Inspected Terraform State
* ✅ Learned Remote Backend
* ✅ Created S3 Bucket
* ✅ Configured S3 Remote Backend
* ✅ Ran `terraform init`
* ✅ Verified `terraform.tfstate` in S3
* ✅ Learned Terraform Outputs
* ✅ Learned State Security
* ✅ Learned State Versioning
* ✅ Learned State Locking Concept
* ✅ Learned DynamoDB Locking Configuration
* ⏳ State Locking Hands-on — Next Session

---

## Key Takeaway

> **Terraform State = record of managed infrastructure.**
> **Remote Backend = central location for storing state.**
> **S3 = remote state storage.**
> **State Locking = prevents conflicting Terraform operations.**

```

This version stays focused on **what you actually did and learned on Day 5**.
```
