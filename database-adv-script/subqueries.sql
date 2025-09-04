-- Find all properties with an average rating greater than 4.0
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night
FROM properties p
WHERE (
    -- Subquery calculates the average rating for each property
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.property_id
) > 4.0;

-- Find users who have made more than 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    -- Correlated subquery counts bookings for each user
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
