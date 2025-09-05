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


-- -- Retrieve bookings with user, property, and payment details
-- SELECT
--     -- Booking details
--     b.booking_id,
--     b.start_date,
--     b.end_date,
--     b.status,
--     b.created_at AS booking_created_at,
--
--     -- User details (who made the booking)
--     u.user_id AS user_id,
--     u.first_name,
--     u.last_name,
--     u.email,
--     u.role,
--
--     -- Property details (booked property)
--     p.property_id,
--     p.name AS property_name,
--     p.location,
--     p.price_per_night,
--
--     -- Payment details
--     pay.payment_id,
--     pay.amount,
--     pay.payment_method,
--     pay.payment_date
--
-- FROM bookings b
-- -- Join to get the user who made the booking
-- INNER JOIN users u
--     ON b.user_id = u.user_id
-- -- Join to get property details
-- INNER JOIN properties p
--     ON b.property_id = p.property_id
-- -- Join to get payment details (some bookings may have none → use LEFT JOIN)
-- LEFT JOIN payments pay
--     ON b.booking_id = pay.booking_id
-- ORDER BY b.created_at DESC;

EXPLAIN
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.role,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id
INNER JOIN properties p
    ON b.property_id = p.property_id
LEFT JOIN payments pay
    ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;
