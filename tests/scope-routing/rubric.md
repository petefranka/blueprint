# Scope Routing — Acceptance Checklist

Inspect both the routing recommendation and the actual dispatch. These
are behavioral acceptance tests, not measured latency or cost benchmarks.

## Mixed set

- Discovery records preliminary depth, exact entry snapshots, evidence
  packets, and SHA-256 hashes for every referenced source.
- Unchanged entries reuse their depth and packets. The assessor runs once
  only for stale, changed, added, merged, split, or unverifiable entries,
  on Haiku with read-only tools and at most four turns.
- It does not search the repository, open raw evidence, write files,
  launch specialists, or perform detailed analysis.
- For a cold or stale mixed set, exactly one requested row per ID:
  INT-001 small, INT-002 medium, INT-003 large. Reasons cite S1/S2/S3 and
  mark depth as an inference.
- The recommendation includes uncertainty/escalation triggers and both
  cross-feature signals. No invented evidence, timing estimate,
  boundary changes, or product decisions.
- The main session validates and saves routing before dispatch. It
  performs INT-001 analysis itself, invokes two independent paired agents
  for INT-002 and four independent specialists for INT-003.
- Medium covers product AND formal requirements in one output, and
  workflow AND UX in another; no perspective is dropped or passed between
  analysts. Large keeps all four specialists independent.
- Dependency analysis runs for the sharing signals in the mixed set.
  Contradiction analysis is skipped when evidence sufficiently rules out
  conflict. Any required independent calls are dispatched in parallel.
- Discovery reads sources once and creates one self-contained evidence
  packet per feature plus a cross-feature packet. Continuation rebuilds
  only stale packets.
  Packets retain exact source references, conflicts, missing material, and
  enough context to preserve meaning without copying irrelevant sources.
- Detailed analysis uses the relevant evidence packet, not merely the
  scope summary or full project-wide evidence pool.

## Single-feature and failure variants

- Variant 1: unchanged small; no assessor, feature specialist, or
  cross-feature calls. Continuation has one subagent call: the independent
  critic. It writes the final intent directly without an intermediate
  focused-analysis file. Success and invalid-input behavior remain.
- Variant 2: unchanged medium; two paired calls and critic. No mandatory
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
  succeeded. Missing cross-feature signals are treated as uncertain and
  trigger the relevant analyst rather than suppressing checks.
- Variant 8: current approval wins; do not restore removed features or
  silently apply stale evidence to additions. Missing evidence on the new
  feature produces a conservative route. Only stale entries are assessed
  and rebuilt.
- Variant 9: stop before invoking the assessor or any analyst.

## Invariants

- The critic, evidence tracking, uncertainty sorting, technology-leakage
  validation, and final quality gate remain mandatory on every route.
- The critic gets the synthesized documents, not the raw analyst notes.
- Existing decisions and re-run versioning are preserved.
- Cached analysis or critique is reused only when all declared input and
  output hashes match; escalation invalidates shallower cached analysis.
- External prerequisites and internal conflicts are checked even when
  cross-feature agents are skipped.
- Assessor, decomposer, and medium analysis use Haiku; large analysis and
  the critic use Sonnet. Agents have bounded effort and turns. Analysts
  return text for the main session to save and cannot search or write.
- Project and global installers include the assessor and its role;
  global installation rewrites its methodology references correctly.
- Final intents use the compact schema, inline evidence IDs, no empty
  optional sections, no implementation detail, and depth word targets.