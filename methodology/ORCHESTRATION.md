# How Blueprint works

Blueprint produces one visible intent file for each coherent design outcome.

```text
/blueprint
  -> discover design sources
  -> create intent/EV-###-short-name/INTENT.md
  -> stop for human approval

/blueprint-signoff EV-###
  -> validate one proposed intent
  -> set status: approved
  -> stop without analysis

/blueprint-reject EV-### <reason>
  -> record why the proposal is not approved
  -> set status: rejected
  -> preserve .work/ for revision

/blueprint-continue
  -> analyze each approved EV at the required depth
  -> finalize the same INTENT.md
  -> validate it
  -> delete temporary .work/
```

## Design outcome boundary

An EV folder represents one outcome that can be delivered and accepted as
a unit. Keep capabilities together when neither is complete or valuable
alone. Split unrelated, independently valuable outcomes into separate EV
folders even when they share a screen, source document, release, data, or
implementation.

Folder names use the next unused three-digit number and a short lowercase
ASCII slug: `EV-001-order-cancellation`. EV numbers are never reused.

## Discovery and approval

Discovery reads the available screenshots, notes, exports, flows, and prior
EV folders. It creates one folder per outcome:

```text
intent/EV-001-short-name/
├── INTENT.md
└── .work/
    ├── EVIDENCE.md
    └── STATE.json
```

`INTENT.md` starts with `status: proposed`. It contains the concise outcome,
scope, preliminary depth, uncertainty, and source references. `.work/`
contains detailed evidence, source hashes, routing state, and temporary
analysis. Stop until the human edits the proposal and runs
`/blueprint-signoff <EV-ID>`. Sign-off validates the proposal, changes only
its status to `approved`, and runs no analysts.

Use `/blueprint-reject <EV-ID> <reason>` when the boundary or proposal is
not acceptable. Rejection records the reason in frontmatter, changes the
status to `rejected`, preserves `.work/`, and runs no analysts. Edit the
same intent and sign it off when the concern is resolved.

## Analysis depth

The Scope Assessor checks approved EVs whose proposal, evidence, or source
hashes changed. It recommends depth but does not change boundaries or launch
agents.

- **Small:** main session synthesizes the final intent directly.
- **Medium:** product + requirements and workflow + UX run as two parallel
  Haiku calls.
- **Large:** product, requirements, workflow, and UX run as four independent
  parallel Sonnet calls.

Missing evidence cannot justify Small. A complex single outcome can be
Large. If later analysis reveals complexity, escalate only that EV.

Run dependency analysis when evidence indicates or cannot rule out sharing,
ordering, prerequisites, or coupled outcomes across approved EVs. Run
contradiction analysis when evidence indicates or cannot rule out conflicts,
overlap, or inconsistent terminology. Dispatch independent calls in one
parallel batch.

Each analyst receives only the approved proposal, its evidence packet, and
its role instructions. Analysts return concise reports and do not write
files or search the project.

## Finalization

Rewrite the approved proposal in place as the final `INTENT.md`. It contains
all human-facing information:

- observable behavior and journeys;
- rules, states, and experience intent;
- relationships to other EVs;
- assumptions, decisions, unknowns, and boundaries;
- acceptance signals;
- compact source references with stable E-### IDs.

Do not create separate blueprint, evidence, decisions, manifest, or feature
intent files. Run the Intent Critic, technology-leakage check, and quality
gate. Set `status: reviewed` only after all checks pass.

After success, delete the EV's `.work/` directory. If the run fails or is
interrupted, retain `.work/` for continuation. A later rerun of a cleaned EV
re-reads its listed sources because no cache remains.

## Reasoning rules

Keep these claims distinct:

- **Observation:** directly shown by a source.
- **Intent:** product behavior supported by observations.
- **Inference:** strongly implied but not directly shown.
- **Assumption:** a reasonable minor default that is not confirmed.
- **Unknown:** a low-impact fact the evidence cannot establish.

A consequential unresolved behavior is a **Decision**. Material outside the
approved outcome is **Out of scope**. Never convert uncertainty into fact or
resolve a decision without human evidence.

On a rerun, preserve prior decisions and describe behavior changes. Bump the
intent version; do not silently overwrite history represented in the file.