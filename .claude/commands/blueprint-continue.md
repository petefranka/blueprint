---
description: "Finalize approved intent/EV-*/INTENT.md files. Routes analysis by depth, validates each intent, and removes temporary working files after success."
---

You are running Blueprint continuation as defined in
`methodology/ORCHESTRATION.md`. Read that file and
`methodology/roles/scope-assessor.md`, then load other role definitions and
schemas only when needed.

## Preconditions

Find `intent/EV-[0-9][0-9][0-9]-*/INTENT.md` files with
`status: approved`. These are the current batch. Ignore `status: reviewed`
folders unless the user explicitly asks to rerun them.

If none are approved, tell the user to run `/blueprint` or approve a
proposed `INTENT.md`, then stop. The approved folder name and intent content
are ground truth. Do not redraw their boundaries.

## Analyze

For each approved EV folder:

1. Read `INTENT.md` and `.work/EVIDENCE.md`. If either working evidence or
   `.work/STATE.json` is missing, rebuild both from the sources listed in
   the intent. Do not perform repository-wide discovery.

2. Verify current source SHA-256 hashes against `STATE.json`. If the intent
   or evidence changed, mark the route stale. Invoke `scope-assessor` once
   for all stale EVs, using its configured Haiku model. Unchanged valid
   routes may be reused. Missing, invalid, or uncertain assessment defaults
   to at least Medium; known Large signals require Large.

3. Route each EV independently:
   - **Small:** synthesize directly in the main session. No feature analyst.
   - **Medium:** run `product-analyst` with requirements and
     `workflow-analyst` with UX in two parallel Haiku calls.
   - **Large:** run product, requirements, workflow, and UX analysts in four
     independent parallel Sonnet calls.

   Give each analyst only that EV's approved intent proposal, evidence
   packet, and assigned role instructions. Agents return concise reports;
   they do not write files or search the project. Store results temporarily
   under that EV's `.work/` directory and record their input/output hashes
   in `STATE.json`.

4. Across the approved batch, run `dependency-analyst` when evidence
   indicates or cannot rule out sharing, ordering, prerequisites, or
   coupled outcomes. Run `contradiction-analyst` when evidence indicates or
   cannot rule out conflicts, overlap, or inconsistent terminology. Give
   them compact evidence from the affected EVs only. Dispatch all required
   independent calls in one parallel batch.

If analysis reveals greater complexity, escalate only the affected EV and
invalidate its shallower temporary result. Do not rerun unaffected EVs.

## Finalize

For each EV, rewrite the same `INTENT.md` in place using
`methodology/schemas/intent-schema.md`:

- Preserve its EV ID and folder name.
- Bump `version` on a rerun and set `status: reviewed` after validation.
- Use the compact behavior-first sections and depth word target.
- Put assumptions, decisions, unknowns, and out-of-scope statements under
  Uncertainty. Do not create a separate decisions file.
- Put stable E-### references and their source paths under Sources. Do not
  create a separate evidence file.
- Put dependencies and shared capabilities under Relationships. Do not
  create a manifest.
- Describe product behavior, never implementation. State each idea once;
  omit empty optional sections and avoid preambles or recaps.

Invoke `intent-critic` over the approved batch's completed `INTENT.md`
files using its configured Sonnet model. Apply
`methodology/validation/tech-leakage-validator.md` and check every item in
`methodology/schemas/intent-quality.md`. Fold valid findings into the intent
files. If critique reveals missing analysis, run only the required work and
validate again.

## Cleanup and report

Only after every intent passes validation:

1. Set each completed file to `status: reviewed`.
2. Delete each completed EV folder's `.work/` directory entirely.
3. Confirm the EV folder contains exactly one generated file: `INTENT.md`.
4. Never delete or modify the original design sources.
5. Report completed EV folders, accepted depth and escalations, and open
   decisions recorded in each intent.

If the run fails or is interrupted, retain `.work/` so continuation can
resume. A later rerun of a cleaned EV intentionally re-reads its listed
sources because successful cleanup removes the cache.