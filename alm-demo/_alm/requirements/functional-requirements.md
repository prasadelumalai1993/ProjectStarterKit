# Functional Requirements

## Import

- FR-1: The system shall import a recipe from plain text, a web URL, or a photographed page, producing separate structured fields for title, ingredients (amount + unit + name), steps, servings, and total time.
- FR-2: The system shall assign every imported recipe a stable ID at import time, independent of its title.

## Search

- FR-3: The system shall support searching recipes by exact tag match.
- FR-4: The system shall support searching recipes by ingredient name (Increment 1.3).

## Scaling

- FR-5: The system shall recompute every ingredient's displayed quantity when the user changes the target serving count, without modifying the stored base quantity.
