## Day 10 — Terraform Dynamic Blocks

````markdown
# Day 10 — Terraform Dynamic Blocks

## What I Learned

Learned how to use Terraform dynamic blocks to generate multiple nested blocks dynamically from a variable.

## Topics Covered

- Dynamic blocks
- `dynamic "ingress"`
- `dynamic "egress"`
- `for_each` inside dynamic blocks
- `ingress.value`
- `egress.value`
- Nested object attributes
- Dynamic Security Group rules
- Inbound vs outbound rules
- Source vs destination
- CIDR-based rules
- Security Group-based communication

## Implementation

Created an AWS Security Group using dynamic blocks for:

### Inbound Rules

- HTTP — Port 80
- HTTPS — Port 443
- Source defined using CIDR blocks

### Outbound Rules

- MySQL — Port 3306
- Destination defined using CIDR blocks

## Example

```hcl
dynamic "ingress" {
  for_each = var.ingress

  content {
    from_port   = ingress.value.port
    to_port     = ingress.value.port
    protocol    = "tcp"
    cidr_blocks = [ingress.value.cidr]
  }
}
````

## Key Concepts

`dynamic` generates multiple nested blocks.

```text
dynamic "ingress"
        ↓
     for_each
        ↓
  multiple ingress blocks
```

For security groups:

```text
Ingress → Source
Egress  → Destination
```

For tier-to-tier communication, Security Group references can be used instead of unnecessarily allowing `0.0.0.0/0`.

## Troubleshooting

Encountered and resolved an attribute type error while configuring the dynamic egress block.

The issue occurred because the entire object was passed instead of the required object attribute.

Correct approach:

```hcl
egress.value.port
egress.value.cidr
```

## Verification

Successfully ran:

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

Verified the generated inbound and outbound rules in the AWS Management Console.

## Result

Successfully created and verified an AWS Security Group using Terraform dynamic blocks.

Dynamic Blocks: ✅ Completed

```
```
