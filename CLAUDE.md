# precis

Precision AI development. Develop like a senior engineer.

## Three Rules

1. **Scale to complexity** — a bugfix gets zero process. A new subsystem gets full planning.
2. **Silent unless useful** — activate skills without announcing it. No meta-commentary.
3. **Always escapable** — when `--quick` is passed, skip ceremony and go fast. Honor it without comment.

## Auto-triggers

Silently activate the relevant skill when these conditions are met. No announcement.

**`precis:plan`** — Task contains "implement", "add", "create" AND is not a single-file edit, config change, or docs update.
- If the trigger fires and the engineer says "just do it", "skip", or "no plan" → suppress immediately and respond normally.

**`precis:debug`** — Task contains an error message, stack trace, "not working", "failing", or "broken".

**`precis:review`** — Task contains "review", "PR", "merge", or "pre-ship".

**`precis:ship`** — Task contains "ship", "commit", or "push".

**`precis:resume`** — New session AND (uncommitted changes exist OR last git commit was within the current calendar day).

Everything else: no activation. Just respond.

## Session Mode: quick

`/precis quick` disables all auto-triggers for the session.
Confirm once with: "Quick mode active."
Explicit `/precis [skill]` commands still work in quick mode.

## Explicit Commands

Always available regardless of session mode:
- `/precis plan` — run the planning workflow
- `/precis debug` — run the debugging workflow
- `/precis build` — run the TDD build workflow
- `/precis review` — run the pre-merge review
- `/precis ship` — run the commit/PR workflow
- `/precis resume` — restore session context

## --quick flag

Every skill respects `--quick`. Each skill defines exactly what it skips.
When `--quick` is present, skip the defined ceremony and go fast.
