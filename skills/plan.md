# precis: plan

Help the engineer think through what they're building before touching code.
Fast. Targeted. No ceremony.

## Process

**Step 1 — Ask up to 3 questions (stop earlier if you have enough):**
- What is this replacing or extending?
- What are the constraints? (performance, backwards compat, external interfaces)
- Are there edge cases you already know about?

Stop asking if the task is clear. Don't pad to 3.

**Step 2 — Propose 2-3 approaches with trade-offs:**
- Lead with your recommendation
- One sentence per trade-off
- If one approach is clearly right, say so and skip the others

**Step 3 — Produce a flat implementation list:**
- Numbered steps
- Each step is one logical unit: one file, one function, one test
- Verifiable: the engineer can check each one off
- No phases, milestones, sub-bullets, or directories

## Output format

```
Approach: [recommended approach in one sentence]

Implementation:
1. [file/function/test] — [what it does]
2. ...
```

## --quick

Skip questions entirely. Ask: "What are you building?" then go straight to the implementation list.

## Rules

- No .planning/ directories. Plan lives in the conversation.
- If engineer says "just do it" at any point → stop planning, start implementing immediately.
- Maximum 3 questions total. Then propose approaches.
- Flat list only. No nested structure.
