# precis

**Precision AI development. Develop like a senior engineer.**

precis is a Claude Code plugin that gives your AI assistant the discipline of a senior engineer — without the ceremony, bureaucracy, or mandatory pre-flight checklists.

Six focused workflows. Zero overhead for simple tasks. One escape hatch for when you know what you're doing.

---

## Install

**Claude Code:**
```bash
claude plugins install github:muhammad-saadd/precis
```

**Any agent (Cursor, Copilot, Gemini CLI):**
```bash
curl -fsSL https://raw.githubusercontent.com/muhammad-saadd/precis/main/install.sh | sh
```
This drops a single `CLAUDE.md` into your project. That's it.

---

## What it does

precis activates the right workflow at the right moment — silently, without asking for permission.

| When you say... | precis does... |
|----------------|---------------|
| "add user authentication" | Asks 3 targeted questions, proposes approaches, gives you a flat implementation list |
| "this test keeps failing" | Demands a hypothesis first, then isolates, then verifies the fix |
| Error message or stack trace | Same as above — systematic debugging protocol |
| "commit and push" | Checks your working tree, stages specific files, writes a why-focused commit message |
| Start a new session on in-progress work | Reads git history, tells you where you left off |

For simple, obvious tasks: it just answers. No activation.

---

## Six workflows

### `/precis plan`
Think before you build. Three questions max, then 2-3 approaches with trade-offs, then a flat numbered implementation list. No `.planning/` directories. No nested phases. Just: here's what to build, in order.

```
/precis plan add rate limiting to the API
/precis plan --quick refactor the auth middleware
```

### `/precis debug`
Hypothesis first. No shotgun changes. Before touching any code, state what you think is wrong. Then isolate. Then verify the fix actually fixed it.

```
/precis debug this endpoint returns 500 on empty body
/precis debug --quick
```

### `/precis build`
Write the test before the code. Always. Fail → implement → pass → refactor → commit. If TDD genuinely can't apply (legacy code, third-party integration), it says so explicitly instead of silently skipping.

```
/precis build
/precis build --quick   # skips TDD, implements directly
```

### `/precis review`
Pre-merge review that checks what linters can't: correctness, security (OWASP where relevant), logic gaps, test coverage. Returns PASS, PASS WITH NOTES, or BLOCK. Explicitly does not check style or formatting.

```
/precis review
/precis review --quick   # fast sanity check, PASS or BLOCK only
```

### `/precis ship`
Stage specific files (never `git add .`), write a commit message focused on *why*, bump VERSION if it exists, create a PR if you're on a feature branch. The dirty-tree check is unconditional — no flag bypasses it.

```
/precis ship
/precis ship --quick   # skips version bump and PR
```

### `/precis resume`
New session on in-progress work. Reads the last 20 commits, checks for uncommitted changes, outputs one paragraph: what was being built, where it stopped, what's next.

```
/precis resume
/precis resume --quick   # last 3 commits, one sentence
```

---

## Escape hatches

### `--quick` flag
Every workflow has a `--quick` flag that skips ceremony. Use it when you know what you're doing.

```bash
/precis plan --quick      # skip questions, straight to impl list
/precis debug --quick     # skip hypothesis, dive in
/precis build --quick     # skip TDD, implement directly
/precis review --quick    # 30-second sanity check only
/precis ship --quick      # skip version bump and PR
/precis resume --quick    # one sentence summary
```

### `/precis quick` — session mode
Disable all auto-triggers for the entire session. Explicit commands still work.

```bash
/precis quick
```

---

## Design decisions

**Why no mandatory pre-flight checks?**
Checking for applicable workflows before every message is the right instinct but the wrong implementation. It creates friction on every interaction. precis activates on context, not on ceremony.

**Why 6 skills instead of 30?**
Because 30 skills nobody memorizes is the same as 0 skills. Six workflows that cover 90% of the cases are more useful than 30 that cover 100% of them in theory.

**Why is `--quick` everywhere?**
Senior engineers know when to skip the protocol. Removing that judgment from them makes the tool worse. `--quick` trusts you.

**Why no `.planning/` directories?**
Files you didn't ask for are files you have to manage. Plans live in the conversation unless you explicitly ask to save one.

---

## How precis compares

If you've used other Claude Code workflow plugins, here's the concrete difference:

### vs. superpowers

[superpowers](https://github.com/superpowers-ai/superpowers) has a powerful skill system, but it enforces a skill check before **every message** — including clarifying questions. The "1% rule" means you're constantly paying overhead even when the answer is obviously just "yes". precis activates on context, not on ceremony.

| | superpowers | precis |
|--|------------|--------|
| Pre-flight check | Every message | Never |
| Skill taxonomy | 30+ skills | 6 workflows |
| Escape hatch | None | `--quick` on everything |
| Trigger model | Mandatory lookup | Silent context detection |
| File footprint | Plugin + hooks | One CLAUDE.md |

### vs. GSD (Get Shit Done)

[GSD](https://github.com/superpowers-ai/gsd) is excellent for long-running projects with clear milestones. It becomes overhead for anything smaller — it deploys a 4-agent pipeline (researcher → planner → verifier → executor) for tasks that need 10 lines of code, and leaves `.planning/` directories, `PLAN.md`, `RESEARCH.md`, and `STATE.md` throughout your repo.

| | GSD | precis |
|--|-----|--------|
| Planning model | Phases + milestones + roadmaps | Flat numbered list |
| Agent overhead | 4 agents per phase | Zero agents |
| File footprint | `.planning/` directories + multiple .md files | Nothing written unless you ask |
| Best for | Multi-month projects | Every project |
| Process trigger | Always waterfall-first | Scales to task size |

### The short version

Use GSD if you're managing a multi-month project with multiple people and want structured phase tracking. Use superpowers if you want broad workflow coverage and don't mind the overhead. Use precis if you want the discipline without the ceremony.

---

## Philosophy

precis is built on one observation: the best AI development workflows scale to the task. A bugfix should get zero overhead. A new system should get full discipline. Most tools pick one and apply it universally.

precis doesn't.

---

## License

MIT
