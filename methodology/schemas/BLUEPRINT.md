# BLUEPRINT.md format

This is the file a human reviews and approves.

```markdown
# BLUEPRINT (Proposed)

Status: PROPOSED | APPROVED

## F1: <Feature name>
- Purpose:
- Primary user:
- Desired outcome:
- Evidence:
- Confidence: High | Medium | Low
- Dependencies:
- Shared capabilities:
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
