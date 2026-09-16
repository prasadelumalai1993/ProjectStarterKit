# Preferences & Conventions

Read this before making changes — it applies to both the project owner and any AI coding agent working in this repo.

## Hard constraints — do not relax these without an explicit decision

<The non-negotiables. Things that would otherwise get silently reinterpreted differently by every contributor or every fresh AI session. Example shapes:
- "Fully local / no cloud dependency in the data path, except X."
- "Every external call goes through one adapter interface — never call a
  specific provider's SDK directly from business logic."
- "Every <core entity> gets a stable, unique ID at creation time — nothing
  downstream references it by position or text match.">

-
-

## Language & tooling

<Language(s), formatting/linting tool, dependency management approach, anything a fresh contributor needs to not guess.>

-
-

## Working style

- **Update `_alm/` in the same change that changes the behavior it describes.** See `_alm/README.md` and this starter kit's `INSTRUCTIONS.md` for why.
- **Follow the roadmap's stage order** in `roadmap.md` — don't build a later stage's complexity before there's real data/usage to test it against.
- No feature flags or backwards-compatibility shims <if this is a single-developer, pre-release, or otherwise low-stakes-to-break-things project — state that here, since it changes how aggressively you can refactor>.
- <Any other house rules specific to this project.>

## Testing

<What "tested" means for this project. Example shapes:
- "Every stage/increment in roadmap.md has exit criteria in testcases/ — a
  stage isn't done until those pass."
- "Favor small, real-data tests over mocked unit tests for anything where
  the risk lives in a model's/external system's actual behavior, not the
  plumbing around it.">

-
