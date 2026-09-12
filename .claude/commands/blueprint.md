---
description: "Discover product design material and create one proposed INTENT.md per coherent design outcome for human approval. First step of the Blueprint workflow."
argument-hint: "[optional: path or note pointing to specific design material]"
---

You are running Blueprint discovery and proposal, as defined in
`methodology/ORCHESTRATION.md`. Read that file,
`methodology/roles/feature-decomposer.md`, and
`methodology/schemas/intent-schema.md` before doing anything else.

Argument (if provided): $ARGUMENTS — a hint about where to look first. Do
not treat it as the only input; still discover broadly.

## Do this now

1. **Discovery**: scan this project for product design material — Claude
   Design exports, screenshots, prototype descriptions, user flow docs,
   product notes, meeting notes, and any existing `intent/` directory from
   a previous run. List what you found and what's clearly missing. If you
   find nothing usable, stop and tell the user what kind of input you
   need — do not guess at a product from nothing.

2. **Identify design outcomes.** Invoke `feature-decomposer` once with the
   discovery inventory and a compact evidence summary. A design outcome is
   a coherent capability that can be delivered and accepted as one unit.
   Capabilities incomplete without each other belong together. Unrelated,
   independently valuable outcomes become separate design outcomes even if
   they share a screen or implementation.

3. **Create one folder per outcome.** Under `intent/`, assign the next
   unused sequential ID and a short lowercase ASCII slug:

   `EV-001-short-summary-of-design-work`

   Never reuse an EV number. Determine the next number from all existing
   `intent/EV-*` folders. Create exactly these files initially:

   ```text
   intent/EV-001-short-summary/
   ├── INTENT.md
   └── .work/
       ├── EVIDENCE.md
       └── STATE.json
   ```

   Do not create `blueprint.md`, `evidence.md`, `decisions.md`, a manifest,
   an `intents/` directory, discovery summaries, discovery-state files, or
   feature-decomposition files.

4. **Write the proposal in `INTENT.md`.** Follow
   `methodology/schemas/intent-schema.md`. Set `status: proposed`, include
   the preliminary Small/Medium/Large depth, and populate only evidence-
   supported content. The same file is the approval checkpoint and later
   becomes the final intent. Put open decisions, assumptions, unknowns,
   and boundaries under Uncertainty. Put compact source references under
   Sources.

5. **Write temporary working state.** `EVIDENCE.md` contains the detailed
   evidence packet used by analysts: observed facts, necessary short
   excerpts, exact source paths, conflicts, and missing material. Assign
   stable E-### IDs that match the Sources section in `INTENT.md`.
   `STATE.json` contains the preliminary route, source SHA-256 hashes,
   cross-outcome signals, and later analysis hashes/results. Hash text and
   binary sources; mark inaccessible sources. These files are temporary
   and are removed only after successful continuation.

6. **Stop for approval.** Do not run feature analysts or finalize an
   intent. Tell the user which EV folders were created, their preliminary
   depths, and which capabilities were grouped. Ask them to edit each
   `INTENT.md` as needed, especially Uncertainty, then sign off each one:

   `/blueprint-signoff <EV-ID>`

   Example: `/blueprint-signoff EV-001`. If a proposal is not acceptable,
   run `/blueprint-reject <EV-ID> <reason>` instead, revise the same file,
   and sign it off later. After all intended EVs are approved, the next
   command is `/blueprint-continue`.

Do not continue without approval. If discovery produced multiple coherent
outcomes, every outcome gets its own EV folder and one `INTENT.md`.
