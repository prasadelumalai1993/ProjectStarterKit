# Project Starter Kit

A reusable starting point for a new project's documentation and session-continuity setup. Point a fresh AI coding session (or your own self, working by hand) at this repo when starting something new.

This repo covers two genuinely separate concerns — keep them separate, because the second one doesn't apply if you're not using Claude Code:

| Concern | Folder | Platform-specific? |
|---|---|---|
| Living project documentation (the `_alm/` pattern) | [`alm-templates/`](alm-templates/), [`alm-demo/`](alm-demo/) | No — works with any AI tool, or none |
| Cross-session work continuity (`handover_prompt.md`) | [`handover/`](handover/) | No — same reasoning applies to any AI coding tool that can lose context between sessions |
| Claude Code's own remote-session recovery scripts | [`claude-code-remote-session/`](claude-code-remote-session/) | **Yes — Claude Code CLI only.** Skip entirely on any other platform. |

## Quick start for a new project

1. Read [`PROJECT_START_PROMPT.md`](PROJECT_START_PROMPT.md) — it's written to be pasted directly into a fresh AI session at the start of a new project. It points that session back at the other files here.
2. Read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for the full reasoning — what each `_alm/` file is for, when to create it, and the discipline for keeping it from going stale.
3. Look at [`alm-demo/`](alm-demo/) for a small, fully worked example (a fictional toy project) if the templates alone aren't enough to see the pattern.
4. If working via Claude Code specifically, also see [`claude-code-remote-session/README.md`](claude-code-remote-session/README.md).

## Why this exists

Documented once, in [`INSTRUCTIONS.md`](INSTRUCTIONS.md): docs that live next to the code and get updated in the same change that changes the behavior they describe stay true; docs written once at kickoff and never touched again just rot. This repo exists so that discipline gets set up the same way every time, instead of being reinvented (or skipped) per project.
