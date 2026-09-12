# Blueprint

Blueprint reads your product designs, screenshots, notes, and user flows,
and turns them into plain descriptions of what the product should do —
not how to build it.

It answers: what are we building, why, who's it for, and how should it
behave. It never decides the tech stack, database, or architecture. That's
a separate job, for a separate agent, later.

## How it works

1. You point Blueprint at your project. It looks at whatever design
   material is there — screenshots, notes, exports, anything.
2. Blueprint splits the product into distinct features and writes them to
   a list.
3. You review that list. Approve it, or edit it — merge things, split
   things, rename, remove, add. Blueprint waits for you here.
4. Once approved, Blueprint studies each feature in detail and writes one
   document per feature: what it's for, who uses it, how it should
   behave, and what happens when things go wrong.
5. Anything unclear becomes a written question, not a guess.

## What it doesn't do

- Doesn't choose a framework, language, database, or hosting setup.
- Doesn't guess at unclear product decisions — it writes them down as
  open questions instead.
- Doesn't redraw feature boundaries without you approving it first.

## Install

```bash
./install/install.sh /path/to/your-project
```

This copies Blueprint's commands and agents into that project's `.claude/`
folder.

## Use

Inside your project, in Claude Code:

```
/blueprint
```

Review and edit `intent/feature-map.md`, then:

```
/blueprint-continue
```

You can also just ask in plain language — "turn this design into product
intents," "run Blueprint against this project" — and it'll do the same
thing.

## What you get back

All written to `intent/` in your project:

- `feature-map.md` — the approved list of features
- `intents/` — one file per feature
- `evidence.md` — where each requirement came from
- `decisions.md` — open questions Blueprint couldn't answer for you

## The eight sub-agents

Blueprint splits the analysis across small specialists instead of one
agent trying to do everything at once:

- **Feature Decomposer** — splits the product into features
- **Product Analyst** — why a feature exists, who it's for
- **UX Analyst** — how it should feel to use
- **Workflow Analyst** — the steps, states, and failure/recovery paths
- **Requirements Analyst** — turns all of that into clear statements
- **Dependency Analyst** — what depends on what, across features
- **Contradiction Analyst** — flags conflicting information (never
  resolves it — that's a human call)
- **Intent Critic** — reviews the finished result for gaps or mistakes

## Customizing

Everything Blueprint does is defined in `methodology/`. Edit the files
there — role definitions, the document format, the quality checklist —
and the rest of the repo picks it up automatically.

## Using it on another platform

`methodology/` has nothing Claude-specific in it. To use Blueprint on
another agent platform, write a new adapter folder for that platform (see
`adapters/claude-code/` as the example) and leave `methodology/` untouched.

## Example

See `examples/example-project/` for a complete run: sample design notes,
the approved feature list, the finished feature documents, and an open
question Blueprint correctly left unanswered.

## Tests

`tests/` has small sample inputs, each with a checklist of what a correct
run should and shouldn't produce — including tricky cases like missing
information, conflicting information, and technical detail that
shouldn't leak into the output.
