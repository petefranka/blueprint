# Evidence Log — OrderEase example

## INT-001

### Requirement
Users must be able to cancel an eligible order from Order Details.

### Evidence
- Order Details screen: "Cancel Order" button
- Order Details screen: confirmation dialog (Confirm/Back)

### Confidence
High

### Category
Observation

---

### Requirement
Cancellation eligibility is bounded by fulfillment progress, but the exact
cutoff is unresolved (see DEC-001).

### Evidence
- Order Details screen: Cancel button visible only pre-shipment
- Product notes doc: "before the warehouse picks the item"
- Older notes file (previous iteration): "before the order shows as Shipped"

### Confidence
Low

### Category
Unknown (see DEC-001)

---

### Requirement
On successful cancellation, the user receives clear confirmation and the
order's status updates to reflect cancellation.

### Evidence
- Order Details screen: success banner after confirm
- Order Details screen: order status becomes "Cancelled"

### Confidence
High

### Category
Observation

## INT-002

### Requirement
Users must be able to browse a list of their past orders.

### Evidence
- Order History screen: scrollable order list

### Confidence
High

### Category
Observation

---

### Requirement
Users must be able to filter their order history by status.

### Evidence
- Order History screen: status filter control

### Confidence
High

### Category
Observation

---

### Requirement
Users with no past orders must see a clear empty state that encourages
further action, not a blank or broken-looking screen.

### Evidence
- Order History screen: empty-state illustration + "No orders yet — start
  shopping."

### Confidence
High

### Category
Observation
