# Git Standards

## Commit Messages

### Format
Use Conventional Commits format:
```
<type>[(scope)]: <short summary> [(#issue)]

<detailed explanation>
<why this change was made>
<what impact it has>

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

The `(scope)` is optional but recommended for repos with multiple services or components to provide context.
The `(#issue)` is optional but must be appended when the commit is tied to an issue/ticket:
- `feat(api): Add user authentication endpoint (#123)`
- `fix(frontend): Resolve layout issue on mobile (#456)`
- `chore(infra): Update Terraform modules (#789)`

### Types
- `feat:` — New features or functionality
- `fix:` — Bug fixes
- `chore:` — Maintenance tasks (cleanup, migrations, dependency updates)
- `docs:` — Documentation changes
- `refactor:` — Code restructuring without behavior change

### Examples
With scope (multi-service repos):
```
feat(api): Add user authentication module (#123)

Implement JWT-based authentication for API endpoints.

Changes:
- Add authentication middleware
- Create token generation and validation functions
- Add user session management

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

Without scope (single-service repos):
```
feat: Add user authentication (#123)

Implement JWT-based authentication.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

## Commit Discipline

### When to Commit
**Only commit when explicitly asked by the user.**
- Stage changes and prepare commit messages, but wait for user approval
- Never auto-commit after completing a task
- Ask "Ready to commit?" or wait for user instruction

### Granularity
- One logical change per commit
- Separate concerns into different commits
- Related changes can be grouped logically

### Fixing Existing Commits
**Use `--amend` when fixing HEAD. Use `--fixup` when fixing an earlier commit.**

- **Fixing the latest commit (HEAD)**: use `git commit --amend`
- **Fixing an older commit on the branch**: use `--fixup` + autosquash
- Only amend/fixup commits that are on the current branch (not yet merged into main)

**Amend (fixing HEAD):**
```bash
git add <files>
git commit --amend --no-edit
git push --force-with-lease origin branch-name
```

**Fixup (fixing an earlier commit):**
```bash
# 1. Stage the fix
git add <files>

# 2. Fixup the target commit (use git log to find the SHA)
git commit --fixup <target-sha>

# 3. Autosquash (non-interactive)
GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash origin/main

# 4. Force push
git push --force-with-lease origin branch-name
```

**Tips:**
- Use `git log --oneline origin/main..HEAD` to identify the correct target commit
- Resolve conflicts during rebase by keeping the version with your fix (`git checkout --ours`)

### What NOT to Commit
**CRITICAL: Never commit .env files or secrets**
- Always use explicit file paths when staging
- Never use broad patterns that might include sensitive files
- If secrets are accidentally committed, reset and recreate commits

### Co-Authoring
Always include Claude attribution (use Opus 4.5 for complex work, Sonnet 4.5 for routine tasks):
```
Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

## Branching Strategy

### Branch Naming
Use descriptive, hyphenated names with type prefix:
- `feat/add-user-authentication`
- `fix/database-connection-timeout`
- `chore/remove-deprecated-code`

When the branch is tied to an issue/ticket, append the issue number at the end:
- `feat/add-user-authentication#123`
- `fix/database-connection-timeout#456`
- `chore/remove-deprecated-code#789`

### Main Branch
- Branch name: `main`
- **NEVER push directly to main. All changes go through PRs — no exceptions, even for hotfixes.**
- Always create PRs to main
- Rebase on main before pushing feature branches

## Pull Requests

### Draft First (Mandatory)
**All PRs must be created as drafts.** Use `gh pr create --draft`.
- This gives the author a chance to review the PR description and CI results before requesting review.
- Mark as ready for review only when the author explicitly asks.

### PR Titles
Match the commit message format:
```
feat(api): Add user authentication module
```

Or without scope for single-service repos:
```
feat: Add user authentication module
```

### PR Description Structure
```markdown
## Why
**REQUIRED**: Explain the reasoning and motivation for this PR.
- What problem does this solve?
- Why is this change necessary?
- What value does it provide?

## Summary
- High-level overview of the solution (bullet points)
- What changes are being made

## Changes

### Component/Section 1
- Specific changes made
- Why they were made this way

### Component/Section 2
- More specific changes

## Impact
- User-facing changes
- Operational considerations
- Migration steps if any

## Security (if applicable)
- Security implications
- Credential handling

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

### Updating PRs (Mandatory)
**CRITICAL: Every time you add, amend, or modify commits in an open PR, you MUST also update the PR title and description.**

This is a mandatory step, not optional. After any commit change:
1. **Review the PR title** — update if scope or type has changed
2. **Review the PR description** — ensure it reflects ALL current commits
3. **Update the Changes section** — match the actual commits in the PR
4. **Remove stale references** — delete mentions of reverted or dropped changes
5. **Use `gh pr edit`** — to update title and body in a single command

```bash
# Update PR title and body after commit changes
gh pr edit --title "new title" --body "$(cat <<'EOF'
Updated description here...
EOF
)"
```

**Common triggers requiring PR updates:**
- Adding new commits to the PR
- Amending existing commits (`git commit --amend`)
- Rebasing with changes
- Cherry-picking additional commits
- Dropping or reverting commits

## Git Commands

### Staging Files
```bash
# Good: Explicit file patterns
git add src/**/*.ts

# Good: Specific files
git add src/auth/middleware.ts

# Bad: Might include unwanted files
git add src/
```

### Commit with Heredoc
Use heredoc for multi-line commit messages:
```bash
git commit -m "$(cat <<'EOF'
feat: Add new feature

Detailed explanation here.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

### Pushing to Remote
**Always use explicit branch name:**
```bash
# Good: Explicit branch name
git push origin feature-branch-name

# For new branches with tracking
git push -u origin feature-branch-name

# Bad: Implicit push
git push
```

### Sequential Operations
Use `&&` for dependent commands:
```bash
# Good: Commands depend on each other
git add file.ts && git commit -m "message" && git push origin branch-name

# Good: Independent parallel checks
# (Run as separate commands in same message)
git status
git diff
```

## Workflow

### Standard Feature Flow
1. Start from main: `git checkout main && git pull origin main`
2. Create feature branch: `git checkout -b feat/descriptive-name`
3. Make changes and stage: `git add <specific files>`
4. Check what's staged: `git status`
5. Commit with detailed message
6. Push: `git push origin feat/descriptive-name` (or with `-u` for first push)
7. Create PR: `gh pr create --title "..." --body "..."`
8. After user confirms "PR merged": run post-merge cleanup

### Creating PR with Uncommitted Changes (Preferred)
**Always use this approach when opening PRs with uncommitted changes. Never use `git stash`.**

```bash
# 1. Create branch (keeps your uncommitted changes)
git checkout -b feat/descriptive-name

# 2. Commit your changes on the new branch
git add <specific files>
git commit -m "..."

# 3. Rebase on latest main
git fetch origin main
git rebase origin/main

# 4. Push and create PR
git push -u origin feat/descriptive-name
gh pr create --title "..." --body "..."
```

**Why this approach over stashing:**
- Changes are safely committed on a branch (not in stash limbo)
- If rebase has conflicts, you can resolve them properly
- Cleaner workflow with fewer commands
- Avoids stash pop conflicts and lost changes

### Post-Merge Cleanup
**NEVER merge PRs via CLI. Always let the user merge via GitHub UI.**

When the user confirms "PR merged", run cleanup:
```bash
# Get default branch, switch to it, pull, delete local feature branch
git checkout <default-branch> && git pull && git branch -d <feature-branch>
```

Example:
```bash
git checkout develop && git pull && git branch -d fix/ci-staging-workflow
```

### If Secrets Get Committed
1. Reset the commit: `git reset HEAD~1`
2. Carefully stage only the intended files
3. Recreate the commit
4. Force push if already pushed: `git push --force-with-lease origin branch-name`

## Best Practices

- **Review before commit**: Always check `git status` and `git diff` before committing
- **Atomic commits**: Each commit should be a complete, logical unit
- **Meaningful messages**: Explain why, not just what
- **Clean history**: Use `--fixup` + autosquash to keep commits clean (never amend non-HEAD commits)
- **Rebase before PR**: Keep feature branches up to date with main
- **Explicit pushes**: Always specify branch name when pushing
