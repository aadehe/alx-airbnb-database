# ALX Airbnb Clone Database Partitioning

## Partitioning Large Tables

### Objective
Implement table partitioning to optimize queries on large datasets.

### Implementation
1. Dropped old `bookings` table
2. Created Parent partitioned table `bookings`.
3. Partitioned by `start_date` to improve query performance for date-range queries.
4. Created `bookings_2025` table with `PARTITION BY RANGE ('2025-01-01') TO ('2026-01-01')`.
5. Created `bookings_2026` table with `PARTITION BY RANGE ('2026-01-01') TO ('2027-01-01')`.
6. Created default partition `bookings_default` for dates outside defined ranges (catch-all for unexpected dates).
7. Created indexes for all partitions.

### Performance Testing
- Query: Fetch bookings for 2025
- Before partitioning:
  - Query scanned all rows in `bookings` table (~millions of rows)
  - Execution time: higher
- After partitioning:
  - Query scanned only `bookings_2025` partition
  - Execution time: significantly reduced
  - Fewer rows scanned → faster performance

### Conclusion

Partitioning the Booking table by `start_date` drastically improves performance for date-range queries. Future partitions can be added for upcoming years to maintain efficiency.