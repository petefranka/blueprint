# Rubric: Simple Feature

A correct run should:
- [ ] Produce exactly one feature/intent (this is a single obvious
      capability — over-decomposing into e.g. "email validation" as a
      separate feature is a fail).
- [ ] Capture both the success path and the invalid-email path in
      Workflows/States.
- [ ] Not invent an unsubscribe flow, confirmation email, or any capability
      not shown or implied.
- [ ] Contain zero technical terms (no "form validation regex," no
      "POST request," etc.).
- [ ] Not require any `decisions.md` entry — there's no real ambiguity
      here. A run that manufactures a decision from this simple input is a
      fail (over-caution is still a defect).
