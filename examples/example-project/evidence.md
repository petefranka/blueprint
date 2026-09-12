# Evidence Log - OrderEase example

## INT-001

### E-001 - Cancellation action and confirmation

#### Requirement
Users can cancel an eligible order from Order Details after confirmation.

#### Evidence
- Order Details screen: "Cancel Order" button
- Order Details screen: confirmation dialog (Confirm/Back)

#### Confidence
High

#### Category
Observation

### E-002 - Cancellation eligibility

#### Requirement
Fulfillment progress limits cancellation, but the exact cutoff is unresolved.

#### Evidence
- Order Details screen: Cancel button visible only pre-shipment
- Product notes: "before the warehouse picks the item"
- Older notes: "before the order shows as Shipped"

#### Confidence
Low

#### Category
Unknown (see DEC-001)

### E-003 - Cancellation result

#### Requirement
Successful cancellation gives confirmation and changes the order status.

#### Evidence
- Order Details screen: success banner after confirmation
- Order Details screen: order status becomes "Cancelled"

#### Confidence
High

#### Category
Observation

## INT-002

### E-004 - Order list

#### Requirement
Users can browse past orders and open an order's details.

#### Evidence
- Order History screen: scrollable order list with date, item, total, and status

#### Confidence
High

#### Category
Observation

### E-005 - Status filtering

#### Requirement
Users can filter their order history by status.

#### Evidence
- Order History screen: status filter control

#### Confidence
High

#### Category
Observation

### E-006 - Empty state

#### Requirement
Users with no orders see an explanation and a next action.

#### Evidence
- Order History screen: "No orders yet - start shopping."

#### Confidence
High

#### Category
Observation