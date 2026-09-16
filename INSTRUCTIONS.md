# Instructions — the `_alm/` pattern

`_alm/` stands for **Architecture, Lifecycle & Management**. It's a folder of living documents that describe a project's *why* and *current shape* — separate from the code, but updated in lockstep with it. This file explains what each piece is for, when to create it, and the one discipline that keeps the whole thing from turning into stale, ignored documentation like every other docs folder that dies six weeks after project kickoff.

## The one rule that matters more than any file's contents

**Update the relevant `_alm/` file in the same change that changes the behavior it describes.** If a change touches the data model, `_alm/specifications/data-model.md` (or wherever that lives in your project) changes in the same commit. Not "I'll document it later" — later never comes, and a doc that drifted from the code is actively worse than no doc, because it actively misleads whoever reads it next (including a future AI session, which will trust it completely and confidently be wrong).

Everything else below is secondary to this one habit.

## The files, and what each is actually for

- **`README.md`** — a one-line-per-file index of everything else in `_alm/`, so a newcomer (human or AI) knows what exists before reading any of it. Update this the moment you add or remove an `_alm/` file — it's the cheapest file to keep current and the easiest one to forget.

- **`project-overview.md`** — vision, goals, non-goals. This is the file that answers "what are we actually building and why does it matter," in a form stable enough that it rarely changes. Non-goals are as important as goals: write down what you're deliberately *not* doing, because "should we add X" comes up again later and you want the answer already recorded, not re-litigated from memory.

- **`project-tree.md`** — the actual repo layout, kept current as code is added. This is the fastest way for a new session to understand "what exists vs. what's still a plan" without grepping the filesystem. Worth a section distinguishing what's real/tested from what's aspirational — code that's ahead of the roadmap (built early because it needed validating) is easy to mistake for "planned but not started" without that distinction.

- **`preferences.md`** — conventions for anyone (human or AI) working in this repo: hard constraints that shouldn't be relaxed without a deliberate decision, language/tooling choices, working style, testing philosophy. This is where you write down things that would otherwise get silently reinvented differently by every contributor (or every fresh AI session) — e.g. "tests hit a real local server, never mocks" or "no feature flags in a single-developer pre-release project."

- **`design-choices.md`** — key decisions and the reasoning behind them, one entry per decision, **appended to, not rewritten**. When a decision changes later, add a new entry explaining what changed and why, rather than editing the old one into looking like you always did it that way — the record of *why we changed our minds* is often more valuable later than the current state alone, especially for the decisions that get revisited under pressure. A "deferred, not rejected" section at the bottom is useful for things you deliberately chose not to build yet, so nobody re-proposes them as if they were never considered.

- **`roadmap.md`** — a staged, incremental plan. Each stage/increment should be independently runnable and demoable *before the next one starts* — if a later increment turns out harder than expected, everything before it is still a working system, not a pile of half-finished pieces. Give each increment explicit exit criteria: a concrete, checkable statement of what "done" means for that step, not a vibe.

- **`requirements/functional-requirements.md`** and **`non-functional-requirements.md`** — what the system must do, and the constraints it must do it under (performance, privacy, cost, offline-capability, whatever actually matters for this project). Keep these as testable statements where possible, not adjectives.

- **`architecture/system-architecture.md`** and **`tech-stack.md`** — the shape of the system and the concrete technology choices, each with the *why*, not just the *what*. A tech choice without its reasoning invites someone to "helpfully" swap it out later for a reason that was already considered and rejected.

- **`testcases/`** — a test plan per stage/increment of the roadmap, tied to that increment's exit criteria. An increment isn't actually done until its test plan passes, not just until the code compiles.

## When to create these

At project start, per [`PROJECT_START_PROMPT.md`](PROJECT_START_PROMPT.md) — ideally before much code exists, so the plan shapes the code rather than the other way around. If you're retrofitting this onto an existing project, write `project-tree.md` and `architecture/` from what's actually there (read the code first), and be honest in `design-choices.md` about which decisions were made deliberately vs. inherited/discovered after the fact.

## What "done" looks like

Look at [`alm-demo/`](alm-demo/) for a small, fully worked example. It's deliberately a toy project, kept short — the point is to show the *pattern* (what a filled-in file actually looks like, how specific vs. how vague, how long is long enough), not to be a template you copy verbatim.

## A note on scope

This pattern scales down as well as up. A weekend project doesn't need a five-page `system-architecture.md` — it needs a paragraph. The discipline (update docs in the same change as the behavior; append decisions rather than rewriting them; give increments real exit criteria) matters more than the file structure being followed to the letter. Cut what doesn't earn its place; don't cut the discipline itself.
