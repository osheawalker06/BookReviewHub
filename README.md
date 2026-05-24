# BookReviewHub
An application where users can: 
  1. Browse books
  2. View book details, and reviews
  3. Submit reviews for books
Each book can have many reviews. Each user can create reviews and only manage their own reviews.

## Features

  1.  **Browse & View:** Explore books and deep-dive into detailed title profiles.
  2.   **Authentication:** Managed via Devise. Visitors can browse freely, but must sign up or log in to create reviews.
  3.   **Granular Ownership:** Users can edit or delete only the reviews they created.

## Database Architecture

Book:
  a. title
  b. author
  c. description
  d. genre
  e. isbn 
  f. cover_url

Review
  a. book_id
  b. user_id
  c. rating
  d. comment

User
  a. email
  b. authentication

### Prerequisites

  1. **Ruby Version:** `3.4.8`
  2. **Framework:** Rails `8.1.2`
  3. **Database:** PostgreSQL

### Installation

1. **Clone the repository:**
```bash
   git clone [https://github.com/shea/BookReviewHub.git](https://github.com/shea/BookReviewHub.git)
   cd BookReviewHub

Install dependencies:

  1. bundle install

Setup the database:

  1. bin/rails db:create
  2. bin/rails db:migrate

Run the app:

  1. bin/dev
  2. Navigate to http://localhost:3000.

Run all tests:

   1. bin/rails test
   2. bin/rails test:system
