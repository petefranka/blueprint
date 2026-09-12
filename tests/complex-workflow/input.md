# Input: Complex Workflow

## Screen flow: Loan Application

1. Applicant fills a multi-step form (personal info, income, requested
   amount). Can save and resume later.
2. On submit, application enters "Under Review."
3. If additional documents are needed, status becomes "Documents
   Requested" and applicant is notified; applicant uploads documents;
   status returns to "Under Review."
4. If the review times out after a stated period with no applicant
   response to a document request, status becomes "Expired."
5. If approved, status becomes "Approved" and applicant must accept terms
   within a stated window or the offer lapses ("Offer Lapsed").
6. If rejected, status becomes "Rejected" with a stated reason category
   (not free text) shown to the applicant.
7. Applicant can withdraw the application at any point before a final
   status (Approved-and-accepted, Rejected, Expired, Offer Lapsed) is
   reached.
