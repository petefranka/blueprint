# Changelog

## Unreleased

- Add a read-only Haiku scope assessor after feature approval, with a
  bounded discovery summary and a four-turn budget.
- Route each feature through focused, paired, or full specialist analysis
  according to small/medium/large depth; escalate affected features only.
- Keep independent critique and all quality checks at every depth, with
  cross-feature calls only when relevant and conservative fallback when
  assessment is incomplete.
- Read discovered sources once into feature-specific evidence packets,
  dispatch all independent analysis in parallel, and have the main session
  persist returned reports.
- Use bounded Haiku agents for decomposition, scoping, and medium analysis;
  use Sonnet for large analysis, cross-feature review, and final critique.
- Add delivery-boundary reasoning so capabilities that only make sense as
  one coherent outcome produce one feature and one intent file.
- Add scope-routing acceptance cases for all depths, mixed workloads,
  missing evidence, conflicts, and escalation.

## 0.1.0 — Initial release

- Core methodology: the two-step approval flow, the eight specialist
  roles, the document formats, and the technical-leakage check.
- Claude Code integration: `/blueprint` and `/blueprint-continue`
  commands, 8 subagents.
- A mandatory feature-approval step between splitting the product into
  features and analyzing them in detail.
- An install script that copies everything into a target project.
- A full worked example.
- 7 test fixtures with checklists, covering simple, multi-feature, shared
  capability, ambiguous, technical-leakage, contradictory, and
  complex-workflow cases.
