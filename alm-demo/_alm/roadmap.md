# Roadmap

## Stage 1 — Import & structure

Goal: get recipes in from real sources, structured, and searchable by tag — proven before scaling or a cooking-mode UI gets built on top.

### Increment 1.0 — Text import
Plain-text/manual entry, parsed into structured fields (ingredients, steps, servings). Manual tagging.
**Exit criteria:** 10 real recipes typed in by hand come out with correctly separated ingredients vs. steps, verified by eye against the source.

### Increment 1.1 — Web import
Scrape schema.org/Recipe-annotated pages first; fall back to heuristic extraction for pages without it.
**Exit criteria:** 5 real recipe URLs from 5 different sites import with correct ingredients/steps/servings.

### Increment 1.2 — Photo import
OCR a photographed cookbook page, segment into ingredients/steps.
**Exit criteria:** 5 real photographed pages (different books/fonts) import with no more than one manual correction needed per recipe.

### Increment 1.3 — Search
Exact-tag search first, then ingredient-based ("what can I make with X") and time-to-cook filtering.
**Exit criteria:** a search for a specific on-hand ingredient returns every matching recipe in the library, verified against a manually-checked list.

**Stage 1 is done when:** a real personal collection (~30 recipes across all three import paths) is in the store, taggable, and searchable — no scaling or cooking-mode UI yet.

## Stage 2 — Cooking mode

Goal: make the app usable *while actually cooking*, not just for storage/search.

### Increment 2.0 — Serving-count scaling
### Increment 2.1 — Step-by-step cooking view
### Increment 2.2 — Offline-first multi-device sync

(Not detailed yet — Stage 2 planning starts once Stage 1's exit criteria are met, per preferences.md's "follow the roadmap's increment order.")

## Not scheduled yet

Ingredient-substitution suggestions, meal planning — see [design-choices.md](design-choices.md#deferred-not-rejected).
