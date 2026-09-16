# Project Tree

This file is a living document — update it whenever the repo layout changes. Its job is to let a newcomer (human or AI) understand "what exists vs. what's still a plan" without grepping the filesystem.

## Current layout

```
<PROJECT-ROOT>/
├── README.md
├── .gitignore
├── <manifest file — pyproject.toml / package.json / go.mod / ...>
├── src/
│   └── <fill in as code is added — one line per top-level module, a short
│         comment on what it does, not a restatement of its name>
├── tests/
│   └── <mirror src/ structure, or note the actual convention if different>
└── _alm/
    ├── README.md
    ├── project-overview.md
    ├── project-tree.md            ← this file
    ├── preferences.md
    ├── design-choices.md
    ├── roadmap.md
    ├── requirements/
    ├── architecture/
    └── testcases/
```

**What's real vs. what's ahead of/behind the roadmap:** <a short paragraph, updated as things change, distinguishing code that's built-and-tested from code that's still aspirational. This is the single most useful sentence in this file for a fresh session — without it, "there's a file called X" gets silently read as "X is done and correct," which is often wrong.>

## Planned layout (not yet built)

```
<sketch of what's coming, if useful — delete this section once the plan has
 either been built or superseded; don't let it go stale next to the real
 "Current layout" above>
```
