---
description: "Approve one proposed Blueprint EV intent after human review, without running analysis. Required checkpoint between /blueprint and /blueprint-continue."
argument-hint: "<EV folder path or EV ID, for example EV-001 or intent/EV-001-daily-carbon-attribution>"
---

Approve exactly one proposed Blueprint design outcome. This command records
human sign-off; it does not analyze, expand, critique, or finalize the intent.

Argument: $ARGUMENTS

## Resolve the target

The argument is required. Accept either:

- an EV ID such as `EV-001`, resolved to the single matching
  `intent/EV-001-*/INTENT.md`; or
- an explicit `intent/EV-###-<slug>` folder path.

Reject a missing argument, malformed EV ID, path outside `intent/`, no
match, or multiple matches. Never guess which intent the user means.

## Validate

Read the target `INTENT.md` and confirm:

- its frontmatter `id` matches the folder's EV number;
- its status is `proposed` or `rejected`;
- Outcome identifies a coherent, independently deliverable design outcome;
- required sections from `methodology/schemas/intent-schema.md` are present;
- no template placeholders remain;
- Sources contains at least one source reference;
- decisions, assumptions, unknowns, and boundaries are visible under
  Uncertainty when present; unresolved decisions do not block approval;
- `.work/EVIDENCE.md` and `.work/STATE.json` exist so continuation can run.

If validation fails, report the exact issue and leave the file unchanged.
Do not repair content or create missing working files in this command.

## Sign off

Change only the frontmatter status to `status: approved`. If the prior
status was `rejected`, remove the `rejection_reason` frontmatter field.
Do not alter the intent body, run agents, invoke `/blueprint-continue`, or
delete `.work/`.

Report the approved EV and the exact next command:

`/blueprint-continue`