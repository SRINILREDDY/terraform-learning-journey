## Day 11 — Terraform Lifecycle

Today I learned and practiced **Terraform lifecycle rules** and tested their behavior using AWS EC2 and Security Groups.

### Topics Covered

* `ignore_changes`

  * Tells Terraform to ignore changes to specific resource attributes.

* `prevent_destroy`

  * Protects Terraform-managed resources from accidental destruction.

* `create_before_destroy`

  * Creates the replacement resource before destroying the existing resource.
  * Helps reduce downtime during replacement.

* `replace_triggered_by`

  * Replaces a resource when a specified resource or value changes.

### Practical Testing

I practiced lifecycle rules using:

* AWS EC2
* AWS Security Groups
* AMI changes
* Security Group changes
* Terraform `plan` and `apply`

### Key Concepts

```text
ignore_changes
→ Ignore selected changes

prevent_destroy
→ Prevent accidental Terraform deletion

create_before_destroy
→ Create new → destroy old

replace_triggered_by
→ Trigger replacement when specified resource changes
```

### Commands Practiced

```bash
terraform init
terraform validate
terraform plan
terraform apply

