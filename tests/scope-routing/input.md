# Input: Scope Routing

This fixture tests routing after approval. Treat the following entries as
the human-approved set, in this order; do not run feature decomposition
or change the boundaries. The discovery summary below is the assessor's
input, not a substitute for full evidence during detailed analysis.

## Approved entries

- INT-001 — Newsletter signup: let a visitor subscribe with an email
  address and receive confirmation. Evidence: S1.
- INT-002 — Contact preferences: let a signed-in member view, change, and
  save email and SMS preferences. Evidence: S2.
- INT-003 — Loan application: let an applicant submit and track an
  application through review and a final outcome. Evidence: S3.

## Discovery summary

- **S1, Newsletter form:** one email field and Subscribe button. Valid
  submission shows confirmation; invalid email shows an inline error.
  One actor, no other journeys or permission distinctions in the supplied
  material. No indicated conflicts or consequential unknowns.
- **S2, Preferences screens:** view saved values, edit either preference,
  save, or cancel to restore saved values. Save success is confirmed;
  save failure preserves unsaved choices and allows retry or cancel.
  One member role; no approval or external dependency. All these paths
  are explicit and consistent; there are bounded alternative journeys.
- **S3, Loan flow:** multi-step application with save/resume; Under Review,
  Documents Requested, resubmission, Expired, Approved, Offer Lapsed,
  Rejected, and withdrawal before final outcome. Review expiry and offer
  acceptance windows are mentioned but their durations are unspecified.
  Multiple interacting transitions and consequential uncertainty.

## Variants (run separately)

1. Only INT-001 is approved, with S1 unchanged.
2. Only INT-002 is approved, with S2 unchanged.
3. Only INT-003 is approved, with S3 unchanged.
4. INT-001 is approved but no summary survives. Its only evidence note
   is a source path with no description of behavior.
5. INT-001 is approved. Add S4: a second newsletter note says invalid
   addresses are accepted without an error, contradicting S1.
6. INT-001 was assessed small, but detailed source inspection later
   reveals permission-dependent approval, identity verification, several
   recovery states, and contradictory activation rules.
7. Simulate an assessor failure or partial result for the mixed set:
   omit INT-002, duplicate INT-001, include an unknown INT-999, or use
   an invalid depth label. Also test entirely empty output.
8. The human approves a renamed INT-001, removes INT-002, and adds a new
   feature without evidence; the saved summary still describes the old
   set. Use the current approved IDs and entries, not the stale list.
9. The Blueprint is still proposed, not approved.