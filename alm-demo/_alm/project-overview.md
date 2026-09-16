# Project Overview

## Vision

Recipe Box turns a personal, scattered collection of recipes — screenshots, bookmarked web pages, hand-typed notes, a few photographed cookbook pages — into one searchable, taggable library, so "what can I cook with what's in the fridge" is a search, not a memory exercise.

## Goals

- Import a recipe from a photo, a web link, or plain text, and end up with structured fields (ingredients, steps, servings, time) — not just a wall of unstructured text.
- Tag and search by ingredient, cuisine, and time-to-cook.
- Scale a recipe's quantities to a different serving count without doing the arithmetic by hand.
- Work fully offline — this is a kitchen tool, not something that should break because the wifi is down.

## Non-goals

- **Not a meal-planning or grocery-list app.** Recipe storage and retrieval only; meal planning is a different problem with different UX needs, and bolting it on would dilute both.
- **Not a social/sharing platform.** Personal use only — no accounts, no public recipe pages, no comments.
- **Not built around perfect OCR.** Photo import is expected to need occasional manual correction; the goal is "faster than retyping," not "flawless."

## Stages / phases

1. **Stage 1 — Import & structure** (this is the current stage): get recipes in, structured, and searchable. See [roadmap.md](roadmap.md).
2. **Stage 2 — Cooking mode**: scaling, a step-by-step "cooking view," and offline-first sync across the user's own devices. Not started; see roadmap.md's "Not scheduled yet."

## Reference

None yet — no external spec this is implementing against.
