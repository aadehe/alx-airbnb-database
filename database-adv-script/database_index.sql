-- ======================
-- Indexes for USERS
-- ======================

-- Index for role (often used in WHERE filters)
CREATE INDEX idx_users_role ON users(role);

-- Index for created_at (sorting/filtering by signup date)
CREATE INDEX idx_users_created_at ON users(created_at);


-- ======================
-- Indexes for PROPERTIES
-- ======================

-- Index for host_id (JOIN with users)
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Index for location (search/filter queries)
CREATE INDEX idx_properties_location ON properties(location);

-- Index for price_per_night (range filters: <, >, BETWEEN)
CREATE INDEX idx_properties_price_per_night ON properties(price_per_night);

-- Index for created_at (sorting newest listings)
CREATE INDEX idx_properties_created_at ON properties(created_at);


-- ======================
-- Indexes for BOOKINGS
-- ======================

-- Index for user_id (JOIN with users)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for status (WHERE filters: confirmed, pending, canceled)
CREATE INDEX idx_bookings_status ON bookings(status);

-- Index for start_date (date range searches)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for end_date (date range searches)
CREATE INDEX idx_bookings_end_date ON bookings(end_date);

-- Composite index for (start_date, end_date) to optimize availability queries
CREATE INDEX idx_bookings_date_range ON bookings(start_date, end_date);

-- Index for created_at (sorting by booking creation time)
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
