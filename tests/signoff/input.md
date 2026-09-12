# Input: Sign-off and rejection

Use a proposed folder named `intent/EV-001-daily-carbon-attribution/` with:

- a valid `INTENT.md` containing `id: EV-001`, `status: proposed`, all
  required sections, visible uncertainty, and at least one source;
- `.work/EVIDENCE.md`;
- `.work/STATE.json`.

Test these commands separately:

1. `/blueprint-signoff EV-001`
2. `/blueprint-reject EV-001 attribution boundary needs revision`
3. Edit the rejected intent, then `/blueprint-signoff EV-001`
4. Missing target, ambiguous target, missing reason, invalid status, and a
   path outside `intent/`.