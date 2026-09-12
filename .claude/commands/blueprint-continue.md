---
description: "Resume Blueprint after approval of intent/BLUEPRINT.md. Assesses depth, routes small/medium/large feature analysis, synthesizes intents, and runs independent critique and quality checks."
---

You are running **Blueprint Phases 3-7**, as defined in
`methodology/ORCHESTRATION.md` in the Blueprint installation. Check the
preconditions first, then read that file and
`methodology/roles/scope-assessor.md`. Load other role definitions,
schemas, and validation rules only when the relevant step needs them.

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

2. **Reuse check, selective scope assessment, then Phase 4 analysis.**
    Compare each approved entry with its exact snapshot in
    `intent/.work/discovery-state.md`, then verify the SHA-256 hash of every
    referenced source. Map unchanged temporary IDs to their final IDs.

    Reuse the preliminary depth and evidence packet only when the entry and
    all hashes match and no source was inaccessible or unhashable. Mark
    changed, added, merged, split, missing, or unverifiable entries stale.
    Removed entries are ignored. If discovery-state is absent, treat all
    entries as stale; do not rerun repository-wide discovery.

    For stale entries only, read their referenced sources once, rebuild
    self-contained packets at
    `intent/.work/evidence-packets/<feature-id>.md`, and update their source
    hashes. Each packet contains relevant observed facts or necessary short
    excerpts, exact source paths, conflicts, missing material, and enough
    context to preserve meaning. Shared evidence appears only in packets
    that need it. If a source cannot be represented faithfully, mark the
    limitation and use at least Medium.

    If any entries are stale, invoke `scope-assessor` once via the Task
    tool. Supply the full approved set and compact cross-feature summary for
    context, but explicitly request rows only for the stale final IDs. Use
    its configured Haiku model and do not override it. Validate one row per
    requested ID, valid depth labels, reasons, and escalation triggers.
    Ignore unknown IDs; use at least Medium for missing, duplicate, invalid,
    failed, or incomplete assessments, and Large wherever known Large
    triggers apply. Do not retry the assessor in a loop. If no entries are
    stale, do not invoke it.

    Rebuild `cross-feature.md` only when membership changed, a contributing
    entry or source changed, or the packet is missing. Save accepted routes,
    reuse decisions, reasons, and current hashes to
    `intent/.work/scope-assessment.md`. An explicit request for deeper
    analysis wins over a cheaper route. Briefly report route and reuse
    counts before dispatch.

    Maintain `intent/.work/run-manifest.md`. For each reusable analysis,
    record hashes of the approved entry, evidence packet, agent definition,
    assigned role definitions, routing policy, and saved output. Reuse an
    output only when every input hash and the output hash match. Otherwise
    regenerate only that output. Never use a cached result from a shallower
    route after escalation.

    Analyze each feature using its accepted depth:
    - **Small:** do not create an intermediate analyst report. After any
       required cross-feature calls complete, synthesize the final intent
       directly in this main session from the approved entry, its evidence
       packet, and current cross-feature findings. Cover product, UX,
       workflow, and requirements. No feature analyst call is required.
    - **Medium:** invoke `product-analyst` with the additional requirements
       role and `workflow-analyst` with the additional UX role in parallel.
       Explicitly assign both roles in each invocation and give each the
       approved entry plus that feature's evidence packet. Use each agent's
       configured Haiku model. When both return, save their text as
       `product-requirements.md` and `workflow-ux.md` under
       `intent/.work/<feature-id>/`.
    - **Large:** invoke `product-analyst`, `ux-analyst`, `workflow-analyst`,
       and `requirements-analyst` independently in parallel. Override each
       invocation to Sonnet. Give each the approved entry plus that
       feature's evidence packet. When they return, save their text to
       `intent/.work/<feature-id>/<role>.md`.

   Agents return concise reports; they do not write files or search for
   more evidence. Never give an analyst another analyst's notes. The
   assessor's summary does not replace evidence packets for analysis.
   Skip any invocation whose manifest entry is fully reusable.

   Run `dependency-analyst` only when approved entries or
   `cross-feature.md` indicate sharing, ordering, prerequisites, or coupled
   outcomes. Run `contradiction-analyst` only when they indicate conflicting
   evidence, incompatible behavior, boundary overlap, or inconsistent
   terminology. Missing or uncertain cross-feature evidence is a signal
   to run the relevant analyst, not to skip it. Give each the approved set
   and `cross-feature.md`; save returned text under distinct paths in
   `intent/.work/cross-feature/`. Reuse a valid manifest result when
   possible. Dispatch every non-cached independent feature and
   cross-feature invocation in the same parallel batch. When skipped,
   the main session still checks external prerequisites and internal
   contradictions during synthesis.

    If analysis or critique reveals greater complexity, record the reason
    and escalate only that feature to medium or large, invoking the newly
    required independent analysis without passing earlier analysts' notes.
    Mark superseded scratch outputs and synthesize only the current route's
    results. If a conflict emerges and the contradiction analyst has not
    run, invoke it once. Do not rerun discovery or unaffected features.

