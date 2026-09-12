# Test fixtures

These aren't automated tests — Blueprint produces written analysis, not
code, so there's nothing to run and get a pass/fail from. Instead, each
folder has a sample input and a checklist for what a correct run should
and shouldn't produce.

To use one: feed `input.md` through Blueprint (`/blueprint`, then
`/blueprint-continue`), then check the result against `rubric.md`.

| Folder | What it checks |
|---|---|
| `simple-feature/` | One obvious feature — doesn't over-split it |
| `multi-feature/` | Several real features in one input |
| `shared-capability/` | Features that share something underneath |
| `ambiguous-design/` | Missing info becomes a question, not a guess |
| `technology-contaminated/` | Technical detail doesn't leak into the output |
| `contradictory-design/` | Conflicting info gets surfaced, not silently resolved |
| `complex-workflow/` | A feature with lots of states and failure paths |
