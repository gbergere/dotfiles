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

### Module Design
- Build generic modules that wrap Terraform resources with embedded defaults
- Inputs and outputs should mirror the underlying resource structure
- Prefer thin interfaces with safe defaults
- Expose only what callers need
- Avoid clever abstractions unless justified

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

## Change Discipline

### Minimal Changes
- Optimize for the smallest diff that meets acceptance criteria
- Avoid refactors unless required for correctness or safety
- Do not clean up adjacent code ("while we're here" changes)
- Keep one concern per file change when possible

### Comments and Documentation
- Use clear section comments for logical grouping
- Document non-obvious configuration choices
- Keep comments up to date with code changes

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

## Anti-Patterns

**Avoid:**
- Speculative features or "nice to have" improvements
- Abstractions for one-time operations
- Hardcoded values that should be references
- Mixing multiple concerns in a single commit
- Over-engineering solutions
- Credentials or secrets in plain text
