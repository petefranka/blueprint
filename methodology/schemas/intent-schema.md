# Feature document format (intent/intents/INT-XXX-*.md)

```markdown
---
id: INT-XXX
name: <Feature name>
version: 1
status: draft | reviewed
last_updated: <date>
---

# INT-XXX: <Name>

## Purpose
## Problem
## Users
## Desired Outcome
## User Goals
## Core Behaviour
## Workflows
## States
## Rules
## Experience Intent
## Constraints
## Dependencies
## Shared Capabilities
## Assumptions
## Open Decisions
## Out of Scope
## Acceptance Signals
## Evidence
```

**Rules for filling this out**
- No section should name a technology, framework, database, or API. See
  `validation/tech-leakage-validator.md`.
- Someone should be able to read one of these on its own and understand
  the intended product behavior, without having seen the original design.
- Every meaningful requirement should point to something in
  `evidence.md`.
