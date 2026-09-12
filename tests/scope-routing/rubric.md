# Scope Routing — Acceptance Checklist

Inspect both the routing recommendation and the actual dispatch. These
are behavioral acceptance tests, not measured latency or cost benchmarks.

## Mixed set

- The assessor runs once after approval, on Haiku in Claude Code, with
  read-only tools and at most four turns. It receives only approved
  entries and the compact summary, plus its methodology instructions.
- It does not search the repository, open raw evidence, write files,
  launch specialists, or perform detailed analysis.
- Exactly one row per approved ID: INT-001 small, INT-002 medium,
  INT-003 large. Reasons cite S1/S2/S3 and mark depth as an inference.
- The recommendation includes uncertainty/escalation triggers and both
  cross-feature recommendations. No invented evidence, timing estimate,
  boundary changes, or product decisions.
- The main session validates and saves routing before dispatch. It
  performs INT-001 analysis itself, invokes two independent paired agents
  for INT-002 and four independent specialists for INT-003.
- Medium covers product AND formal requirements in one output, and
  workflow AND UX in another; no perspective is dropped or passed between
  analysts. Large keeps all four specialists independent.
- Dependency and contradiction analysts each run once over the full set,
  not once per feature. Independent calls are dispatched in parallel.
- The main session reads discovered sources once and creates one
  self-contained evidence packet per feature plus a cross-feature packet.
  Packets retain exact source references, conflicts, missing material, and
  enough context to preserve meaning without copying irrelevant sources.
- Detailed analysis uses the relevant evidence packet, not merely the
  scope summary or full project-wide evidence pool.

## Single-feature and failure variants

- Variant 1: small; no feature specialist or cross-feature calls. The
  continuation has two subagent calls: assessor and independent critic.
  Success and invalid-input behavior both remain in the final intent.
- Variant 2: medium; two paired calls, assessor, and critic. No mandatory
  cross-feature calls for a single feature without conflicts. Paired
  calls use Haiku and return reports without search or write tools.
- Variant 3: large despite being a single feature; all four specialists
  run on Sonnet. Unknown timing rules remain explicit, not invented.
- Variant 4: at least medium; missing evidence cannot justify small.
  Do not repeat discovery merely to classify depth.
- Variant 5: not small; a contradiction analyst runs even for one feature.
  Neither the assessor nor the analyst silently resolves the conflict.
- Variant 6: record escalation to large and invoke the required independent
  analysis for INT-001. Invoke contradiction analysis if not yet run.
  Do not rerun discovery or any unaffected feature. Superseded analysis
  must not be merged as current evidence.
- Variant 7: reject invalid/duplicate/missing rows and ignore INT-999;
  affected features use at least medium, with known large triggers still
  selecting large. No retries in a loop or false claims that assessment
  succeeded. Missing cross-feature recommendations never suppress checks
  required by the approved feature count or known conflicts.
- Variant 8: current approval wins; do not restore removed features or
  silently apply stale evidence to additions. Missing evidence on the new
  feature produces a conservative route.
- Variant 9: stop before invoking the assessor or any analyst.

## Invariants

- The critic, evidence tracking, uncertainty sorting, technology-leakage
  validation, and final quality gate remain mandatory on every route.
- The critic gets the synthesized documents, not the raw analyst notes.
- Existing decisions and re-run versioning are preserved.
- External prerequisites and internal conflicts are checked even when
  cross-feature agents are skipped.
- Assessor, decomposer, and medium analysis use Haiku; large analysis and
  the critic use Sonnet. Agents have bounded effort and turns. Analysts
  return text for the main session to save and cannot search or write.
- Project and global installers include the assessor and its role;
  global installation rewrites its methodology references correctly.