# BLUEPRINT.md format

This is the file a human reviews and approves.

```markdown
# Blueprint (Proposed)

Status: PROPOSED | APPROVED

## F1: <Feature name>
- Purpose:
- Primary user:
- Desired outcome:
- Evidence:
- Confidence: High | Medium | Low
- Dependencies:
- Shared capabilities:
- Delivery boundary: Why this is one independently valuable outcome;
	name capabilities intentionally combined into this eventual intent.
- Analysis depth: Small | Medium | Large
- Depth reason: Evidence-backed reason plus escalation trigger.
- Evidence conflicts: None identified | <source references and conflict>
- Boundary uncertainty:

---
## Human decision
- Decision: APPROVED / APPROVED WITH CHANGES / NEEDS REWORK
- Notes:
```

Feature IDs (F1, F2...) are temporary — they become INT-001, INT-002, etc.
once approved, in whatever order the human leaves them in.

"Confidence" here is about the boundary itself, not any single
requirement inside it (that's scored separately in `evidence.md`).

"Analysis depth" is a preliminary routing decision made from discovery
evidence. Continuation may reuse it only while the entry and referenced
source hashes still match the discovery snapshot.

Each approved feature becomes one intent file. Combine capabilities in
the proposed Blueprint when they are evidently delivered, accepted, and
used as one coherent outcome and neither part is independently complete.
Do not combine independently valuable outcomes merely because they share
a screen, data, interaction pattern, or likely implementation.
