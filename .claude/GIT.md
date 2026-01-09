# Git Standards

## Commit Messages

### Format
Use Conventional Commits format:
```
<type>: <short summary>

<detailed explanation>
<why this change was made>
<what impact it has>

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

### Types
- `feat:` — New features or functionality
- `fix:` — Bug fixes
- `chore:` — Maintenance tasks (cleanup, migrations, dependency updates)
- `docs:` — Documentation changes
- `refactor:` — Code restructuring without behavior change

### Examples
```
feat: Add user authentication module

Implement JWT-based authentication for API endpoints.

Changes:
- Add authentication middleware
- Create token generation and validation functions
- Add user session management

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

## Commit Discipline

### Granularity
- One logical change per commit
- Separate concerns into different commits
- Related changes can be grouped logically

### What NOT to Commit
**CRITICAL: Never commit .env files or secrets**
- Always use explicit file paths when staging
- Never use broad patterns that might include sensitive files
- If secrets are accidentally committed, reset and recreate commits

### Co-Authoring
Always include Claude attribution:
```
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

## Branching Strategy

### Branch Naming
Use descriptive, hyphenated names with type prefix:
- `feat/add-user-authentication`
- `fix/database-connection-timeout`
- `chore/remove-deprecated-code`

### Main Branch
- Branch name: `main`
- Always create PRs to main
- Rebase on main before pushing feature branches

## Pull Requests

### PR Titles
Match the commit message format:
```
feat: Add user authentication module
```

### PR Description Structure
```markdown
## Summary
- High-level overview (bullet points)
- What problem this solves
- What changes are being made

## Changes

### Component/Section 1
- Specific changes made
- Why they were made

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

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
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

### If Secrets Get Committed
1. Reset the commit: `git reset HEAD~1`
2. Carefully stage only the intended files
3. Recreate the commit
4. Force push if already pushed: `git push --force-with-lease origin branch-name`

## Best Practices

- **Review before commit**: Always check `git status` and `git diff` before committing
- **Atomic commits**: Each commit should be a complete, logical unit
- **Meaningful messages**: Explain why, not just what
- **Clean history**: Amend or reset commits if needed before pushing
- **Rebase before PR**: Keep feature branches up to date with main
- **Explicit pushes**: Always specify branch name when pushing
