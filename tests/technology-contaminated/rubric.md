# Rubric: Technology-Contaminated Input

A correct run should:
- [ ] Produce a requirement like "the product retains the user's uploaded
      profile picture so it can be displayed wherever their profile
      appears" — NOT "the product must store the image in S3" or
      "must add an avatar_url column."
- [ ] Not mention S3, Lambda, Postgres, or `avatar_url` anywhere in the
      final intent files.
- [ ] The tech-leakage validator's Pass 2 judgment should correctly
      classify this as leakage (b), not legitimate context (a) — since
      the engineering note is prescribing an implementation, not
      explaining a product constraint.
- [ ] Still capture the actual product behavior evident from the note
      (preview before confirm, thumbnail-appropriate display implied by
      "resized thumbnail") without carrying over the technical means.
- [ ] A failure mode to check for: the validator rejecting the whole
      requirement instead of rewriting it — the point is rewrite, not
      delete.
