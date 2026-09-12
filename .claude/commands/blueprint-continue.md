---
description: "Resume Blueprint after the human has approved/edited intent/BLUEPRINT.md. Runs parallel specialist analysis, synthesizes intent files, validates for technology leakage, and runs the quality gate. Second and final step of the Blueprint product-intent pipeline."
---

You are running **Blueprint Phases 3-7**, as defined in
`methodology/ORCHESTRATION.md` in the Blueprint installation. Read that
file in full before doing anything else, along with every file in
`methodology/roles/`, `methodology/schemas/`, and
`methodology/validation/tech-leakage-validator.md`.

## Preconditions

Read `intent/BLUEPRINT.md`. If it doesn't exist, tell the user to run
`/blueprint` first. If its `Decision:` field is not `APPROVED` or
`APPROVED WITH CHANGES`, stop and tell the user to approve it first — do
not proceed on a proposed-but-unapproved blueprint.

Treat whatever is currently in `BLUEPRINT.md` as ground truth. Do not
re-decide boundaries yourself.

## Do this now

1. Assign final IDs (`INT-001`, `INT-002`, ...) to each approved feature,
   in the order they appear in the approved blueprint.

2. **Phase 4 — Parallel Analysis.** For each feature, invoke these
   subagents via the Task tool, each with: the approved Blueprint entry
   for that feature + the full evidence pool from the original discovery.
   Each writes only to its own file at `intent/.work/<feature-id>/<role>.md`:
   - `product-analyst`
   - `ux-analyst`
   - `workflow-analyst`
   - `requirements-analyst`

   Then, once per full approved set (not per feature):
   - `dependency-analyst` (given the whole approved Blueprint)
   - `contradiction-analyst` (given the whole approved Blueprint and all
     discovered source material)

3. **Phase 5 — Synthesis.** In this main session (not a subagent), read
   every `.work/` file. For each feature, produce
   `intent/intents/INT-XXX-<slug>.md` following
   `methodology/schemas/intent-schema.md`. Deduplicate overlapping
   descriptions from different analysts, tag claims per the
   Observation/Intent/Inference/Assumption/Unknown rule, and route
   unresolved material to `intent/decisions.md` using the
   Decision/Assumption/Unknown/Out-of-Scope sorting rule — never invent an
   answer. Populate `intent/evidence.md` and `intent/intent-manifest.md`.

4. **Phase 6 — Validation.** Invoke the `intent-critic` subagent
   (Task tool) over the full synthesized intent set. Separately, apply
   `methodology/validation/tech-leakage-validator.md` yourself (two-pass:
   flag technical terms, then judge legitimate-context vs. leakage,
   rewriting any leakage into behavior language). Fold critic findings and
   validator fixes back into the intent files, `decisions.md`, or
   `evidence.md` as appropriate.

5. **Phase 7 — Quality Gate.** Check the complete intent set against every
   item in `methodology/schemas/intent-quality.md`. If anything fails,
   revise (this may mean re-synthesizing an intent) before finishing —
   do not report completion with a failing item.

6. **Re-runs**: if `intent/intents/` already contains files from a prior
   run, do not silently overwrite. Diff against the prior version, bump
   the `version` field, and summarize what changed. Do not delete existing
   `decisions.md` entries — move resolved ones to `Status: Resolved`
   instead.

7. Report to the user: how many intents were generated, what dependencies
   and shared capabilities were found, and — most importantly — how many
   entries are in `decisions.md` needing their attention, with a pointer
   to that file.

You may delete `intent/.work/` at the end of a successful run; it is
scratch space, not a deliverable.
