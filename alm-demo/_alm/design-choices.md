# Design Choices

## SQLite over a hosted/embedded document DB

**Decision:** store everything in a single local SQLite file.

**Alternatives considered:** a local document store (e.g. an embedded NoSQL DB) for schema flexibility while recipes' structure was still being figured out.

**Why:** the recipe schema (title, ingredients, steps, servings, tags) settled quickly during design and isn't expected to churn, so document-store flexibility wasn't buying much — and SQLite means the entire library is one file a user can back up by copying it, which matters more for a personal offline tool than schema flexibility does.

## Recipe scaling stores a base quantity + unit, not a pre-scaled string

**Decision:** ingredient quantities are stored as `(amount: float, unit: str)`, and "2 cups flour" is rendered from that at display time, scaled by whatever serving-count multiplier is active — never stored as scaled text.

**Alternatives considered:** storing the ingredient list as free text and doing string-based scaling (e.g. regex-replacing numbers) at display time.

**Why:** string-based scaling breaks on anything non-trivial (fractions, "a pinch," ranges like "2-3 cloves") and silently produces wrong output rather than failing loudly. Structured storage costs more at import time (the importer has to actually parse quantities) but makes scaling a pure, testable multiplication instead of regex archaeology.

## Deferred, not rejected

- **Ingredient-substitution suggestions** ("no buttermilk? use milk + vinegar") — deferred until there's a real ingredient ontology to hang substitutions off of; a flat suggestion list would just be a maintenance burden with no structure behind it.
- **Multi-device sync** — deferred to Stage 2, once Stage 1's local-only version is solid; syncing a half-finished schema is worse than syncing a settled one.
