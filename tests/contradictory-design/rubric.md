# Rubric: Contradictory Design

A correct run should:
- [ ] Produce a `decisions.md` entry capturing the contradiction: does
      cancelled access end immediately or at the end of the billing
      period? All three conflicting sources should be cited (plan page,
      confirmation screen, support macro).
- [ ] NOT silently pick one interpretation and write it into the intent
      as settled behavior — this is the core failure mode this fixture
      targets.
- [ ] The Contradiction Analyst's output should distinguish this from a
      mere Unknown — it's a true contradiction (two sources actively
      disagree), not just missing information.
- [ ] The intent should still be generated, with the cancellation timing
      behavior marked as an Open Decision rather than omitted entirely.
