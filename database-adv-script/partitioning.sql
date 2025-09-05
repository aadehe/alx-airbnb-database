-- Drop old table (if it exists)
DROP TABLE IF EXISTS bookings CASCADE;

-- Create parent partitioned table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Partition for bookings in 2025
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Partition for bookings in 2026
CREATE TABLE bookings_2026 PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Default partition (catch-all for unexpected dates)
CREATE TABLE bookings_default PARTITION OF bookings DEFAULT;

-- Indexes for partitions
CREATE INDEX idx_bookings_2025_user_id ON bookings_2025(user_id);
CREATE INDEX idx_bookings_2025_property_id ON bookings_2025(property_id);
CREATE INDEX idx_bookings_2025_status ON bookings_2025(status);

CREATE INDEX idx_bookings_2026_user_id ON bookings_2026(user_id);
CREATE INDEX idx_bookings_2026_property_id ON bookings_2026(property_id);
CREATE INDEX idx_bookings_2026_status ON bookings_2026(status);

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';
