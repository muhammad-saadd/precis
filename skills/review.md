# precis: review

Pre-merge code review. Check what linters can't.

## What to check

**Correctness**
- Does this do what it claims?
- Edge cases covered? (empty input, null, concurrent access, off-by-one)
- Error handling at system boundaries (user input, external APIs, file I/O)?

**Security** (OWASP top 10 where relevant)
- SQL/command injection vectors
- XSS in rendered output
- Auth bypass or privilege escalation
- Sensitive data in logs or error messages
- Unvalidated external input

**Logic gaps**
- Race conditions on shared state
- Wrong assumptions about external system behavior
- Cascading failure paths

**Test coverage**
- Are the important behaviors tested?
- Are the tests testing behavior or implementation?

## What NOT to check

- Code style, formatting, naming conventions — that's what linters are for
- "I would have done it differently"
- Hypothetical future requirements

## Output format

```
PASS
Ready to merge.

PASS WITH NOTES
- [file:line] observation — not a blocker
- [file:line] observation — not a blocker

BLOCK
- [file:line] issue — why this must be fixed before merge
```

**BLOCK** = do not merge. Fix required.
**PASS WITH NOTES** = merge is fine. Notes are advisory.
**PASS** = ship it.

## --quick

30-second scan only: obvious bugs and obvious security holes.
Returns PASS or BLOCK. No PASS WITH NOTES in quick mode.
