# System Architecture

## Components

### Importers (`importers/photo.py`, `web.py`, `text.py`)

**Responsibility:** turn one raw source (a photo, a URL, typed text) into the same structured shape — title, ingredients, steps, servings, time.

**Talks to:** nothing downstream directly; hands its output to `store/db.py`.

**Why it's separate from the store:** each source type has a completely different, source-specific extraction problem (OCR vs. HTML scraping vs. plain parsing), but everything past extraction is identical — keeping the store and search code ignorant of *how* a recipe arrived means a fourth importer (say, importing from a PDF cookbook) only ever needs a new module here, never a change anywhere else.

### Store (`store/db.py`)

**Responsibility:** the single local SQLite file — recipes, tags, ingredients — and the only code allowed to read/write it.

**Talks to:** called by importers (write) and search (read).

**Why it's separate from search:** so the storage schema can change without every search query needing to know about it directly — search goes through a query layer, not raw SQL scattered across the codebase.

### Search (`search/query.py`)

**Responsibility:** tag/ingredient/time-based lookup over the store.

**Talks to:** reads from `store/db.py` only.

## Data flow

Import: raw source → importer produces a structured recipe object → `store/db.py` assigns an ID and persists it → available to search immediately (no separate indexing step; SQLite queries the same tables directly).
