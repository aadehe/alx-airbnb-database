-- -- Stores user account information
-- CREATE TABLE users (
--     user_id UUID PRIMARY KEY,
--     first_name VARCHAR(100) NOT NULL,
--     last_name VARCHAR(100) NOT NULL,
--     email VARCHAR(255) UNIQUE NOT NULL,
--     password_hash VARCHAR(255) NOT NULL,
--     phone_number VARCHAR(20),
--     role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- -- Stores property listings hosted by users
-- CREATE TABLE properties (
--     property_id UUID PRIMARY KEY,
--     host_id UUID NOT NULL REFERENCES users(user_id),
--     name VARCHAR(255) NOT NULL,
--     description TEXT NOT NULL,
--     location VARCHAR(255) NOT NULL,
--     price_per_night DECIMAL(10,2) NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );
-- -- Stores bookings made by users for properties
-- CREATE TABLE bookings (
--     booking_id UUID PRIMARY KEY,
--     property_id UUID NOT NULL REFERENCES properties(property_id),
--     user_id UUID NOT NULL REFERENCES users(user_id),
--     start_date DATE NOT NULL,
--     end_date DATE NOT NULL,
--     total_price DECIMAL(10,2) NOT NULL,
--     status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- -- Stores payment information/transactions for bookings
-- CREATE TABLE payments (
--     payment_id UUID PRIMARY KEY,
--     booking_id UUID NOT NULL REFERENCES bookings(booking_id),
--     amount DECIMAL(10,2) NOT NULL,
--     payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe'))
-- );
--
-- -- Stores reviews left by users for properties
-- CREATE TABLE reviews (
--     review_id UUID PRIMARY KEY,
--     property_id UUID NOT NULL REFERENCES properties(property_id),
--     user_id UUID NOT NULL REFERENCES users(user_id),
--     rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
--     comment TEXT NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- -- Stores messages exchanged between users
-- CREATE TABLE messages (
--     message_id UUID PRIMARY KEY,
--     sender_id UUID NOT NULL REFERENCES users(user_id),
--     recipient_id UUID NOT NULL REFERENCES users(user_id),
--     message_body TEXT NOT NULL,
--     sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- -- Index on email in users table
-- CREATE INDEX idx_users_email ON users(email);
--
-- -- Index on property_id in properties table
-- CREATE INDEX idx_properties_property_id ON properties(property_id);
--
-- -- Index on property_id in bookings table
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
--
-- -- Index on booking_id in bookings table
-- CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);
--
-- -- Index on booking_id in payments table
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);


-- Stores user account information
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Stores property listings hosted by users
CREATE TABLE properties (
    property_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(user_id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    address VARCHAR(255) NOT NULL,
    price_per_night NUMERIC(10,2) NOT NULL
);

-- Stores booking records for properties
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES properties(property_id),
    user_id UUID NOT NULL REFERENCES users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL
    -- total_price removed (derived attribute. calculated as price_per_night * number_of_nights)
);

-- Stores payment transactions for bookings
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES bookings(booking_id),
    amount NUMERIC(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL
);

-- Stores reviews left by users for properties
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES properties(property_id),
    user_id UUID NOT NULL REFERENCES users(user_id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date DATE NOT NULL
);

-- Stores messages exchanged between users
CREATE TABLE messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES users(user_id),
    recipient_id UUID NOT NULL REFERENCES users(user_id),
    content TEXT NOT NULL,
    sent_at TIMESTAMP NOT NULL
);

-- Indexes for performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);