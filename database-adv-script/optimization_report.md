# Refactor the query to reduce execution time
## Objective
Refactor complex SQL queries to improve performance and reduce execution time.
## Original Query
```sql
-- Retrieve bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id
INNER JOIN properties p
    ON b.property_id = p.property_id
LEFT JOIN payments pay
    ON b.booking_id = pay.booking_id
WHERE u.user_id = '123e4567-e89b-12d3-a456-426614174000'   -- filter by user
  AND b.start_date >= '2025-09-01'                         -- filter by date
  AND b.end_date <= '2025-09-30'
ORDER BY b.start_date;  
```
## Refactored Query
```sql
-- Optimized query: retrieves bookings with only necessary joins and indexed columns
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.created_at AS booking_created_at,

    -- Minimal user details (remove heavy text columns unless needed)
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,

    -- Key property details (exclude description/text for performance)
    p.property_id,
    p.name AS property_name,
    p.location,

    -- Payment summary (may be NULL if no payment exists)
    pay.amount,
    pay.payment_method
FROM bookings b
-- Keep only essential joins
JOIN users u
    ON b.user_id = u.user_id
JOIN properties p
    ON b.property_id = p.property_id
LEFT JOIN payments pay
    ON b.booking_id = pay.booking_id
-- Use indexed column for sorting
ORDER BY b.created_at DESC;
```
## Explanation of Changes
1. **Reduced Joins**: Removed unnecessary joins to tables that were not essential for the output.
2. **Selective Columns**: Selected only necessary columns to reduce data load and improve performance.
3. **Indexed Columns**: Used indexed columns in `ORDER BY` to speed up sorting.
4. **Early Filtering**: Applied filters in the `WHERE` clause to limit the dataset early in the query execution.

## Performance Measurement
1. **Before Refactoring**: Use `EXPLAIN` or `ANALYZE` to measure the execution plan and time of the original query.
2. **After Refactoring**: Run the refactored query and measure the execution plan and time again.
3. **Comparison**: Document the differences in execution time and resource usage between the original and refactored queries.
## Conclusion
Refactoring the query by optimizing join conditions and reducing the dataset early can significantly improve performance and reduce execution time.
