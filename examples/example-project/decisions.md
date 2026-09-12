# Decisions Log — OrderEase example

## DEC-001: Cancellation eligibility cutoff

### Question
At what point in fulfillment does an order stop being eligible for
cancellation — ship time, or warehouse pick time?

### Evidence
Two source documents disagree: a product note says cancellation should
likely be limited to "before the warehouse picks the item," while an older
notes file says "before the order shows as Shipped." The Order Details
screen itself only shows/hides the Cancel button based on shipped-or-not,
which matches the older note, not the newer one. Neither is confirmed as
current intent — the newer note explicitly says "need to confirm with ops
team."

### Affects
INT-001 (Order Cancellation)

### Status
Needs decision

### Resolution
(unresolved)
