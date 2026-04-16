---
name: reflect
description: Review the current session for corrections, feedback, and learnings. Propose updates to skills and memories for approval.
when_to_use: When the user asks to review the session, capture learnings, or when prompted before context compaction.
---

Review this conversation and identify actionable learnings. Propose changes for approval — never write anything without explicit consent.

## What to look for

1. **Corrections** — The user corrected your approach, tool usage, or output. These often indicate a skill gap or a missing rule.
2. **Confirmed non-obvious approaches** — You made a judgment call and the user validated it (explicitly or by accepting without pushback). Worth capturing if surprising.
3. **User preferences** — Communication style, workflow habits, or tool preferences that aren't documented yet.
4. **Recurring friction** — The same issue came up multiple times, suggesting a skill or memory should prevent it.

## What to skip

- Anything already documented in skills, CLAUDE.md, or the memory system
- Ephemeral task details (file paths, variable names, one-off debugging)
- Things derivable from code, git history, or project structure
- Obvious or universal best practices

## How to propose changes

For each finding, present ONE of:

### Skill update
Show the exact diff to an existing skill file:
```
Skill: /git
Section: ## Commit Discipline
Change: Add rule about X because Y
```
Show the old text and new text so the user can approve the specific edit.

### New memory
Show the full memory file content:
```
Type: feedback | user | project | reference
File: descriptive-name.md
Content: [the memory content following the type's structure]
```

### New skill
Only if the learning doesn't fit any existing skill. Show the full SKILL.md content.

## Approval flow

1. Present all proposed changes as a numbered list
2. Wait for the user to approve, reject, or modify each one
3. Only write approved changes
4. For skills: use Edit to apply the diff
5. For memories: use Write to create the memory file and update MEMORY.md

## Rules

- Never write without explicit approval
- Prefer updating existing skills over creating new memories
- Prefer memories over new skills (only create a new skill if the learning is a full procedure)
- Keep proposals concise — the user should be able to approve in seconds
- If nothing worth capturing, say so and stop
