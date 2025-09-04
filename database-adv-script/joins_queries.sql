-- Write Complex Queries with Joins

-- Retrieve all bookings along with the users who made them
SELECT
    -- Booking details
    b.booking_id,
    b.property_id,
    b.user_id AS booking_user_id,     -- Alias to distinguish from users.user_id
    b.start_date,
    b.end_date,
    b.status,
    b.created_at AS booking_created_at, -- Renamed to avoid clash with users.created_at

    -- User details
    u.user_id AS user_id,              -- Explicitly select user_id from users
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    u.created_at AS user_created_at    -- Renamed to avoid clash with booking_created_at
FROM bookings b
-- INNER JOIN ensures we only return bookings that have a valid user
INNER JOIN users u
    ON b.user_id = u.user_id;


-- Retrieve all properties and their reviews (if any)
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,

    -- Review details (may be NULL if no review exists)
    r.review_id,
    r.user_id AS reviewer_user_id,
    r.rating,
    r.comment,
    r.created_at AS review_created_at
FROM properties p
-- LEFT JOIN ensures all properties are included,
-- even those without reviews (r.* will be NULL in that case)
LEFT JOIN reviews r
    ON p.property_id = r.property_id
ORDER BY p.name;


-- Retrieve all users and all bookings,
-- including users without bookings and bookings without users
SELECT
    -- User details
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    u.created_at AS user_created_at,

    -- Booking details
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status,
    b.created_at AS booking_created_at
FROM users u
-- FULL OUTER JOIN ensures that:
-- 1) Users with no bookings still appear (bookings fields will be NULL)
-- 2) Bookings without a linked user still appear (user fields will be NULL)
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;
