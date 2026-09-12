---
description: "Discover product design material in this project and propose feature/capability boundaries for human approval. First step of the Blueprint product-intent pipeline. Also matches: 'turn this design into product intents', 'run blueprint against this project', 'analyse the current design and identify the product capabilities'."
argument-hint: "[optional: path or note pointing to specific design material]"
---

You are running **Blueprint Phase 1 (Discovery) and Phase 2 (Feature
Decomposition)**, as defined in `methodology/ORCHESTRATION.md` in the
Blueprint installation. Read that file, `methodology/roles/feature-decomposer.md`,
and `methodology/schemas/BLUEPRINT.md` before doing anything else.

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
   inventory and compact evidence summary.
   Follow its role definition exactly — capabilities, not
   screens; one eventual intent for capabilities that clearly form one
   independently deliverable outcome; boundary uncertainty surfaced, not
   hidden. Use its configured Haiku model. The subagent returns its
   proposal; write it to `intent/.work/feature-decomposition.md` yourself.

3. **Write** `intent/BLUEPRINT.md` using the structure in
   `methodology/schemas/BLUEPRINT.md` (or `templates/BLUEPRINT.md`).
   Create the `intent/` directory if it doesn't exist.

   Also save `intent/.work/discovery-summary.md` for continuation: a
   compact source inventory with paths, plus short notes on known
   journeys, states, actors, dependencies, conflicts, and missing
   material per proposed feature. Do not copy raw evidence or perform
   detailed analysis. This is a discovery aid, not an approved boundary
   list; continuation must reconcile it with the approved Blueprint.

    Reuse the discovery reads now instead of reopening sources later:
    - Write one self-contained packet per proposed feature to
       `intent/.work/evidence-packets/F<N>.md`. Include only relevant
       observed facts or necessary short excerpts, exact source paths,
       conflicts, missing material, and enough context to preserve meaning.
    - Write `intent/.work/evidence-packets/cross-feature.md` with only
       evidence about shared capabilities, dependencies, ordering, overlap,
       and conflicts between proposed features.
    - Write `intent/.work/discovery-state.md` containing the exact text of
       each proposed Blueprint entry, its packet path, and a SHA-256 hash for
       every referenced source as it existed during discovery. Hash binary
       sources too. Mark inaccessible or unhashable sources explicitly.

    Do not discard evidence to force a cheaper depth. The packet and hashes
    are cache inputs, not product conclusions. A preliminary route is
    reusable only when its approved entry and every referenced source hash
    are unchanged.

4. **Stop here.** Do not run any analyst, do not generate any final
   intent file, in this invocation. Tell the user:
   - a short summary of the proposed features (count + one-line each)
    - which capabilities were deliberately grouped into one eventual
       intent because they form one coherent delivery, if any
    - the preliminary depth per feature, noting that continuation rechecks
       changed entries or evidence
   - that this is a mandatory checkpoint: they should open and edit
   `intent/BLUEPRINT.md` (merge/split/rename/remove/add
     features, or just approve as-is by setting `Decision: APPROVED`)
   - the exact next command: `/blueprint-continue`

Do not proceed past step 4 even if the proposed Blueprint looks obviously
fine to you. The approval step is not optional.
