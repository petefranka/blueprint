---
id: INT-001
name: Order Cancellation
version: 1
status: reviewed
last_updated: 2026-09-01
source_blueprint_entry: F1
---

# INT-001: Order Cancellation

## Outcome

A shopper can cancel an eligible order before fulfillment progresses too
far and immediately know the cancellation succeeded. [E-001] [E-003]

## Behaviour

- An eligible order offers cancellation from its details. [E-001]
- Cancellation requires explicit confirmation. Going back leaves the
  order unchanged. [E-001]
- A successful cancellation changes the order status to Cancelled and
  shows clear confirmation. [E-003]
- An ineligible order does not offer cancellation. [E-002]

## Journeys

1. The shopper opens an eligible order, selects Cancel, confirms, and sees
   the Cancelled status and success feedback. [E-001] [E-003]
- **Back:** The shopper leaves the confirmation without changing the
  order. [E-001]

## Rules and States

- Orders move from Cancellable to Not cancellable at a fulfillment cutoff;
  the exact cutoff is unresolved. [E-002]
- Cancelled is terminal for this feature. [E-003]

## Experience

The confirmation prevents accidental cancellation. The result is explicit
so the shopper does not need to infer success from a silent status change.
[E-001] [E-003]

## Relationships

- Order status is shared with INT-002, which displays the result. [E-003]

## Uncertainty

- **Assumption:** Hiding cancellation for ineligible orders is intentional.
  [E-002]
- **Decision:** DEC-001 - Define the fulfillment cutoff for cancellation.
- **Out of scope:** Payment and refund behavior after cancellation.

## Acceptance

- Eligible orders can be cancelled only after confirmation.
- Ineligible orders cannot be cancelled.
- Cancellation status and feedback are immediate and consistent wherever
  the order appears.