# Feature Map — OrderEase example

Status: APPROVED
Generated: 2026-09-01
Approved: 2026-09-01

## F1: Order Cancellation

- **Purpose**: Let a user back out of an order before it's committed to
  fulfillment.
- **Primary user**: Shopper with an existing order.
- **Desired outcome**: The user can reliably cancel an eligible order and
  knows immediately that it worked.
- **Evidence**: Order Details screen (Cancel button, confirmation dialog,
  success banner); product notes doc; older notes file.
- **Confidence**: High (the capability clearly exists); the *eligibility
  rule* itself is Low confidence — see boundary/decision notes.
- **Suspected dependencies**: none required; commonly entered from F2.
- **Suspected shared capabilities**: order record/status, shared with F2.
- **Boundary uncertainty**: none on the boundary itself — this is clearly
  one capability. (The unresolved eligibility rule is a decision, not a
  boundary question — see decisions.md.)

## F2: Order History

- **Purpose**: Let a user review and locate their past orders.
- **Primary user**: Shopper with one or more past orders.
- **Desired outcome**: The user can find any past order quickly, including
  when they have none yet.
- **Evidence**: Order History screen (list, filter, empty state).
- **Confidence**: High.
- **Suspected dependencies**: none.
- **Suspected shared capabilities**: order record/status, shared with F1.
- **Boundary uncertainty**: none.

---

## Human decision

- **Decision**: APPROVED
- **Notes**: Approved as proposed, no boundary changes needed. Flag the
  cancellation eligibility conflict for ops as a decision, don't guess.
