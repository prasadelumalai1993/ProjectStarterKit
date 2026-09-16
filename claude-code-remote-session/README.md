# Claude Code remote-session recovery

**This folder is specific to the Claude Code CLI. If a project is (or might be) worked on via a different AI coding tool, skip this folder entirely** — nothing here applies. It's kept separate from `../alm-templates/` and `../handover/` specifically so it doesn't get pulled in by mistake for a project that isn't Claude Code-specific.

## What this solves

Claude Code sessions can end unexpectedly — a crash, a context/usage cutoff, a closed window. Without anything extra, recovering means physically being at the machine to start a new session. This gives you: a session, already linked to your claude.ai account (so you can reach it from claude.ai/code or the mobile app), that gets created *automatically* on a timer, so a dead session self-heals without you touching the PC.

It assumes `../handover/handover_prompt.md` already exists in the project (see `../handover/HANDOVER_INSTRUCTIONS.md`) — the recovered session's first instruction is to read that file and continue from it.

## Setup for a new project

1. Copy `start_remote_session.ps1` and `start_remote_session.bat` into the project's **root** folder (not a subfolder) — both are self-locating: whatever folder they're placed in becomes "the project" for their purposes, and the session name is derived from that folder's name, so this works unmodified across as many projects as you set it up in, even run in parallel, without them colliding.
2. If the project needs Claude Code to access files outside its own root (a venv on another drive, a shared data folder), create `remote_session.extra_dirs.txt` next to the scripts — one absolute path per line, `#` for comments. This pre-authorizes those paths via `--add-dir` so a background session doesn't stall on a permission prompt nobody's there to answer. Not required otherwise.
3. Add to the project's `.gitignore`:
   ```
   /start_remote_session.log
   /remote_session.extra_dirs.txt
   ```
   (The two scripts themselves, and `handover_prompt.md`, ARE meant to be committed.)
4. Register a Windows Scheduled Task pointed at this project's own `start_remote_session.bat`, named so it's distinguishable from other projects' tasks (e.g. `<ProjectName> Remote Session Watchdog`), repeating every 5–15 minutes. GUI steps:
   1. Task Scheduler → **Create Task...**
   2. General: name it; "Run only when user is logged on" is the simple default (no stored password).
   3. Triggers → New: "On a schedule" → Daily → check **Repeat task every: 5 minutes**, **for a duration of: Indefinitely**.
   4. Actions → New: "Start a program" → point at this project's `start_remote_session.bat`.
   5. Conditions: uncheck "Start the task only if the computer is on AC power" if this is a laptop you want it to run on battery.
   6. Settings: confirm "If the task is already running... Do not start a new instance."

   Or the equivalent one-liner (replace the path):
   ```
   schtasks /create /tn "<ProjectName> Remote Session Watchdog" /tr "\"<path-to-project>\start_remote_session.bat\"" /sc minute /mo 5 /f
   ```

## What it does, precisely

- The `.bat` is a thin wrapper: runs the `.ps1`, tees its output to both the console and `start_remote_session.log` (so a scheduled/unattended run's result can still be checked afterward), then auto-closes the window ~60 seconds later (via a `ping` delay, not `pause`/`timeout` — those either block forever with nobody to answer, or error out with no console attached under Task Scheduler).
- The `.ps1` checks `claude agents --json --cwd <this folder>` for a still-alive session (interactive or background) here. If one exists, it does nothing — **idempotent by design**, safe to run on a tight schedule without piling up duplicate sessions.
- If none exists, it starts one: `claude --background --remote-control <folder-name>-recovery --name <same> --permission-mode auto "<the read-handover-prompt-and-continue instruction>"`.

## Things worth knowing, honestly

- **`--permission-mode auto`** mirrors an ordinary interactive session's bias toward action (not a full permissions bypass). A background session can still hit an approval prompt for something outside that scope; step 2 above (`remote_session.extra_dirs.txt`) proactively avoids the most predictable case of that. Whether such a prompt can actually be answered *through* Remote Control from the mobile app hasn't been independently verified — treat it as likely, not confirmed.
- **No true "create a session on my PC from my phone with nothing already running" option exists** for an individual/Pro/Max account. That would need a Team/Enterprise "self-hosted environment" (`ccpool_...`), registered by an org admin via `claude self-hosted-runner` — not something an individual account can self-register. The Scheduled Task above is the actual mechanism for an individual account, not a stopgap pending something better.
- **Enabling Remote Control on a session you're already in**, right now, without any of the above: the `claude` CLI's own `--remote-control` flag, or (from inside a running Claude Code session, if it has the right MCP tool available) turning it on for `"self"`.
