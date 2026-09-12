# Intent Manifest — OrderEase example

| ID | Name | Purpose | Dependencies | Shared Capabilities | Confidence | Open Decisions |
|---|---|---|---|---|---|---|
| INT-001 | Order Cancellation | Let a user back out of an order before it's committed to fulfillment | Soft: INT-002 (order history) provides entry point | Order record/status | Medium | DEC-001 |
| INT-002 | Order History | Let a user review and locate their past orders | None (INT-001 is entered from here, not required by it) | Order record/status | High | none |
