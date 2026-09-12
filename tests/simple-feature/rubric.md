# Rubric: Simple Feature

A correct run should:
- [ ] Produce exactly one feature/intent (this is a single obvious
      capability — over-decomposing into e.g. "email validation" as a
      separate feature is a fail).
- [ ] Keep entry, validation, submission, and confirmation together as
      one coherent delivery and therefore one intent file.
- [ ] Capture both the success path and the invalid-email path in
      Journeys and Rules and States without repeating either path.
- [ ] Not invent an unsubscribe flow, confirmation email, or any capability
      not shown or implied.
- [ ] Contain zero technical terms (no "form validation regex," no
      "POST request," etc.).
- [ ] Not require any `decisions.md` entry — there's no real ambiguity
      here. A run that manufactures a decision from this simple input is a
      fail (over-caution is still a defect).
- [ ] Use the compact schema, cite evidence inline, omit empty optional
      sections, and remain within the 350-word Small target.
