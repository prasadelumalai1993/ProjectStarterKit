# Preferences & Conventions

Read this before making changes — it applies to both the project owner and any AI coding agent working in this repo.

## Hard constraints — do not relax these without an explicit decision

- **Fully offline.** No component may require network access to view, search, or edit a recipe already in the store. Import of a *new* web recipe is the one exception, and only when explicitly triggered.
- **Every recipe gets a stable ID at import time**, independent of its title (titles get edited; the ID never changes) — search results, tags, and scaling all reference the ID, never the title text.

## Language & tooling

- Python, type hints throughout.
- `ruff` for formatting/lint.
- SQLite via the standard library — no ORM; the schema is small and stable enough that raw SQL stays more readable than an abstraction layer over it.

## Working style

- Update `_alm/` in the same change that changes the behavior it describes.
- Follow the roadmap's increment order — don't build ingredient-based search before exact-tag search is solid.
- This is a single-developer personal project: no feature flags, no backwards-compatibility shims for old data formats — migrate the data directly when the schema changes.

## Testing

- Real fixture data over mocks for importer tests — a saved real recipe web page, a real photographed page — since the risk lives in parsing quality, not the plumbing around it.
- Every roadmap increment has a matching file under `testcases/`; an increment isn't done until its test cases pass.