3. **Phase 5 — Synthesis.** In this main session (not a subagent), read
   the current route's analysis outputs for this run, not stale or
   superseded scratch files. Scope assessments are routing metadata, not
   product evidence. For Small features, perform the direct synthesis
   described above without creating a focused-analysis file. For each
   feature, produce
   `intent/intents/INT-XXX-<slug>.md` following
   `methodology/schemas/intent-schema.md`. Deduplicate overlapping
   descriptions from different analysts, tag claims per the
   Observation/Intent/Inference/Assumption/Unknown rule, and route
   unresolved material to `intent/decisions.md` using the
   Decision/Assumption/Unknown/Out-of-Scope sorting rule — never invent an
   answer. Populate `intent/evidence.md` and `intent/intent-manifest.md`.

4. **Phase 6 — Validation.** Invoke the `intent-critic` subagent
   (Task tool) over the full synthesized intent set at every depth, using
   its configured Sonnet model. Give it the approved Blueprint,
   synthesized documents, decisions, manifest, and evidence ledger—not
   raw source material or analyst scratch reports. Save its returned text
   to `intent/.work/intent-critic.md`. Separately, apply
   `methodology/validation/tech-leakage-validator.md` yourself (two-pass:
   flag technical terms, then judge legitimate-context vs. leakage,
   rewriting any leakage into behavior language). Fold critic findings and
   validator fixes back into the intent files, `decisions.md`, or
   `evidence.md` as appropriate.

   Cache the critic only when hashes of the complete synthesized set,
   decisions, manifest, evidence ledger, critic definition, and quality
   schema all match a successful prior review. Otherwise invoke it. If the
   critic identifies a missed dependency, contradiction, or greater feature
   complexity, run only the newly required analysis, resynthesize affected
   documents, and rerun validation.

5. **Phase 7 — Quality Gate.** Check the complete intent set against every
   item in `methodology/schemas/intent-quality.md`. If anything fails,
   revise (this may mean re-synthesizing an intent) before finishing —
   do not report completion with a failing item.

6. **Re-runs**: if `intent/intents/` already contains files from a prior
   run, do not silently overwrite. Diff against the prior version, bump
   the `version` field, and summarize what changed. Do not delete existing
   `decisions.md` entries — move resolved ones to `Status: Resolved`
   instead.

7. Report to the user: accepted depth per feature and any escalations,
   how many intents were generated, what dependencies
   and shared capabilities were found, and — most importantly — how many
   entries are in `decisions.md` needing their attention, with a pointer
   to that file.

Retain `intent/.work/discovery-state.md`, `evidence-packets/`,
`scope-assessment.md`, and `run-manifest.md` as a local cache. Other
scratch files may be deleted after a successful run. Never treat cache
files as deliverables or product evidence.
