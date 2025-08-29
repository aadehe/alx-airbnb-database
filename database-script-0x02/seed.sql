-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', NOW()),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Williams', 'bob@example.com', 'hashed_pw2', '9876543210', 'host', NOW()),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Smith', 'carol@example.com', 'hashed_pw3', NULL, 'guest', NOW()),
  ('44444444-4444-4444-4444-444444444444', 'David', 'Brown', 'david@example.com', 'hashed_pw4', '5551112222', 'admin', NOW()),
  ('55555555-5555-5555-5555-555555555555', 'Eve', 'Miller', 'eve@example.com', 'hashed_pw5', '4445556666', 'guest', NOW()),
  ('66666666-6666-6666-6666-666666666666', 'Frank', 'Davis', 'frank@example.com', 'hashed_pw6', '2223334444', 'host', NOW()),
  ('77777777-7777-7777-7777-777777777777', 'Grace', 'Taylor', 'grace@example.com', 'hashed_pw7', NULL, 'guest', NOW()),
  ('88888888-8888-8888-8888-888888888888', 'Henry', 'Wilson', 'henry@example.com', 'hashed_pw8', '1112223333', 'guest', NOW());

-- Insert Properties (Bob and Frank are hosts)
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Ocean View Apartment', 'A cozy apartment with sea view', 'Miami, FL', 150.00, NOW(), NOW()),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Rustic cabin in the mountains', 'Aspen, CO', 200.00, NOW(), NOW()),
  ('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '66666666-6666-6666-6666-666666666666', 'City Loft', 'Modern loft in downtown New York', 'New York, NY', 250.00, NOW(), NOW()),
  ('aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '66666666-6666-6666-6666-666666666666', 'Beach House', 'Spacious beach house with private pool', 'Los Angeles, CA', 400.00, NOW(), NOW());

-- Insert Bookings (mix of confirmed, pending, canceled)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 'confirmed', NOW()),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', '2025-09-10', '2025-09-15', 'pending', NOW()),
  ('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '55555555-5555-5555-5555-555555555555', '2025-09-20', '2025-09-25', 'confirmed', NOW()),
  ('bbbbbbb4-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '77777777-7777-7777-7777-777777777777', '2025-09-05', '2025-09-07', 'canceled', NOW()),
  ('bbbbbbb5-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '88888888-8888-8888-8888-888888888888', '2025-09-15', '2025-09-18', 'confirmed', NOW());

-- Insert Payments (only for confirmed bookings)
INSERT INTO payments (payment_id, booking_id, amount, payment_method, payment_date)
VALUES
  ('ppppppp1-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 600.00, 'credit_card', NOW()),
  ('ppppppp2-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1250.00, 'paypal', NOW()),
  ('ppppppp3-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb5-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 450.00, 'stripe', NOW());

-- Insert Reviews (only confirmed bookings)
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! The view was incredible.', NOW()),
  ('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '55555555-5555-5555-5555-555555555555', 4, 'Stylish loft, perfect location!', NOW()),
  ('rrrrrrr3-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '88888888-8888-8888-8888-888888888888', 3, 'Good place but a bit noisy at night.', NOW());

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the apartment available earlier?', NOW()),
  ('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, yes you can check in a day earlier.', NOW()),
  ('mmmmmmm3-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '33333333-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', 'Hi Bob, does the cabin have WiFi?', NOW()),
  ('mmmmmmm4-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '55555555-5555-5555-5555-555555555555', '66666666-6666-6666-6666-666666666666', 'Hi Frank, can I bring pets to the loft?', NOW()),
  ('mmmmmmm5-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '66666666-6666-6666-6666-666666666666', '55555555-5555-5555-5555-555555555555', 'Yes, pets are allowed!', NOW()),
  ('mmmmmmm6-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '77777777-7777-7777-7777-777777777777', '66666666-6666-6666-6666-666666666666', 'Hi Frank, is the beach house available next month?', NOW());
