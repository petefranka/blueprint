---
id: INT-002
name: Order History
version: 1
status: reviewed
last_updated: 2026-09-01
source_blueprint_entry: F2
---

# INT-002: Order History

## Outcome

A shopper can quickly find and assess a past order without remembering an
order number or relying on an email confirmation. [E-004]

## Behaviour

- The shopper can browse past orders and open an order's details. [E-004]
- The shopper can filter orders by status. [E-005]
- A shopper with no orders sees an explanatory empty state and a next
  action. [E-006]

## Journeys

1. The shopper opens Order History, scans or filters the list, and selects
   an order to view its details. [E-004] [E-005]
- **No orders:** The shopper sees that no orders exist and can continue
  shopping. [E-006]
- **No filter matches:** The shopper sees that the filter returned no
  results, distinct from having no orders. This is inferred from the two
  different conditions. [E-005] [E-006]

## Rules and States

- The list is either populated, empty because no orders exist, or empty
  because the active filter has no matches. [E-004] [E-005] [E-006]
- The history is assumed to contain only the current shopper's orders.
  [E-004]

## Experience

Each list item shows enough date, item, total, and status information to
judge relevance before opening it. Empty states explain the condition
rather than appearing broken. [E-004] [E-006]

## Relationships

- Order status is shared with INT-001 and must remain consistent after a
  cancellation. [E-004]

## Uncertainty

- **Assumption:** A shopper sees only their own order history. [E-004]
- **Out of scope:** Sorting beyond the evidenced status filter.

## Acceptance

- A shopper with orders can find one by scanning or filtering.
- A shopper with no orders understands why the list is empty and what to
  do next.
- The status matches the same order wherever it is shown.