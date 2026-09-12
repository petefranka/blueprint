---
id: INT-002
name: Order History
version: 1
status: reviewed
last_updated: 2026-09-01
source_blueprint_entry: F2
---

# INT-002: Order History

## Purpose
Let a user review and locate their past orders.

## Problem
Users need to find a specific past order (to check status, revisit
details, or act on it, e.g. cancel) without having to remember order
numbers or dig through email confirmations.

## Users
Primary: any shopper with one or more past orders. Secondary: a
first-time or order-free user, who needs a clear "nothing here yet" state
rather than confusion.

## Desired Outcome
The user can quickly scan, filter, and open any past order; a user with
no orders yet understands that clearly and is nudged toward shopping.

## User Goals
- Find a specific past order quickly.
- Understand the current status of past orders at a glance.
- Understand, if there's nothing here, why not and what to do next.

## Core Behaviour
A scrollable, filterable list of the user's past orders, each entry
showing enough to identify and assess it at a glance; selecting one opens
its full details (INT-001's context, among other things).

## Workflows

**Primary journey**
1. User opens Order History.
2. User scans the list (optionally filters by status).
3. User selects an order.
4. Order Details opens for that order.

**Alternative journey — no orders yet**
1. User opens Order History with no past orders.
2. User sees an empty state explaining this and encouraging shopping,
   rather than a blank or broken-looking list.

**Alternative journey — filtering**
1. User applies a status filter.
2. List updates to show only matching orders.
3. If no orders match the filter, user needs a "no results for this
   filter" indication distinct from the true no-orders-at-all empty state
   (Inference: current evidence shows the general empty state but does
   not show a filtered-empty variant — flagged as an Unknown, not
   assumed identical).

## States
- Populated list (optionally filtered).
- Empty — no orders exist at all.
- Empty — filter matches nothing (see Unknown above).

## Rules
None beyond what's implied by filtering/display; no business rule
observed restricting who can see their own order history.

## Experience Intent
Each entry should let the user assess an order's relevance/urgency at a
glance (date, item, total, status) without opening it. The empty state
should feel like guidance, not a dead end.

## Constraints
None identified beyond showing only the current user's own orders
(Inference — not explicitly stated, but implied by this being personal
order history rather than a shared or admin view).

## Dependencies
None — this feature does not require any other feature to deliver its own
outcome.

## Shared Capabilities
Order record/status: shared with INT-001 (Order Cancellation), which both
reads and writes this same underlying concept.

## Assumptions
- Assuming order history shows only the current user's own orders (see
  Constraints) — reasonable default, not contradicted by anything, and
  low-impact to state explicitly rather than silently bake in.

## Open Decisions
None specific to this feature. (DEC-001 affects INT-001, not this one,
though both display the same status values.)

## Out of Scope
- Sorting options beyond status filtering are not addressed by current
  source material.

## Acceptance Signals
- A user with orders can always find a specific one via scan or filter.
- A user with none understands why the list is empty and what to do
  next.
- Status shown here always matches the status shown in Order Details for
  the same order (consistency with INT-001's shared capability).

## Evidence
See `evidence.md`, section "INT-002."
