# Project Tree

## Current layout

```
RecipeBox/
├── README.md
├── .gitignore
├── pyproject.toml
├── src/
│   └── recipebox/
│       ├── importers/
│       │   ├── photo.py           # OCR + ingredient/step segmentation from a photographed page
│       │   ├── web.py             # recipe-schema-aware scraping (schema.org/Recipe first, fallback to heuristics)
│       │   └── text.py            # plain-text/manual entry parsing
│       ├── store/
│       │   └── db.py              # local SQLite store - recipes, tags, ingredients
│       └── search/
│           └── query.py           # tag/ingredient/time-based search over the local store
├── tests/
│   └── importers/
│       └── test_web_smoke.py      # real fetch against a saved fixture page, not mocked
└── _alm/
    └── ... (this folder)
```

**What's real vs. what's ahead of/behind the roadmap:** `importers/web.py` and `importers/text.py` are built and tested against real saved pages/notes. `importers/photo.py` is stubbed (raises `NotImplementedError`) — Increment 1.2 hasn't started. `search/query.py` only supports exact-tag matching so far; ingredient- and time-based search are Increment 1.3.

## Planned layout (not yet built)

```
src/recipebox/
└── sync/          # Stage 2 - offline-first sync across the user's own devices
```
