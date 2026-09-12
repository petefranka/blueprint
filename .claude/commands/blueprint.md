---
description: "Discover product design material in this project and propose feature/capability boundaries for human approval. First step of the Blueprint product-intent pipeline. Also matches: 'turn this design into product intents', 'run blueprint against this project', 'analyse the current design and identify the product capabilities'."
argument-hint: "[optional: path or note pointing to specific design material]"
---

You are running **Blueprint Phase 1 (Discovery) and Phase 2 (Feature
Decomposition)**, as defined in `methodology/ORCHESTRATION.md` in the
Blueprint installation. Read that file, `methodology/roles/feature-decomposer.md`,
and `methodology/schemas/roadmap.md` before doing anything else.

Argument (if provided): $ARGUMENTS — a hint about where to look first. Do
not treat it as the only input; still discover broadly.

## Do this now

1. **Discovery**: scan this project for product design material — Claude
   Design exports, screenshots, prototype descriptions, user flow docs,
   product notes, meeting notes, and any existing `intent/` directory from
   a previous run. List what you found and what's clearly missing. If you
   find nothing usable, stop and tell the user what kind of input you
   need — do not guess at a product from nothing.

2. **Feature Decomposition**: invoke the `feature-decomposer` subagent
   (Task tool, `subagent_type: feature-decomposer`) with the discovery
   inventory. Follow its role definition exactly — capabilities, not
   screens; boundary uncertainty surfaced, not hidden.

3. **Write** `intent/roadmap.md` using the structure in
   `methodology/schemas/roadmap.md` (or `templates/roadmap.md`).
   Create the `intent/` directory if it doesn't exist.

4. **Stop here.** Do not run any analyst, do not generate any final
   intent file, in this invocation. Tell the user:
   - a short summary of the proposed features (count + one-line each)
   - that this is a mandatory checkpoint: they should open and edit
   `intent/roadmap.md` (merge/split/rename/remove/add
     features, or just approve as-is by setting `Decision: APPROVED`)
   - the exact next command: `/blueprint-continue`

Do not proceed past step 4 even if the proposed roadmap looks obviously
fine to you. The approval step is not optional.
