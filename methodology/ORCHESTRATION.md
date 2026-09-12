# How Blueprint works

Blueprint runs in two steps, with a manual check in between. It never does
everything in one go.

```
/blueprint
  → look at the design material
  → split the product into features
  → write intent/BLUEPRINT.md
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
screens exist. When capabilities are clearly delivered, accepted, and
used as one coherent outcome, and neither is independently complete or
valuable, propose them as one feature so they produce one intent file.
Do not merge independently valuable outcomes merely because they share
a screen, data, interaction pattern, or likely implementation. For each
feature, note its purpose, who it's for, the outcome it should produce,
where the evidence came from, its delivery-boundary rationale, and
anything uncertain about the boundary itself. If there's more than one
reasonable way to split something, say so.

Write this to `intent/BLUEPRINT.md`, then stop. Don't move on to
detailed analysis in the same run.

## Step 2 (only after approval): /blueprint-continue

Whatever is in `BLUEPRINT.md` when this runs is final. Don't
second-guess the boundaries.

Discovery records a preliminary depth, evidence packet, exact entry
snapshot, and source hashes for each proposed feature. After approval,
reuse them only when the entry and all source hashes still match. Run the
**Scope Assessor** once only for stale, changed, added, merged, split, or
unverifiable entries. It recommends analysis depth, not new boundaries or
implementation effort. Do not send it on another discovery pass.

- **Small:** the main session covers product, UX, workflow, and
  requirements in one focused analysis.
- **Medium:** two independent specialists run in parallel. Product also
  covers requirements; workflow also covers UX. Supply both role
  definitions to each paired analyst, without the other analyst's notes.
- **Large:** four independent specialists run in parallel: product, UX,
  workflow, and requirements.

Depth is per feature: don't send every feature through the largest route
because one is complex. If an assessment is missing, invalid, or uncertain,
use at least medium for that feature; known large triggers still require
large. Never treat a failed assessment as small. Later findings can
escalate only the affected feature; don't repeat discovery or analysis of
unaffected features. Newly invoked specialists still reason independently.

Run the Dependency Analyst when evidence indicates or cannot rule out
sharing, ordering, prerequisites, or coupled outcomes. Run the
Contradiction Analyst when evidence indicates or cannot rule out
conflicting behavior, boundary overlap, or inconsistent terminology. If
either signal emerges later, invoke that role then. A skipped call never
removes the main session's checks for internal contradictions or external
prerequisites.

Discovery reads sources once and creates self-contained evidence packets:
one per proposed feature and one cross-feature packet containing only
relationship and conflict evidence. Continuation reuses unchanged packets
and rebuilds only stale ones.
Packets contain concise observed facts or necessary excerpts, exact source
references, conflicts, and missing material. Shared evidence goes only to
the packets that need it; relevant evidence is never dropped merely to
make a route cheaper.

Each invoked specialist only sees its assigned entry (or approved set),
its evidence packet, and role instructions—not raw project sources or
other analysts' notes. Agents return concise reports; the orchestrator
writes scratch files. That's on purpose: evidence is read once, prompts
stay bounded, and one analyst cannot simply echo another. The scope
recommendation controls dispatch; it is not product evidence.

Once all of that is in, combine it into one document per feature. Then:

- Scan for technical language that shouldn't be there (see
  `validation/tech-leakage-validator.md`) and rewrite it in plain product
  terms.
- Run a final review pass and fix anything missing before finishing (see
  `schemas/intent-quality.md`).

The independent Intent Critic and all quality checks are mandatory at
every depth. Less fan-out must not mean weaker deliverables.

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
