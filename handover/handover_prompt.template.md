# Handover Prompt

**If you are an AI agent (any platform) starting a session on this repo, read this entire file before doing anything else.** This is the single canonical continuity document for work-in-progress on this project — more current than any conversation summary you're given, and it survives a session ending without warning.

**Your obligations once you've read this:**
1. Treat "Current Status" below as authoritative for what's done/in-progress/next.
2. As you work, **keep this file up to date**: update "Current Status" in place (it's a living snapshot, not an append-only log) whenever it materially changes — a feature lands, a decision gets made, tests pass/fail, a bug is found. Do this at natural checkpoints, not just at the end.
3. Append a dated entry to "Session Log" (below Current Status) at the end of your session, or sooner if you hit a natural break point — this is the part that must survive a cutoff, so don't wait until "done" to write it. Keep entries dense and factual: decisions made, bugs found and their root cause, exact file paths, what's verified vs. assumed.
4. If the user references "the handover prompt" or points a new session at this file, that means: read it fully, resume exactly where "Current Status" leaves off, and keep maintaining it per the rules above — a standing instruction, not a one-time ask.
5. Never put secrets in this file (passwords, API keys, tokens) — reference where they live instead (e.g. ".env, gitignored").

This file lives at the project root, is git-tracked, and travels with the repo across machines/sessions and across whichever AI tool is being used.

---

## Current Status

**As of <DATE>.** <One or two sentences: what this project is, what phase of work it's in.>

**Done and verified:**
- <fill in>

**Not started yet:**
- <fill in>

**Immediate next step when resuming:** <fill in>

**Environment notes (this machine specifically, if relevant):**
- <fill in — anything a fresh session needs to not rediscover from scratch: env locations, credentials' whereabouts (never the values), known machine quirks>

---

## Session Log

### <DATE>
<What happened, what was decided, what broke and why, what's still open.>
