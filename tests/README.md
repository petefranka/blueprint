# Test fixtures

These aren't automated tests — Blueprint produces written analysis, not
code, so there's nothing to run and get a pass/fail from. Instead, each
folder has a sample input and a checklist for what a correct run should
and shouldn't produce.

To use one: run `/blueprint`, review each proposed EV, run
`/blueprint-signoff EV-###` (or test `/blueprint-reject EV-### <reason>`),
then run `/blueprint-continue` and check the result against `rubric.md`.

| Folder | What it checks |
|---|---|
| `simple-feature/` | One obvious feature — doesn't over-split it |
| `multi-feature/` | Several real features in one input |
| `shared-capability/` | Features that share something underneath |
| `ambiguous-design/` | Missing info becomes a question, not a guess |
| `technology-contaminated/` | Technical detail doesn't leak into the output |
| `contradictory-design/` | Conflicting info gets surfaced, not silently resolved |
| `complex-workflow/` | A feature with lots of states and failure paths |
| `scope-routing/` | Adaptive depth, mixed workloads, conservative fallback, and escalation |
| `signoff/` | Explicit approval/rejection without analysis or content changes |

The scope-routing fixture supplies an approved set and discovery summary
directly. Exercise its variants separately and inspect the agent calls as
well as the final documents; do not run decomposition for that fixture.
