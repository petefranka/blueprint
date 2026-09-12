# Feature document format (intent/intents/INT-XXX-*.md)

```markdown
---
id: INT-XXX
name: <Feature name>
version: 1
status: draft | reviewed
last_updated: <date>
---

# INT-XXX: <Name>

## Outcome
<Who needs what outcome, and why. One short paragraph.>

## Behaviour
- <Observable product behaviour.> [E-XXX]

## Journeys
1. <Shortest complete primary path.> [E-XXX]
- **Alternative or failure:** <Only when materially different.> [E-XXX]

## Rules and States
- <Business rule, state, transition, or constraint.> [E-XXX]

## Experience
<Only feedback, clarity, accessibility, or recovery intent that changes
the user experience. One short paragraph or concise bullets.>

## Relationships
- <Dependency or shared capability and affected intent.> [E-XXX]

## Uncertainty
- **Assumption:** <Minor default and basis.> [E-XXX]
- **Decision:** DEC-XXX — <Consequential unresolved question.>
- **Out of scope:** <Relevant boundary clarification.>

## Acceptance
- <Observable signal that proves the intended outcome.>
```

## Writing contract

Write for a product reader deciding what the feature must do. Be direct,
specific, and concise.

- Required sections: Outcome, Behaviour, Journeys, Rules and States,
  Experience, and Acceptance.
- Optional sections: Relationships and Uncertainty. Omit either heading
  when it has no content. Never write filler such as "None identified."
- Combine purpose, problem, users, desired outcome, and goals in Outcome.
  State each fact once in the section where it is most useful.
- Use short declarative sentences and one requirement per bullet. Start
  with the actor or product behavior, not background commentary.
- Describe what users can do, see, understand, or recover from. Exclude
  architecture, storage, APIs, classes, components, frameworks, event
  handling, and proposed implementation.
- Include only paths, states, rules, and exceptions that materially alter
  behavior. Fold a trivial state into its journey instead of repeating it.
- Cite meaningful claims inline with evidence IDs such as `[E-003]`.
  `evidence.md` holds source details; do not repeat evidence prose or add
  a standalone Evidence section.
- Put unresolved consequential behavior in Decisions and minor defaults
  in Assumptions. Do not narrate the classification process.
- Make the document understandable without the original design, but do
  not restate the design screen by screen.

## Length budget

Use the shortest complete document. These are targets, not permission to
omit material behavior:

- Small: up to 350 words.
- Medium: up to 650 words.
- Large: up to 1,000 words.

Exceed a target only when removing text would lose a distinct journey,
state, rule, dependency, uncertainty, or acceptance signal. Never add
detail merely to approach the limit.
