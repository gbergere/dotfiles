# AGENTS.md (Global) — ChatGPT Cortex

## Purpose
This file defines global working rules for AI agents operating on this machine across repositories.
Default to the simplest solution that is correct, minimal, and maintainable.

## Defaults
- Keep it simple (KISS).
- Always aim for the **minimum change required to meet acceptance criteria**.
- Prefer small, focused diffs over broad refactors.
- Prefer self-documenting code over comments.
- Follow existing project conventions when present. If repo docs conflict with this file, repo docs win.
- Avoid introducing new tooling, patterns, or dependencies unless clearly necessary.

## Acceptance Criteria First
- **Always restate the acceptance criteria before making changes.**
  - Use the issue, ticket, PR description, or user request as the source.
  - If acceptance criteria are implicit or missing, infer the minimum viable criteria and state assumptions explicitly.
- Use the acceptance criteria as the primary constraint for all decisions.
- Any change that does not directly support the acceptance criteria is out of scope.

## Change Discipline
- Optimize for acceptance, not perfection.
- Do not refactor adjacent code unless required to meet the acceptance criteria.
- Avoid speculative or “nice-to-have” improvements.
- If multiple solutions exist, choose the one with:
  1. The smallest diff
  2. The least conceptual overhead
  3. The lowest risk of unintended side effects

## Coding Style
- Choose clear names over cleverness.
- Keep functions/modules small and focused.
- Reduce configuration surface area. Fewer knobs, better defaults.
- Comments:
  - Prefer expressing intent through naming and structure.
  - Only comment when the “why” is not obvious from the code.
  - Avoid narrating what the code already states.

## Terraform Guidelines

### Module Design
- Build generic modules that **decorate** standard Terraform resources with embedded business logic.
  - Examples: tagging, security defaults, naming, guardrails.
- Inputs and outputs should follow the naming of the resource being decorated.
  - Prefer names that match provider/resource fields.
  - Avoid custom synonyms unless there is a strong reason.

### Resource Naming
- Inside a module:
  - If there is only one instance of a resource type, name it `this`.
    - Example: `resource "aws_s3_bucket" "this" { ... }`
  - If multiple instances of the same type exist, differentiate clearly.

### Interfaces (Inputs/Outputs)
- Prefer thin interfaces with safe defaults.
- Expose only what callers actually need.
- Outputs should use standard identifiers: `id`, `arn`, `name`, etc.

### Files & Structure (suggested)
- `main.tf`: resources and core logic
- `variables.tf`: inputs, descriptions, validation
- `locals.tf`: derived values
- `outputs.tf`: outputs
- `README.md`: usage and examples

## Review & Safety Checks
Before finishing, verify:
- Have the acceptance criteria been explicitly restated?
- Is this the smallest possible change that meets them?
- Are names and structure clear enough to avoid comments?
- Terraform-specific:
  - Are single resources named `this`?
  - Do inputs/outputs mirror the underlying resource?
  - Is the module generic rather than app-specific?

## Do / Don’t

### Do
- Restate acceptance criteria at the start of work.
- Make the smallest diff that satisfies them.
- `resource "aws_s3_bucket" "this" { ... }`

### Don’t
- Improve unrelated code.
- Refactor “while you’re here.”
- Add abstractions without a direct requirement.
