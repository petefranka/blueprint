# evidence.md format

```markdown
# Evidence Log

## INT-XXX

### E-001 — <short claim name>

#### Requirement
<one-sentence restatement>

#### Evidence
- <where this came from>

#### Confidence
High | Medium | Low

#### Category
Observation | Intent | Inference | Assumption | Unknown
```

**Confidence guide**
- High — directly and clearly shown in the source material.
- Medium — shown, but needs some interpretation, or shown only once.
- Low — inferred or assumed, not directly shown.

Every requirement that would meaningfully change what gets built needs an
entry here. Trivial restatements don't.

Evidence IDs are unique within the project and stable across reruns. Intent
documents cite them inline (`[E-001]`) instead of repeating source detail.
When an entry changes, retain its ID; when removed, do not reuse its ID for
a different claim.
