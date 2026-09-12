# Claude Code adapter

This is how Blueprint's methodology connects to Claude Code.

| Blueprint concept | Claude Code piece |
|---|---|
| The two-step approval flow | `/blueprint` and `/blueprint-continue`, in `.claude/commands/` |
| The nine roles | Subagents in `.claude/agents/`; discovery proposes depth, then stale entries use the scope assessor before specialist calls |
| Cheap scope assessment | `scope-assessor` uses Haiku, low effort, read-only tools, and four turns; unchanged entries skip it |
| Bounded analysis | Decomposition and medium analysis use Haiku; large analysis and critique use Sonnet. Analyst turns and effort are bounded. |
| Independent analysis | Main reads sources once into feature/cross-feature evidence packets; agents return reports without searching, writing, or seeing another analyst's notes |
| Combining everyone's notes into final documents | Done in the main session, not a subagent, since that's the only place with visibility across all of them |

## What `/blueprint` does

1. Look through the project for design material.
2. Run the feature-decomposer agent over it.
3. Write `intent/blueprint.md`.
   Save preliminary depth, evidence packets, exact entry snapshots, and
   source hashes under `intent/.work/` for safe reuse after approval.
4. Stop, and tell the user to review it before running `/blueprint-continue`.

## What `/blueprint-continue` does

1. Check `intent/blueprint.md` is actually approved. If not, stop.
2. Verify approved entries and source hashes. Reuse unchanged depths and
   packets; rebuild and assess only stale entries. Missing or invalid
   assessments default to at least medium, never small. Dispatch all
   non-cached independent calls together.
    - Small: direct final-intent synthesis in the main session.
    - Medium: product + requirements and workflow + UX in two parallel
       Haiku calls.
    - Large: all four feature specialists independently in parallel on
       Sonnet.
   Run dependency and contradiction analysis only when the evidence
   signals, or cannot rule out, the concern each role owns.
   Escalate affected features only when later findings require more depth.
3. Save returned reports, then combine them into one document per feature,
   plus
   `intent-manifest.md`, `evidence.md`, and `decisions.md`.
   Intents use the compact behavior-first schema, inline evidence IDs, no
   empty optional sections, and depth-based word targets.
4. Run intent-critic over the finished set, and check for technical
   language that snuck in.
5. Go through the final checklist. Fix anything missing.
   The critic and checks run at every depth.
6. Report back: chosen depths and escalations, how many documents were
   written, and how many open
   questions are waiting in `decisions.md`.

## Where things end up in your project

```
your-project/
├── .claude/
│   ├── commands/     (blueprint.md, blueprint-continue.md)
│   └── agents/       (the 9 subagents)
└── intent/
   ├── blueprint.md
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
platform, write a new adapter folder that connects: the two-step approval
flow onto that platform's pause/resume mechanism, and the nine roles onto
whatever sub-agent or persona mechanism it has. Leave `methodology/` and
`templates/` as they are.
