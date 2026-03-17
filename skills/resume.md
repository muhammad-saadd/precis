# precis: resume

Restore context from the last session. One paragraph. No ceremony.

## Process

**Step 1 — Read git state:**
```bash
git log --oneline -20
git status
```

**Step 2 — Scan for plan files (optional):**
Look for any `.md` files in the project root or a `docs/` directory that look like in-progress plans.
Single files only. Don't crawl directories.

**Step 3 — Synthesize and output one paragraph:**

Format:
"Last session: [what was being built]. Stopped at [last commit or last known state].
Uncommitted: [files if any, or 'clean']. Next: [what makes sense to do next]."

## --quick

Read last 3 commits only (`git log --oneline -3`). Skip plan file scan.
Output one sentence.

## Rules

- One paragraph maximum. Not a summary document.
- No ceremony: skip "Great news!", "Let me restore your context!", or similar.
- If git history is empty or unhelpful, say: "No recent context found. What are we building?"
- Don't fabricate context. Only report what's in git.
