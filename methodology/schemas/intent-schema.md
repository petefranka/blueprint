# Intent format (`intent/EV-###-<slug>/INTENT.md`)

```markdown
---
id: EV-001
name: <Design outcome name>
version: 1
status: proposed | approved | reviewed
depth: small | medium | large
last_updated: <date>
---

# EV-001: <Name>

## Outcome
<Who needs what outcome, and why. One short paragraph.>

## Behaviour
- <Observable product behaviour.> [E-001]

## Journeys
1. <Shortest complete primary path.> [E-001]
- **Alternative or failure:** <Only when materially different.> [E-002]

## Rules and States
- <Business rule, state, transition, or constraint.> [E-003]

## Experience
<Feedback, clarity, accessibility, or recovery intent that changes the
user experience.>

## Relationships
- <Dependency or shared capability and affected EV.> [E-004]

## Uncertainty
- **Assumption:** <Minor default and basis.> [E-005]
- **Decision:** <Consequential unresolved question.> [E-006]
- **Unknown:** <Low-impact fact the evidence cannot establish.> [E-007]
- **Out of scope:** <Relevant boundary clarification.>

## Acceptance
- <Observable signal that proves the intended outcome.>

## Sources
- **E-001** — `<path>`: <concise supporting observation>.
```

## Writing contract

- Required: Outcome, Behaviour, Journeys, Rules and States, Experience,
  Acceptance, and Sources.
- Optional: Relationships and Uncertainty. Omit empty optional sections;
  never write filler such as "None identified."
- State each idea once using short declarative sentences. Include only
  behavior, paths, states, rules, and exceptions that affect the outcome.
- Describe what users can do, see, understand, or recover from. Exclude
  architecture, storage, APIs, classes, components, frameworks, event
  handling, and proposed implementation.
- Cite meaningful claims inline with E-### IDs. Define each cited ID once
  under Sources with the original path and concise observation.
- Keep decisions, assumptions, unknowns, and boundaries under Uncertainty.
- Write directly without a preamble, recap, analysis narration, or
  screen-by-screen retelling.

## Length budget

- Small: up to 350 words.
- Medium: up to 650 words.
- Large: up to 1,000 words.

Exceed a target only when removing text would lose a distinct journey,
state, rule, relationship, uncertainty, acceptance signal, or source.