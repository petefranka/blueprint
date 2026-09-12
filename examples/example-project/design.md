# Source material: "OrderEase" order management screens (fictional, for example purposes)

This is a stand-in for the kind of raw material Blueprint actually consumes
(screenshots, exported design files, notes). It's written as a plain
description here so the example is readable without image assets.

## Screen: Order Details

Shows a single past order: items, quantities, total, delivery status, and
order date. There is a "Cancel Order" button, visible only for orders that
have not yet shipped. Tapping it opens a confirmation dialog ("Are you sure
you want to cancel this order?") with Confirm/Back options. On confirm, the
order status changes to "Cancelled" and the user sees a brief success
banner. The design does not specify what happens if the order has already
started fulfillment processing but not yet physically shipped — there's no
visible state for that case.

## Screen: Order History

A scrollable list of the user's past orders, each row showing order date,
item thumbnail, total, and status (Processing / Shipped / Delivered /
Cancelled). Tapping a row opens that order's Order Details screen. There's
a filter control for status. If the user has no past orders, the screen
shows an illustration and the text "No orders yet — start shopping."

## Note from product notes doc

"Cancellation should probably only be allowed before the warehouse picks
the item, not just before shipping — need to confirm with ops team."

## Note from a separate, older notes file (previous iteration)

"Users can cancel anytime before the order shows as Shipped."

(This directly conflicts with the newer product note above about
warehouse picking — flagged by the Contradiction Analyst below.)
