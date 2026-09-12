# Claude Code adapter

This is how Blueprint's methodology maps onto Claude Code.

| Blueprint concept | Claude Code piece |
|---|---|
| The two-step approval flow | `/blueprint` and `/blueprint-continue`, in `.claude/commands/` |
| The eight specialist roles | Subagents in `.claude/agents/`, run one at a time via the Task tool |
| "Each analyst sees the feature + evidence, but not each other's notes" | Each subagent gets its own isolated context — it genuinely can't see another analyst's output, even if it wanted to |
| Combining everyone's notes into final documents | Done in the main session, not a subagent, since that's the only place with visibility across all of them |

## What `/blueprint` does

1. Look through the project for design material.
2. Run the feature-decomposer agent over it.
3. Write `intent/roadmap.md`.
4. Stop, and tell the user to review it before running `/blueprint-continue`.

## What `/blueprint-continue` does

1. Check `intent/roadmap.md` is actually approved. If not, stop.
2. Run product-analyst, ux-analyst, workflow-analyst, and
   requirements-analyst once per approved feature. Run dependency-analyst
   and contradiction-analyst once, across all approved features together.
3. Combine all of that into one document per feature, plus
   `intent-manifest.md`, `evidence.md`, and `decisions.md`.
4. Run intent-critic over the finished set, and check for technical
   language that snuck in.
5. Go through the final checklist. Fix anything missing.
6. Report back: how many documents were written, and how many open
   questions are waiting in `decisions.md`.

## Where things end up in your project

```
your-project/
├── .claude/
│   ├── commands/     (blueprint.md, blueprint-continue.md)
│   └── agents/       (the 8 subagents)
└── intent/
   ├── roadmap.md
    ├── intent-manifest.md
    ├── evidence.md
    ├── decisions.md
    └── intents/       (one file per feature)
```

## Using natural language instead of the slash commands

Because the commands are plain files with a description in them, things
like "turn this design into product intents" or "run Blueprint against
this project" get routed to the same commands automatically — no extra
setup needed.

## Porting to another platform

`methodology/` has nothing Claude-specific in it. To support another
platform, write a new adapter folder that maps: the two-step approval
flow onto that platform's pause/resume mechanism, and the eight roles onto
whatever sub-agent or persona mechanism it has. Leave `methodology/` and
`templates/` as they are.
