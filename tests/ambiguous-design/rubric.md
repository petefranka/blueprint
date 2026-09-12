# Rubric: Ambiguous Design

A correct run should:
- [ ] Produce a `decisions.md` entry for "what default permissions/role
      does an invited member get" — this is exactly the kind of
      materially-behavior-affecting gap that must become a Decision.
- [ ] NOT invent a default role (e.g. "invited members get read-only
      access by default") and present it as settled fact anywhere in the
      intent.
- [ ] The intent for this feature should still be generated (missing this
      one detail doesn't block the whole feature) with an Open Decisions
      pointer to the entry.
- [ ] A failure mode to check for: silently assuming a "reasonable
      default" permission level without flagging it as a Decision — that
      violates the sorting rule (this is high-impact, not low-impact, so
      it cannot be filed as a mere Assumption).
