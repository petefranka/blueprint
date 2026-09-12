# Checking for technical leakage

Goal: catch technical detail that's crept into a feature document, without
rejecting every technical word on sight — some genuinely belong as
context.

## Two passes

**Pass 1 — flag candidates.** Scan for terms like: React, Vue, Next.js,
Rails, Node, Python, PostgreSQL, MongoDB, AWS, Azure, GCP, REST, GraphQL,
API, database table, server, cloud, microservice, class, queue. Just flag
the lines — don't judge them yet.

**Pass 2 — judge each one.**

Ask: if this technology were swapped for something completely different
tomorrow, would the sentence still need to be true?

- **Yes** → it's product intent. Keep it, rewritten in plain terms if
  needed.
- **No** → it's implementation detail. Rewrite it as behavior, or drop it.

Example — bad:
> The product must store orders in PostgreSQL.

Rewritten — good:
> The product must keep a record of the user's past orders so they can be
> reviewed later.

If a technical term appears only as background context (e.g. a note
explaining a real limitation caused by an old system) and isn't phrased as
something the product must do, it can stay as context.

If stripping the technology out leaves the requirement meaningless, that's
a sign it wasn't really understood in the first place — write it up as an
open decision instead of guessing.
