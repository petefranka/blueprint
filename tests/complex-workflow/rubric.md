# Rubric: Complex Workflow

A correct run should:
- [ ] Represent every distinct state named in the input as a state in the
      Workflow Analyst output and the intent's Journeys or Rules and States:
      Draft/In Progress, Under Review, Documents Requested, Expired,
      Approved, Offer Lapsed, Rejected, Withdrawn, Approved-and-accepted.
- [ ] Correctly represent Withdraw as available from every non-terminal
      state, not just from one point in the flow.
- [ ] Correctly represent the two distinct timeout/lapse mechanics
      (review-timeout → Expired, vs. accept-window timeout → Offer
      Lapsed) as separate transitions, not conflated into one "timeout"
      state.
- [ ] Every state should have at least one transition in and (unless
      truly terminal) one transition out — per the Workflow Analyst's
      definition of done.
- [ ] NOT invent what the "stated period," "stated window," or rejection
      reason categories actually are — these should be flagged as
      Unknown/Assumption/Decision as appropriate, not filled in with
      invented specifics (e.g. don't invent "14 days").
