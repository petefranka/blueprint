# Claude Code adapter

This adapter maps Blueprint's EV workflow onto Claude Code.

| Blueprint concept | Claude Code piece |
|---|---|
| Discover and propose | `/blueprint` |
| Human approval | `/blueprint-signoff <EV-ID>` |
| Human rejection | `/blueprint-reject <EV-ID> <reason>` |
| Analyze and finalize | `/blueprint-continue` |
| Specialist roles | Nine subagents in `.claude/agents/` |
| Final deliverable | One `intent/EV-###-<slug>/INTENT.md` per outcome |

## Command flow

`/blueprint` discovers design material, runs the Haiku decomposer, and
creates one EV folder per coherent outcome. Each starts with a proposed
`INTENT.md` plus temporary `.work/EVIDENCE.md` and `.work/STATE.json`. It
then stops without running feature analysts.

`/blueprint-signoff <EV-ID>` validates one proposed or revised rejected
intent, sets it to `approved`, removes any previous `rejection_reason`, and
stops. It runs no analysts and preserves `.work/`.

`/blueprint-reject <EV-ID> <reason>` sets one proposed or approved intent to
`rejected`, records the reason, preserves its body and `.work/`, and stops.
The same EV can be edited and signed off later.

`/blueprint-continue` selects approved EVs, routes each independently,
finalizes the same `INTENT.md`, and runs the critic and quality checks. It
sets `status: reviewed` and deletes `.work/` only after success.

## Fan-out

- Small: direct main-session synthesis.
- Medium: two parallel Haiku calls.
- Large: four independent parallel Sonnet calls.
- Dependency and contradiction calls run only when evidence signals or
  cannot rule out their concerns.

The main session owns routing, synthesis, writes, and cleanup. Subagents
receive bounded evidence and return reports; they do not write files or
search the project.

## Project output

During work:

```text
intent/EV-001-order-cancellation/
├── INTENT.md
└── .work/
    ├── EVIDENCE.md
    └── STATE.json
```

After successful continuation:

```text
intent/EV-001-order-cancellation/
└── INTENT.md
```

Failed or interrupted runs retain `.work/` for resume. Another platform
adapter must preserve proposal, sign-off, rejection, finalization, routing,
validation, and cleanup semantics.
