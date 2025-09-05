# Indexes for Optimization
## Objective
Identity and create indexes to optimize query performance in a database.

## High-Usage Columns in User, Property, and Booking Tables
Identify columns that are frequently used in `WHERE` clauses, `JOIN` conditions, and `ORDER` BY clauses.

| **Table**     | **High-Usage Columns**                                                                 | **Usage Context (`WHERE` / `JOIN` / `ORDER BY`)**                          | **Index Status**        |
|---------------|-----------------------------------------------------------------------------------------|----------------------------------------------------------------------|-------------------------|
| **Users**     | `user_id`                                                                               | `JOIN` with `bookings`, `properties.host_id`, `reviews`, `messages`   | Primary Key (already indexed) |
|               | `email`                                                                                 | `WHERE` (login/authentication checks)                                  | Unique index (already indexed) |
|               | `role`                                                                                  | `WHERE` (filter by guest/host/admin)                                   | Candidate for new index |
|               | `created_at`                                                                            | `ORDER BY` (sort by signup date)                                       | Candidate for new index |
| **Properties**| `property_id`                                                                           | `JOIN` with `bookings`, `reviews`                                      | Primary Key (already indexed) |
|               | `host_id`                                                                               | `JOIN` with `users`                                                    | Candidate for new index |
|               | `location`                                                                              | `WHERE` (search/filter by location)                                    | Candidate for new index |
|               | `price_per_night`                                                                       | `WHERE` (price range filters)                                          | Candidate for new index |
|               | `created_at`                                                                            | `ORDER BY` (newest listings)                                           | Candidate for new index |
| **Bookings**  | `booking_id`                                                                            | `JOIN` with `payments`                                                 | Primary Key (already indexed) |
|               | `property_id`                                                                           | `JOIN` with `properties`                                               | Indexed (FK index exists) |
|               | `user_id`                                                                               | `JOIN` with `users`                                                    | Candidate for new index |
|               | `status`                                                                                | `WHERE` (filter by confirmed/pending/canceled)                         | Candidate for new index |
|               | `start_date`, `end_date`                                                                | `WHERE` (availability checks, date range)                              | Candidate for new index |
|               | `created_at`                                                                            | `ORDER BY` (recent bookings first)                                     | Candidate for new index |

## Recommended Indexes
Based on the analysis of high-usage columns, the following indexes are recommended to optimize query performance
| **Table**     | **Column(s)**                  | **Index Type**       | **Justification**                                                                 |
|---------------|--------------------------------|----------------------|----------------------------------------------------------------------------------|
| **Users**     | `role`                         | B-tree               | Frequent filtering by user role.                                           |
|               | `created_at`                   | B-tree               | Sorting users by signup date.                                               |
| **Properties**| `host_id`                      | B-tree               | | Frequent joins with users table.                                         |
|               | `location`                     | B-tree               | Commonly used in search filters.                                           |
|               | `price_per_night`                | B-tree               | Price range filtering.                                                     |
|               | `created_at`                   | B-tree               | Sorting properties by creation date.                                       |
| **Bookings**  | | `user_id`                      | B-tree               | Frequent joins with users table.                                           |
|               | `status`                       | B-tree               | Filtering bookings by status.                                             |
|               | `start_date`, `end_date`       | Composite B-tree       | Date range queries for availability checks.                                      |
|               | `created_at`                   | B-tree               | Sorting bookings by creation date.                                         |
## Implementation
To create the recommended indexes, use the following SQL commands:
```sql
-- Index on email in users table
CREATE INDEX idx_users_email ON users(email);

-- Index on property_id in properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Index on property_id in bookings table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on booking_id in bookings table
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- Index on booking_id in payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```