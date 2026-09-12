---
description: "Reject one proposed or approved Blueprint EV intent without running analysis. Records the reason and preserves working evidence for revision."
argument-hint: "<EV folder path or EV ID> <reason, for example EV-001 boundary should be split>"
---

Reject exactly one Blueprint design outcome. This command records human
rejection; it does not analyze, revise, critique, delete, or finalize the
intent.

Argument: $ARGUMENTS

## Resolve the target and reason

The argument must contain:

1. An EV ID such as `EV-001`, or an explicit
   `intent/EV-###-<slug>` folder path.
2. A concise rejection reason after the target. After trimming whitespace,
   the reason must contain at least one non-whitespace character.

Resolve an EV ID to the single matching `intent/EV-001-*/INTENT.md`.
Reject a missing or malformed target, path outside `intent/`, no match,
multiple matches, or missing reason. Never guess either value.

## Validate

Read the target `INTENT.md` and confirm:

- its frontmatter `id` matches the folder's EV number;
- its status is `proposed` or `approved`;
- the frontmatter is valid and contains exactly one status field.

If validation fails, report the exact issue and leave the file unchanged.

## Reject

Make only these changes:

1. Change the frontmatter status to `status: rejected`.
2. Add or replace a frontmatter field containing the supplied reason:
   `rejection_reason: <reason>`.

Do not alter the intent body, run agents, invoke another command, or delete
`.work/`. Keeping `.work/` allows the proposal to be revised without losing
its evidence.

Report the rejected EV and tell the user to edit its `INTENT.md`. After
revision, they can run `/blueprint-signoff <EV-ID>`; sign-off accepts a
revised rejected intent as described in that command.