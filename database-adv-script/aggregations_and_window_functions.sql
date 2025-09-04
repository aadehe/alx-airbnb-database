-- Rank properties by total number of bookings (unique ranking)
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;

-- Rank properties by total number of bookings (ties get same rank)
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
