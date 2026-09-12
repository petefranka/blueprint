# Final intent check

Before deleting `.work/`, verify:

- The file path matches `intent/EV-###-<slug>/INTENT.md` and its frontmatter
  uses the same EV ID.
- The EV represents one coherent, independently deliverable outcome.
- Outcome says who needs what and why.
- Important primary, alternative, failure, interrupted, and recovery paths
  are covered without repetition.
- Important states, transitions, and business rules are explicit.
- Assumptions, decisions, unknowns, and boundaries are correctly labelled.
- Dependencies and shared capabilities name affected EVs where applicable.
- Every meaningful claim cites an E-### ID defined exactly once in Sources.
- Source references point to original design material and do not invent
  evidence.
- No technology, framework, database, API, architecture, or implementation
  choice appears in product behavior.
- Required sections are present; empty optional sections are omitted.
- There is no preamble, recap, process narration, filler, or duplicated idea.
- The file is understandable without opening the original design.
- It meets its depth word target, or every excess passage preserves distinct
  material behavior or uncertainty.
- `status: reviewed` is set only after critic and validation pass.
- The EV folder contains only `INTENT.md` after successful cleanup.