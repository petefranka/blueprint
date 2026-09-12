# Final check before finishing a run

Go through this list against the whole set of feature documents. If
anything is a "no," fix it before calling the run done.

- Every meaningful feature from the approved list has a document.
- Feature boundaries still make sense (nothing is secretly two features
  crammed together, or a fragment of a bigger one).
- User goals are clear in every document.
- Important paths are covered, including alternative and failure paths.
- Important states are covered, including failure/interrupted ones.
- Business rules are captured where they were evident.
- Assumptions are clearly marked as assumptions, not stated as fact.
- Unknowns are clearly marked, not silently left out.
- Unresolved questions are in `decisions.md`, not invented.
- Dependencies between features are noted.
- The same requirement isn't repeated differently across documents.
- No technology, framework, database, or API is named anywhere.
- Each document makes sense on its own, without needing anyone to
  explain the design verbally.
