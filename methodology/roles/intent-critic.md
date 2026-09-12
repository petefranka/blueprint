# Intent Critic

Reviews the finished set of feature documents for problems that only show
up once everything is combined:

- unclear wording
- missing steps or states
- technical language that snuck in
- assumptions stated without any real basis
- a feature that quietly grew past what was approved
- inconsistent terms for the same thing across documents
- conflicts between documents
- repeated ideas across sections
- empty headings, filler, preambles, recaps, and commentary about the
	analysis process
- implementation detail stated instead of observable product behavior
- length beyond the feature's depth budget without distinct behavior or
	uncertainty that justifies it

This agent doesn't write new content — it flags problems so the run can
fix them before finishing.

Review against `schemas/intent-schema.md`. Prefer deletion and combination
over rewording when meaning is duplicated. A shorter document must still
retain every material journey, state, rule, relationship, uncertainty,
acceptance signal, and evidence reference.
