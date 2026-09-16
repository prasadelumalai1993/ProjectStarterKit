# Handover — cross-session work continuity

This is separate from the `_alm/` pattern (`../INSTRUCTIONS.md`): `_alm/` documents settled architecture and decisions; `handover_prompt.md` documents *where things stand right now, mid-task* — deliberately the opposite of settled, and expected to change every session.

**Works with any AI coding tool, or none.** The problem this solves — a session ends (crash, context cutoff, you closing the wrong window, hitting a usage limit) and the next one has to reconstruct what was happening — isn't specific to Claude Code. Use it the same way regardless of which tool you're working with.

## Setup

1. Copy [`handover_prompt.template.md`](handover_prompt.template.md) to the project root as `handover_prompt.md`.
2. Fill in the `<DATE>`/`<fill in>` placeholders with the project's actual current state.
3. Commit it — it's a real project file, not scratch output, and it should travel with the repo.

## The discipline

- **Treat "Current Status" as authoritative** over any conversation summary or memory a session starts with — it's more current.
- **Update "Current Status" in place** as work progresses — it's a living snapshot, not an append-only log. Do this at natural checkpoints, not just at the end of a session.
- **Append a dated "Session Log" entry** before a session ends, or sooner if you hit a natural break point. This is the part that has to survive a cutoff, so don't wait until "done" to write it — if there's a real chance the session won't get to finish, write the entry now, honestly, including what's still unverified.
- **Never put secrets in it.** Reference where they live instead (".env, gitignored", "ask the user").
- The template's own opening paragraph tells whoever reads it to keep maintaining it the same way — so once it exists, you shouldn't need to re-explain this discipline to a new session; pointing it at the file should be enough.

## What a good Session Log entry looks like

Dense and factual, not a narrative recap: decisions made, bugs found and their actual root cause (not just "fixed a bug"), exact file paths and function names, what's verified by actually running something vs. what's assumed. A future session (or you, a week later) should be able to act on the entry without re-deriving anything from the conversation it came from.
