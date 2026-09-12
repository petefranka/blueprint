# Blueprint

Blueprint reads product designs, screenshots, notes, and user flows, then
turns them into plain descriptions of what the product should do, not how to
build it.

It answers four product questions: what are we building, why does it exist,
who is it for, and how should it behave? It does not choose a framework,
language, database, hosting setup, or architecture. Those are separate
engineering decisions for a later stage.

## How it works

Blueprint uses a two-step workflow with a required human review in the
middle.

1. **Discover and map features.** Blueprint examines the available design
    material, including screenshots, notes, exports, and existing intent
    documents. It identifies distinct product features and writes them to
    `intent/feature-map.md`.
2. **Review and approve.** You decide whether the feature boundaries are
    right. You can merge, split, rename, remove, or add features. Blueprint
    stops until you approve the map.
3. **Analyze approved features.** Blueprint starts a group of specialist
    subagents to study each approved feature from different perspectives.
    Their findings are combined into one intent document per feature.
4. **Review the result.** A critic subagent examines the completed intent set
    for missing requirements, contradictions, weak assumptions, and other
    quality problems. Blueprint also checks for technical language that does
    not belong in product intent documents.
5. **Record uncertainty.** Anything the evidence cannot settle becomes an
    open decision or an explicit unknown instead of an invented answer.

## The subagent workflow

Blueprint does not ask one general-purpose agent to make every judgment. It
spins up focused subagents for the parts of the analysis that benefit from
independent review:

- **Feature Decomposer** identifies feature boundaries from the source
   material.
- **Product Analyst** explains why each feature exists, who it serves, and
   what outcome it should produce.
- **UX Analyst** examines the user experience, interaction feedback, and
   accessibility implications.
- **Workflow Analyst** traces the main journey, alternative paths, states,
   failures, and recovery.
- **Requirements Analyst** turns the evidence into clear product
   requirements, assumptions, and unknowns.
- **Dependency Analyst** looks across all features for shared capabilities
   and dependencies.
- **Contradiction Analyst** looks across all features for conflicting
   evidence. It flags conflicts but never resolves them on the user's behalf.
- **Intent Critic** reviews the finished intent set for gaps, unsupported
   assumptions, inconsistent terminology, and missed edge cases.

The feature analysts work independently. Each receives the relevant feature
and the full evidence pool, but not the notes produced by the other analysts.
This keeps the perspectives genuinely independent instead of encouraging one
subagent to echo another.

The cross-feature analysts run once across the complete approved feature set.
Afterward, the main Blueprint session synthesizes the findings because it is
the one place that can see every analysis at the same time. The critic then
reviews that synthesized result before Blueprint reports completion.

## What it does not do

- It does not choose a framework, language, database, hosting setup, or
   architecture.
- It does not guess at unclear product decisions. It records them as open
   questions or unknowns.
- It does not redraw feature boundaries after approval.
- It does not let a critic silently make unresolved product decisions. Those
   decisions remain visible for a human to settle.

## Install

```bash
./install/install.sh /path/to/your-project
```

This copies Blueprint's commands and subagent definitions into that
project's `.claude/` folder.

## Use

Inside your project, in Claude Code:

```
/blueprint
```

Review and edit `intent/feature-map.md`, then:

```
/blueprint-continue
```

You can also just ask in plain language, such as "turn this design into
product intents" or "run Blueprint against this project," and it will do the
same thing.

## What you get back

All written to `intent/` in your project:

- `feature-map.md`: the approved list of features
- `intents/`: one file per feature
- `evidence.md`: where each requirement came from
- `decisions.md`: open questions Blueprint could not answer for you

The files are produced through the subagent workflow described above. The
main session owns the synthesis, while the specialist and critic subagents
provide independent analysis and review.

## Customizing

Everything Blueprint does is defined in `methodology/`. Edit the files
there, including role definitions, document formats, and quality checklists,
and the rest of the repo picks them up automatically.

## Using it on another platform

`methodology/` has nothing Claude-specific in it. To use Blueprint on another
agent platform, write a new adapter folder for that platform. See
`adapters/claude-code/` for an example, then leave `methodology/` untouched.

## Example

See `examples/example-project/` for a complete run: sample design notes, the
approved feature list, the finished feature documents, and an open question
Blueprint correctly left unanswered.

## Tests

`tests/` has small sample inputs, each with a checklist of what a correct run
should and should not produce. The fixtures cover missing information,
conflicting information, shared capabilities, complex workflows, and
technical detail that should not leak into the output.
