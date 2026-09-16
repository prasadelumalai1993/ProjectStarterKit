# Project Start Prompt

Paste the block below into a fresh AI coding session (Claude Code or otherwise) at the very start of a new project — before any real code gets written. Replace `<PATH-TO-THIS-REPO>` with wherever this starter kit actually lives on disk (or its git URL, if it's been pushed somewhere the new session can reach). Fill in `<PROJECT NAME>` and the bracketed context.

---

> We're starting a new project called **`<PROJECT NAME>`**. Before writing any code, set up an `_alm/` folder (Architecture, Lifecycle & Management docs) that will be this project's living specification.
>
> Read `<PATH-TO-THIS-REPO>/INSTRUCTIONS.md` for the full pattern and the reasoning behind it, and use the templates in `<PATH-TO-THIS-REPO>/alm-templates/` as your starting point — adapt them, don't just copy them verbatim. If the templates alone aren't clear, look at `<PATH-TO-THIS-REPO>/alm-demo/` for a small worked example showing what a filled-in version actually looks like.
>
> Specifically, create:
> - `_alm/README.md` — index of the other files, one line each
> - `_alm/project-overview.md` — vision, goals, non-goals
> - `_alm/project-tree.md` — repo layout, to be kept current as code is added
> - `_alm/preferences.md` — conventions for anyone (human or AI) working in this repo
> - `_alm/design-choices.md` — key decisions and the reasoning behind them, appended to over time, entries never rewritten after the fact
> - `_alm/roadmap.md` — a staged/incremental plan, each step independently demoable, with exit criteria per step
> - `_alm/requirements/` — functional and non-functional requirements
> - `_alm/architecture/` — system architecture and tech stack, with the *why* behind each major choice
> - `_alm/testcases/` — a test plan per stage/increment of the roadmap
>
> Ask me whatever project-specific questions you need — vision, hard constraints, tech stack, target users, what's explicitly out of scope — rather than guessing or leaving placeholder text in these files. I'd rather answer five questions now than read five guesses later.
>
> Also set up a `handover_prompt.md` at the project root, following `<PATH-TO-THIS-REPO>/handover/HANDOVER_INSTRUCTIONS.md` and its template — this is what lets work survive a session ending unexpectedly (crash, context cutoff, me closing the wrong window) without losing what was happening.
>
> [If and only if this project will specifically be worked on via **Claude Code**, add:] Also look at `<PATH-TO-THIS-REPO>/claude-code-remote-session/README.md` and offer to set up the remote-session recovery scripts described there. [If this project might be worked on via a different AI tool, or several, leave this paragraph out entirely — it's Claude Code-specific and doesn't apply otherwise.]

---

## Notes for whoever is pasting this in

- **Don't skip the questions step.** A `_alm/` folder full of confident-sounding placeholder text is worse than an honest "not decided yet" — the whole point is that these files are true, not that they're complete on day one.
- **`_alm/design-choices.md` is append-only in spirit.** Don't go back and rewrite an old entry when a decision changes — add a new entry that supersedes it and says why. The history of *why we changed our minds* is often more useful later than the current state alone.
- **This prompt assumes a fresh, empty-ish project.** If you're retrofitting `_alm/` onto an existing codebase instead, say so up front — the session should read the actual code first and write `project-tree.md`/`architecture/` from what's really there, not from a plan.
