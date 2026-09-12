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

1. **Discover and blueprint features.** Blueprint examines the available design
    material, including screenshots, notes, exports, and existing intent
    documents. It identifies distinct product features and writes them to
   `intent/BLUEPRINT.md`.
2. **Review and approve.** You decide whether the feature boundaries are
    right. You can merge, split, rename, remove, or add features. Blueprint
   stops until you approve the blueprint.
3. **Scope and analyze approved features.** Discovery proposes small,
   medium, or large depth and prepares evidence packets. After approval,
   unchanged features reuse that work; a lightweight scope assessor checks
   only changed or unverifiable features. Blueprint then performs focused
   analysis or fans out as needed.
4. **Review the result.** A critic subagent examines the completed intent set
    for missing requirements, contradictions, weak assumptions, and other
    quality problems. Blueprint also checks for technical language that does
    not belong in product intent documents.
5. **Record uncertainty.** Anything the evidence cannot settle becomes an
    open decision or an explicit unknown instead of an invented answer.

## The subagent workflow

Blueprint scales analysis to the feature rather than invoking every
specialist for every job. It uses these roles:

- **Feature Decomposer** identifies feature boundaries from the source
   material. Capabilities that only form a complete, independently useful
   outcome together become one feature and one eventual intent file.
- **Scope Assessor** checks only stale, changed, or unverifiable approved
   entries. In Claude Code it uses Haiku, read-only tools, and a four-turn
   budget; it does not rediscover the project.
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

| Depth | Feature analysis |
|---|---|
| Small | Main session covers all four perspectives in one focused pass. |
| Medium | Two parallel agents: product + requirements, and workflow + UX. |
| Large | Four parallel agents: product, UX, workflow, and requirements. |

Scope depends on journeys, states, permissions, recovery, dependencies,
and consequential uncertainty—not feature count alone. Missing evidence
never defaults to small. Features can take different routes in one run;
later findings escalate only the affected feature.

Invoked feature analysts work independently. Each receives its approved
entry, role instructions, and a self-contained feature evidence packet,
but not raw project sources or another analyst's notes. Discovery prepares
the packets and source hashes; continuation rebuilds only stale packets,
dispatches non-cached independent work in parallel, and writes returned
reports. Small features go directly to final intent synthesis. The
assessor only recommends routing; the main session owns dispatch and
synthesis.

The assessor, decomposer, and medium-depth feature analysts use Haiku.
Large feature analysis and the critic use Sonnet. Every agent has a
bounded turn and effort budget. These defaults can still be restricted by
the models available in your Claude Code organization.

The Dependency Analyst runs when evidence indicates or cannot rule out
shared behavior, ordering, prerequisites, or coupled outcomes. The
Contradiction Analyst runs when evidence indicates or cannot rule out
conflicts, overlap, or inconsistent terminology. Skipping either call does
not remove checks for external prerequisites or internal conflicts.
An independent critic, evidence tracking, uncertainty handling, technical
leakage checks, and the quality gate remain mandatory at every depth.

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

To install the Claude Code commands globally so they are available from any
project, run:

```bash
./install/install-global.sh
```

The global installer places commands and subagents in `~/.claude/` and keeps
their methodology and templates in `~/.claude/blueprint/`. It does not copy
files into individual projects. Blueprint still writes generated `intent/`
documents to the project you are working in.

## Use

Inside your project, in Claude Code:

```
/blueprint
```

Review and edit `intent/BLUEPRINT.md`, then:

```
/blueprint-continue
```

You can also just ask in plain language, such as "turn this design into
product intents" or "run Blueprint against this project," and it will do the
same thing.

## What you get back

All written to `intent/` in your project:

- `BLUEPRINT.md`: the approved list of features
- `intents/`: one file per feature
- `evidence.md`: where each requirement came from
- `decisions.md`: open questions Blueprint could not answer for you

The files are produced through the subagent workflow described above. The
main session owns the synthesis, while the specialist and critic subagents
provide independent analysis and review.

Intent files are deliberately compact and behavior-first. They combine
overlapping context, omit empty sections, cite evidence by ID, and avoid
technical implementation detail. Small, medium, and large intents target
350, 650, and 1,000 words respectively; completeness takes precedence when
a distinct journey, state, rule, relationship, or uncertainty needs space.

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
