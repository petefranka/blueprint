# Blueprint

Blueprint reads product designs, screenshots, notes, and user flows, then
turns them into plain descriptions of what the product should do, not how to
build it.

It answers four product questions: what are we building, why does it exist,
who is it for, and how should it behave? It does not choose a framework,
language, database, hosting setup, or architecture. Those are separate
engineering decisions for a later stage.

## How it works

Blueprint uses three explicit commands:

1. **`/blueprint` — discover and propose.** Blueprint examines screenshots,
   notes, exports, and flows. It creates one proposed
   `intent/EV-###-short-name/INTENT.md` for each coherent design outcome and
   then stops. Temporary evidence and routing state live under that EV's
   `.work/` directory.
2. **`/blueprint-signoff <EV-ID>` — approve.** You review and edit one
   proposed intent, including its Uncertainty section. Sign-off validates
   it and changes only `status: proposed` to `status: approved`. It runs no
   analysts.
   If the proposal is not acceptable, run
   `/blueprint-reject <EV-ID> <reason>` instead. Rejection records the reason,
   preserves `.work/`, and runs no analysts; edit the same intent and sign
   it off later.
3. **`/blueprint-continue` — analyze and finalize.** Blueprint routes every
   approved EV through Small, Medium, or Large analysis, runs the critic and
   quality checks, updates the same `INTENT.md`, and deletes `.work/` after
   success.

The final output is deliberately simple: one EV folder containing one
visible `INTENT.md`. Evidence references, assumptions, open decisions,
unknowns, boundaries, dependencies, and shared capabilities all live in
that file.

## The subagent workflow

Blueprint scales analysis to each EV instead of invoking every specialist
for every job. It uses these roles:

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

| Depth | Analysis fan-out |
|---|---|
| Small | Main session writes the final intent directly; no feature analyst. |
| Medium | Two parallel agents: product + requirements, and workflow + UX. |
| Large | Four parallel agents: product, UX, workflow, and requirements. |

### Scope and fan-out

The Scope Assessor is the routing gate for work that changed after
discovery. It does not analyze the feature or launch agents itself. It
returns a depth recommendation and dependency/contradiction signals; the
main Blueprint session validates that result and performs the fan-out.

```text
Discovery creates EV folder
   -> proposed INTENT.md + temporary .work/
   -> /blueprint-signoff EV-### (no analysts)
   -> unchanged? reuse proposed depth
   -> changed or unverifiable? Scope Assessor (Haiku)
   -> main session fans out by feature depth
          Small  -> direct intent synthesis (0 feature-agent calls)
          Medium -> 2 parallel Haiku calls
          Large  -> 4 parallel Sonnet calls
   -> dependency/contradiction agents only when signalled
   -> Intent Critic (Sonnet)
   -> quality gate
```

The routing decision is made independently for every feature, so one
large feature does not force unrelated small features through the full
fan-out. All required feature and cross-feature calls are launched in one
parallel batch. If analysis reveals more complexity, Blueprint escalates
only the affected feature and invalidates any shallower cached result.

For a Small EV, continuation normally invokes only the Intent Critic. The
Scope Assessor adds one inexpensive Haiku call when the proposal, evidence,
or source hashes changed after discovery.

Scope depends on journeys, states, permissions, recovery, dependencies,
and consequential uncertainty—not feature count alone. Missing evidence
never defaults to small. Features can take different routes in one run;
later findings escalate only the affected feature.

Invoked analysts work independently. Each receives its approved intent,
role instructions, and a self-contained evidence packet,
but not raw project sources or another analyst's notes. Discovery prepares
the packets and source hashes; continuation rebuilds only stale packets,
dispatches independent work in parallel, and writes returned reports to
temporary `.work/`. Small EVs go directly to final intent synthesis. The
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

After successful validation, Blueprint sets `status: reviewed` and removes
the EV's `.work/` directory. Failed or interrupted runs retain `.work/` so
they can resume. Original design sources are never removed.

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

### Uninstall Blueprint

Remove Blueprint from one project:

```bash
./install/uninstall-agent.sh /path/to/your/project
```

Remove the global installation:

```bash
./install/uninstall-agent.sh --global
```

The script removes Blueprint's commands, all Blueprint agents, and its
installed methodology and templates. It removes only paths represented by
this Blueprint source tree, refuses to target the source repository, and
always leaves generated `intent/` files untouched. Start a new Claude Code
session after removal.

## Use

Inside your project, in Claude Code:

```
/blueprint
```

Review a proposed EV intent, then sign it off:

```
/blueprint-signoff EV-001
```

Or reject it with a reason:

```
/blueprint-reject EV-001 boundary should be split into two outcomes
```

Rejection changes the status to `rejected`, records `rejection_reason` in
frontmatter, preserves temporary evidence, and runs no analysts. Revise the
same `INTENT.md`, then run `/blueprint-signoff EV-001` when it is ready.

Repeat sign-off for each EV you want to finalize, then run:

```
/blueprint-continue
```

You can also just ask in plain language, such as "turn this design into
product intents" or "run Blueprint against this project," and it will do the
same thing.

## What you get back

All final output is written under `intent/`:

```text
intent/
├── EV-001-order-cancellation/
│   └── INTENT.md
└── EV-002-order-history/
   └── INTENT.md
```

During discovery and analysis, each EV temporarily also contains
`.work/EVIDENCE.md` and `.work/STATE.json`, plus any analyst reports.
Blueprint deletes `.work/` only after successful validation.

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
