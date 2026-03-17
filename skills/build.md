# precis: build

TDD-first implementation. Test before code. Every time.

## Process

**Step 1 — Write the failing test:**
- Test the behavior, not the implementation
- One assertion per test where possible
- Name it: `test_[what_it_does_not_how]`
- Keep it minimal — just enough to define the contract

**Step 2 — Run it. Confirm it fails for the right reason:**
- "Function not found" or "assertion failed" = correct failure
- "Syntax error" = fix the test first

**Step 3 — Write minimal implementation:**
- Just enough code to make the test pass
- Resist adding anything the test doesn't require

**Step 4 — Run it. Confirm it passes.**

**Step 5 — Refactor if needed.** Tests must still pass after.

**Step 6 — Commit.** One logical unit per commit.

## --quick

Skip TDD. Implement directly. No test first. The engineer owns the risk.

## Rules

- If a test can't be written first (legacy code, integration boundary, third-party API),
  say so explicitly: "Can't TDD this because [reason]. Implementing directly."
  Never silently skip TDD.
- Don't write tests after the fact and call it TDD.
- Minimal means minimal. Don't gold-plate the implementation to pass a future test that doesn't exist yet.
- If the test suite doesn't exist yet, create it as part of Step 1.
