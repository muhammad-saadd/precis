# precis: ship

Clean git hygiene. Atomic commits. No garbage pushed.

## Process

**Step 1 — Check working tree (unconditional):**
Run `git status`. If uncommitted changes exist that aren't being staged → stop.
Ask: "You have uncommitted changes in [files]. Stage them or stash them before shipping."
This check is unconditional. `--quick` does not bypass it.

**Step 2 — Stage specific files:**
Never `git add .` or `git add -A`.
Name every file being committed. Verify with `git diff --cached`.

**Step 3 — Write the commit message:**
Focus on *why*, not *what*.
- Good: "prevent double-spend on concurrent checkout requests"
- Bad: "update checkout.js"
- Bad: "fix bug"

Format:
```
[type]: [why in present tense]

[optional body: context, trade-offs, links]
```
Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`

**Step 4 — Bump version (if VERSION file exists):**
Increment patch version (e.g., `1.2.3` → `1.2.4`).
Stage the VERSION file with the rest of the commit.

**Step 5 — Create PR (if on a feature branch):**
```bash
gh pr create --title "[type]: [why]" --body "..."
```

## --quick

Skips Step 4 (version bump) and Step 5 (PR creation).
**Step 1 (dirty tree check) is always unconditional.**

## Rules

- Dirty working tree = stop. Always. No exceptions.
- Stage specific files only. Never `git add .`
- Commit message = why, not what.
- One logical unit per commit.
