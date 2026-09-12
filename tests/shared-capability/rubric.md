# Rubric: Shared Capability

A correct run should:
- [ ] Produce three distinct features (Product Reviews, Seller Ratings,
      Support Ticket Resolution Feedback) — the underlying similarity does
      not mean they should be merged into one feature; they serve
      different users/goals/contexts.
- [ ] The Dependency Analyst should explicitly identify "rating + written
      comment" as a shared capability across all three, in
      intent-manifest.md and in each intent's Shared Capabilities section.
- [ ] Should NOT describe the shared capability in technical terms (e.g.
      "shared Rating table/model") — describe it as a product concept.
- [ ] Should NOT silently duplicate near-identical requirement text
      across all three intents without noting the shared capability link
      — that's the specific failure mode this fixture targets.
