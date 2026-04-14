# Issue / Ticket Writing Standards

## Workflow

### Approval Gate
**You MUST ask for approval before creating a ticket in GitHub — every ticket, every time, even when writing multiple tickets in one session.**

Flow:
1. Draft the ticket in full (using the format below)
2. Present it for review
3. Wait for explicit approval
4. Only then create the GitHub issue

### Branch and PR Association
- The main branch is `main`
- When creating an issue that will result in a branch, follow the branch naming conventions in GIT.md

---

## Ticket Format

Every ticket must follow this structure:

### Title
A brief sentence descriptor, written in **present tense** with **business impact**. Client-specific overrides may apply (see client sections below).

Examples:
- `Consolidate VPC peering into a reusable module to reduce drift and simplify onboarding`
- `Migrate DNS zones to Cloudflare to improve resolution latency and reduce vendor lock-in`
- `Add resource limits to all production workloads to prevent noisy-neighbour incidents`

Avoid vague titles like "Update Terraform" or "Fix infra".

### Rationale
The **business reason** for doing this work. Not a technical justification — explain why this matters to the client, the platform, or the team.

- What problem exists today?
- What risk does it create?
- What value does the change deliver?

### Details
What exactly needs to change. Be specific about scope:

- **Modules** affected (path, name)
- **Workspaces / environments** in scope (staging, production, etc.)
- **Resources** to add, modify, or remove
- **State operations** if any (imports, moves, removals)
- **Dependencies** on other systems or teams

Keep the scope minimal. One logical concern per ticket.

### Validation
How to confirm the change is correct. For infrastructure work, this typically means:

- `terraform plan` is clean (no unexpected changes)
- `terraform apply` succeeds in staging
- No drift detected after apply
- Affected services remain healthy (health checks, monitoring)
- Rollback path confirmed (revert commit, re-apply previous state)

Only include what's relevant. Don't pad with unnecessary validation steps.

### Requirements for Done
The checklist that must be satisfied before the ticket is considered complete:

- [ ] Plan is clean in all affected workspaces
- [ ] Applied successfully in staging
- [ ] Applied successfully in production
- [ ] No drift on subsequent plan
- [ ] Monitoring confirms no regressions
- [ ] PR merged and branch cleaned up

Adjust the checklist to fit the ticket — not every ticket touches production or needs monitoring checks.

---

## Scoping Rules

### Keep Tickets Focused
- One logical change per ticket
- If a change spans multiple concerns (e.g., new module + migration + cleanup), split into separate tickets
- Prefer small, deployable increments over large batches

### Cross-Team Coordination
When infrastructure changes affect application teams (frontend, middleware, backend):
- Mention the impact in the ticket description briefly
- Ensure the infra change is backwards-compatible or provides an async migration path
- Do **not** include app-side work in the infra ticket — that's a separate ticket for the app team
- Flag any breaking changes or required coordination explicitly

---

## Client-Specific Standards

### Farm to People

**Repos:** All repositories under `~/Git/Farm-To-People/`.

**Ticket Titles:** Use **past tense** (overrides the general present-tense rule).
- `Consolidated VPC peering into a reusable module to reduce drift and simplify onboarding`
- `Added health check endpoints to middleware deployment`

**Scoping:**
- Keep tickets scoped to the relevant repo's domain
- If frontend (FE) or middleware (MW) teams are affected by a change, mention it in passing but do not include their work in the ticket
- If other teams need to update their code to match your changes, ensure your change allows them to do so asynchronously (no hard cutover)

**Epic Tracking:**
- Any ticket related to **performance or maintainability** of `app_ftp` must be created as a subissue of [Farm-To-People/app_ftp#964](https://github.com/Farm-To-People/app_ftp/issues/964)

**Branch:** Main branch is `main`.
