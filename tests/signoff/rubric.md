# Sign-off and Rejection — Acceptance Checklist

- Sign-off resolves exactly one EV and changes only its status from
  `proposed` to `approved`.
- Sign-off validates the EV ID, required sections, placeholders, Sources,
  and temporary evidence/state before changing the file.
- Sign-off runs no analysts, does not invoke continuation, and preserves
  `.work/`.
- Rejection requires a nonempty reason after whitespace is trimmed.
- Rejection accepts only `proposed` or `approved`, sets `status: rejected`,
  and adds or replaces `rejection_reason` in frontmatter.
- Rejection leaves the intent body and `.work/` unchanged and runs no
  analysts or other commands.
- A revised rejected intent can be signed off; sign-off then removes
  `rejection_reason` and sets `status: approved`.
- Missing, malformed, unmatched, ambiguous, or outside-`intent/` targets
  leave all files unchanged and report the exact problem.
- `/blueprint-continue` ignores proposed, rejected, and reviewed EVs unless
  explicitly asked to rerun reviewed work.