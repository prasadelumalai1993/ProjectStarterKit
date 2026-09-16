# Tech Stack

| Layer | Choice | Why (or link to design-choices.md) |
|---|---|---|
| Language/runtime | Python 3.12 | Matches the OCR/scraping libraries needed for import; no performance case for anything else at this scale. |
| Storage | SQLite, no ORM | See design-choices.md — schema settled early, single-file backup matters more than flexibility. |
| Web import | `requests` + schema.org/Recipe parsing, heuristic fallback | Most recipe sites already emit structured recipe markup; heuristics only needed for the minority that don't. |
| Photo import (planned) | Local OCR (not yet chosen — evaluating options in Increment 1.2) | Must stay offline per preferences.md's hard constraint; rules out any cloud OCR API. |
