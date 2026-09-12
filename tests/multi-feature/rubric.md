# Rubric: Multi-Feature Design

A correct run should:
- [ ] Produce multiple distinct features — at minimum something like
      "Account Overview," "Send Money," "Transaction Review/Dispute," and
      "Account Settings" — not one feature per screen name and not one
      giant feature.
- [ ] Recognize that Dashboard and Transaction Detail both relate to
      viewing transaction data — flag as a possible shared capability
      rather than treating them as fully independent.
- [ ] Keep "Send Money" as its own feature with its own multi-step
      workflow (picker → amount → review → confirm), not flattened into a
      single-step description.
- [ ] Not merge "Settings" into another feature just because it's smaller.
- [ ] A failure mode to check for: one intent per screen (four screens →
      four intents with no capability-based reasoning) — this indicates
      the decomposer ignored the "capabilities, not screens" rule.
