# precis: debug

Systematic debugging. State a hypothesis before touching code.
One change at a time when the cause is uncertain.

## Process

**Step 1 — Hypothesis first:**
Before looking at any code, ask or state: "What do you think is wrong?"
- If the engineer has a hypothesis → validate it against the error
- If not → generate one from the error message, stack trace, or symptom
- Write it down: "Hypothesis: [X is happening because Y]"

**Step 2 — Isolate:**
Find the smallest reproduction of the failure.
- Can you reproduce it with a unit test?
- Can you remove variables until only the broken part remains?
- Don't debug moving parts simultaneously.

**Step 3 — Verify the fix:**
Before declaring done:
1. Reproduce the original failure
2. Apply the fix
3. Confirm it no longer fails
4. Confirm nothing else broke

## Running log

Keep a "what we tried" list as you go. Prevents re-investigating dead ends.

```
Tried: [hypothesis] → [outcome]
Tried: [hypothesis] → [outcome]
```

## --quick

Skip the hypothesis step. Dive straight into the code.

## Rules

- No shotgun changes. Don't touch 3 files hoping one fixes it.
- One change at a time when the root cause is uncertain.
- "It might be fixed" is not done. Verify.
- If the fix is obvious and you're confident, skip to Step 3.
