---
id: INT-001
name: Order Cancellation
version: 1
status: reviewed
last_updated: 2026-09-01
source_feature_map_entry: F1
---

# INT-001: Order Cancellation

## Purpose
Let a user back out of an order before it has progressed too far into
fulfillment to reasonably reverse.

## Problem
Users sometimes need to undo a purchase decision (wrong item, changed
mind, ordered by mistake) after the order is placed but before it's
irreversibly on its way.

## Users
Primary: a shopper who has an existing, not-yet-completed order.

## Desired Outcome
The user can cancel an eligible order in a couple of taps and knows
immediately, unambiguously, that it worked.

## User Goals
- Undo a purchase before it's too late to do so.
- Avoid uncertainty about whether the cancellation actually went through.

## Core Behaviour
From an order's details, an eligible order can be cancelled after an
explicit confirmation step. Once cancelled, the order's status reflects
this everywhere it's shown (see Shared Capabilities).

## Workflows

**Primary journey**
1. User views Order Details for an eligible order.
2. User selects Cancel.
3. User is asked to confirm (Confirm / Back).
4. User confirms.
5. Order status updates to Cancelled; user sees clear success feedback.

**Alternative journey — user backs out**
1-3. Same as above.
4. User selects Back instead of Confirm.
5. No change occurs; user remains on Order Details.

**Ineligible order**
- If an order is not eligible for cancellation, no cancellation entry
  point is presented (Observation: current design simply hides the Cancel
  action rather than showing it disabled with an explanation). Whether a
  disabled-with-explanation treatment would serve users better is not
  established by current evidence — flagged as an Assumption below rather
  than changed unilaterally.

## States
- Cancellable — order has not yet crossed the eligibility cutoff.
- Not cancellable — order has crossed the eligibility cutoff (exact
  cutoff: see Open Decisions).
- Cancelled — terminal state after successful confirmation.

## Rules
- A cancellation requires an explicit confirm step; it must not be a
  single, no-confirmation tap.
- Exactly where the cancellable → not-cancellable transition occurs is
  not resolved by current evidence (see Open Decisions — DEC-001).

## Experience Intent
Cancellation must feel safe and reversible right up until the confirm
step (hence the confirmation dialog), and the outcome must feel certain
immediately after confirming — a clear, unambiguous success indication,
not just a silent status change the user has to go looking for.

## Constraints
Only orders in a cancellable state expose the cancellation action at all.

## Dependencies
Soft dependency on INT-002 (Order History): in practice this feature is
most often entered by navigating from an order history list, though
nothing about this feature's own behavior requires that entry point.

## Shared Capabilities
Order record/status: this feature both reads and writes the same
underlying order status concept that INT-002 (Order History) reads and
displays.

## Assumptions
- Assuming the current hide-when-ineligible treatment (rather than
  disabled-with-explanation) is intentional, since no evidence suggests
  otherwise and it's a low-impact presentational choice, not a behavior
  change.

## Open Decisions
- DEC-001 — the fulfillment-progress cutoff at which an order stops being
  cancellable is unresolved; two source documents disagree (see
  `decisions.md`). This is left open rather than guessed.

## Out of Scope
- What happens to payment/refund processing after cancellation is not
  addressed by current source material and is not assumed here.

## Acceptance Signals
- A user can cancel any order that is genuinely still eligible, and
  cannot cancel one that is not.
- After cancelling, the order's status is immediately and consistently
  shown as Cancelled everywhere the order appears.
- No user reaches a state where they're unsure whether their cancellation
  succeeded.

## Evidence
See `evidence.md`, section "INT-001."
