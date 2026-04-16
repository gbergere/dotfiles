---
name: terraform
description: Terraform coding standards — module design, resource naming, variables, lifecycle, and state management. Use when writing or reviewing Terraform code, modules, workspaces, or HCL files.
when_to_use: When the user asks to write, edit, or review .tf files, Terraform modules, workspaces, variables, outputs, state migrations, or infrastructure-as-code.
---

Follow these standards for all Terraform work in this session.

# Terraform Coding Standards

## File Organization

### Workspace Structure
- One file per logical component with clear naming
- Group related resources in appropriately named files
- Environment-specific workspaces: `workspaces/staging/`, `workspaces/production/`, `workspaces/qa/`

### Module Structure
Standard files in every module:
- `main.tf` — Resources and core logic
- `variables.tf` — Inputs with descriptions and validation
- `locals.tf` — Derived values
- `outputs.tf` — Outputs with standard identifiers (id, arn, name)
- `README.md` — Usage and examples

## Resource Design

### Naming Conventions
- **Single instance**: Name the resource `this`
  ```hcl
  resource "provider_resource" "this" { }
  ```
- **Multiple instances**: Use descriptive, differentiated names
  ```hcl
  resource "provider_resource" "frontend" { }
  resource "provider_resource" "backend" { }
  ```
- **Module instances**: Prefix module name with the module type
  ```hcl
  # Good - module type as prefix
  module "google_project_production" {
    source = "../../modules/google_project"
  }
  module "google_artifact_registry_repository_api" {
    source = "../../modules/google_artifact_registry_repository"
  }

  # Bad - no module type prefix
  module "production" {
    source = "../../modules/google_project"
  }
  ```

### Module Design
- Build generic modules that wrap Terraform resources with embedded defaults
- Inputs and outputs should mirror the underlying resource structure
- Prefer thin interfaces with safe defaults
- Expose only what callers need
- Avoid clever abstractions unless justified

### Default Values
- Do not set variables to their default value when calling a module — rely on the module's defaults
- Only pass a value when it differs from the default
- This keeps caller code minimal and makes intentional overrides obvious
```hcl
# Good - ha defaults to false in the module, no need to set it
module "digitalocean_database_cluster_valkey_cache" {
  source = "../../modules/digitalocean_database_cluster_valkey"
  name   = "valkey-cache"
}

# Good - explicitly set because it differs from default
module "digitalocean_database_cluster_valkey_queues" {
  source = "../../modules/digitalocean_database_cluster_valkey"
  name   = "valkey-queues"
  ha     = true
}

# Bad - setting ha = false when false is already the default
module "digitalocean_database_cluster_valkey_cache" {
  source = "../../modules/digitalocean_database_cluster_valkey"
  name   = "valkey-cache"
  ha     = false
}
```

## Configuration Management

### Secrets vs Configuration
**Separate sensitive from non-sensitive data:**
- Non-sensitive configuration can be in plain resource attributes or variables
- Sensitive data must use secrets management or sensitive variables
- Never hardcode credentials in Terraform files

### Resource References
Use Terraform resource references, not hardcoded values:
```hcl
# Good
name = resource_type.resource_name.attribute

# Bad
name = "hardcoded-value"
```

## Lifecycle Management

### Ignore Changes
Use lifecycle rules to ignore changes managed elsewhere:
```hcl
lifecycle {
  ignore_changes = [
    attribute_managed_externally,
    another_attribute
  ]
}
```

### State Migration
Use `removed` and `import` blocks for resource migrations:
```hcl
removed {
  from = old_resource_type.name
  lifecycle {
    destroy = false
  }
}

import {
  to = new_resource_type.name
  id = "resource-id"
}
```

**Important**: Remove these blocks after migration is complete and merged.

## Best Practices

### Resource Specifications
- Set appropriate resource limits where applicable
- Use meaningful, descriptive names
- Include comments for complex configurations

### Variable Validation
Add validation rules to catch errors early:
```hcl
variable "example" {
  type        = string
  description = "Description of what this controls"

  validation {
    condition     = can(regex("^[a-z-]+$", var.example))
    error_message = "Must contain only lowercase letters and hyphens."
  }
}
```

### Variable Typing
Prefer typed variables (`object`, `list(object(...))`) over loose types (`any`, `map(any)`, `list(any)`). Typed variables provide validation at plan time and enable `optional(type, default)` for clean defaults — keeping resource code free of `try()`:

```hcl
# Good - defaults in the variable type
variable "block_device_mappings" {
  type = list(object({
    device_name = string
    ebs = object({
      volume_size           = number
      volume_type           = optional(string, "gp3")
      delete_on_termination = optional(bool, true)
    })
  }))
  default = []
}

# Then in the resource, no try() needed:
volume_type           = block_device_mappings.value.ebs.volume_type
delete_on_termination = block_device_mappings.value.ebs.delete_on_termination

# Bad - defaults scattered in resource blocks via try()
volume_type           = try(block_device_mappings.value.ebs.volume_type, "gp3")
delete_on_termination = try(block_device_mappings.value.ebs.delete_on_termination, true)
```

### Output Design
Expose useful information with clear descriptions:
```hcl
output "id" {
  description = "The ID of the resource"
  value       = resource_type.this.id
}

output "endpoint" {
  description = "The connection endpoint"
  value       = resource_type.this.endpoint
  sensitive   = true
}
```

## CLI Commands

- **Always run**: `terraform fmt` after making changes
- **Never run**: `terraform init`, `terraform validate`, `terraform plan`, or `terraform apply` — these are executed by CI/CD pipelines

## Anti-Patterns

**Avoid:**
- Speculative features or "nice to have" improvements
- Abstractions for one-time operations
- Hardcoded values that should be references
- Mixing multiple concerns in a single commit
- Over-engineering solutions
- Credentials or secrets in plain text
