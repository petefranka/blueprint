# How Blueprint works

Blueprint runs in two steps, with a manual check in between. It never does
everything in one go.

```
/blueprint
  → look at the design material
  → split the product into features
  → write intent/roadmap.md
  → STOP and wait for a human to approve it

/blueprint-continue
  → read the approved feature list
  → analyze each feature in detail
  → write one document per feature, plus a decisions log
```

## Step 1: /blueprint

Look at everything available — screenshots, notes, exports, existing
`intent/` output from an earlier run. Don't assume there's just one input
file. If there's nothing usable, say so instead of guessing at a product.

Then split what you found into distinct **features** — not screens. A
feature can span several screens; a screen can hold several features.
Base the split on user goals and outcomes, not on how many files or
screens exist. For each feature, note its purpose, who it's for, the
outcome it should produce, where the evidence came from, and anything
uncertain about the boundary itself. If there's more than one reasonable
way to split something, say so.

Write this to `intent/roadmap.md`, then stop. Don't move on to
detailed analysis in the same run.

## Step 2 (only after approval): /blueprint-continue

Whatever is in `roadmap.md` when this runs is final. Don't
second-guess the boundaries.

For each approved feature, four specialists look at it independently:
product, UX, workflow, and requirements. Two more — dependency and
contradiction — look across *all* features at once, since their job only
makes sense at that level.

Each specialist only sees the feature (or features) it's assigned, plus
the full evidence pool — not each other's notes. That's on purpose: it
keeps one analyst from just echoing another instead of thinking
independently.

Once all of that is in, combine it into one document per feature. Then:

- Scan for technical language that shouldn't be there (see
  `validation/tech-leakage-validator.md`) and rewrite it in plain product
  terms.
- Run a final review pass and fix anything missing before finishing (see
  `schemas/intent-quality.md`).

## Rules that apply throughout

**Keep five kinds of claim separate, always:**
- what the design literally shows
- what that means for the product
- what's strongly implied but not shown directly
- what's a reasonable assumption, not confirmed
- what simply can't be determined yet

Don't blur these together — don't upgrade a guess into a stated fact.

**Unclear things get sorted, not guessed at:**
- If it would change what users actually experience, and nothing settles
  it → write it down as an open decision.
- If it's minor and a sensible default clearly applies → state the
  assumption plainly.
- If it's genuinely unknowable right now and low-impact → mark it unknown.
- If it's just not this feature's job → mark it out of scope.

**On a re-run**, don't erase prior decisions or overwrite documents
silently — note what changed, and move resolved questions to "resolved"
instead of deleting them.
