# Input: Technology-Contaminated

## Screen: Photo Upload
User selects a photo from their device and uploads it as their profile
picture. Preview shown before confirming.

## Engineering note (present in the same design doc)
"We'll store the uploaded image in an S3 bucket and generate a resized
thumbnail via a Lambda function on upload. The user's profile record in
our Postgres `users` table gets a new `avatar_url` column pointing at the
S3 object."
