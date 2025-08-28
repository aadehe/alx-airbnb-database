# Entities and Relationships in ER Diagram
This document outlines the entities and relationships that will be represented in the Airbnb-like clone database design.

## Objectives
- To identify the key entities involved in the system.
- To define the relationships between these entities.
- To establish the attributes for each entity.


## Entities & Attributes
| **Entity (Table)** | **Attributes** | **Constraints / Notes** |
|---------------------|----------------|--------------------------|
| **User** | `user_id (PK, UUID, Indexed)` <br> `first_name (VARCHAR, NOT NULL)` <br> `last_name (VARCHAR, NOT NULL)` <br> `email (VARCHAR, UNIQUE, NOT NULL)` <br> `password_hash (VARCHAR, NOT NULL)` <br> `phone_number (VARCHAR, NULL)` <br> `role (ENUM: guest, host, admin, NOT NULL)` <br> `created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` | - Primary Key: `user_id` <br> - Unique: `email` |
| **Property** | `property_id (PK, UUID, Indexed)` <br> `host_id (FK → User.user_id)` <br> `name (VARCHAR, NOT NULL)` <br> `description (TEXT, NOT NULL)` <br> `location (VARCHAR, NOT NULL)` <br> `pricepernight (DECIMAL, NOT NULL)` <br> `created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` <br> `updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)` | - FK: `host_id` → User <br> - Each property belongs to one host |
| **Booking** | `booking_id (PK, UUID, Indexed)` <br> `property_id (FK → Property.property_id)` <br> `user_id (FK → User.user_id)` <br> `start_date (DATE, NOT NULL)` <br> `end_date (DATE, NOT NULL)` <br> `total_price (DECIMAL, NOT NULL)` <br> `status (ENUM: pending, confirmed, canceled, NOT NULL)` <br> `created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` | - FK: `property_id` → Property <br> - FK: `user_id` → User |
| **Payment** | `payment_id (PK, UUID, Indexed)` <br> `booking_id (FK → Booking.booking_id)` <br> `amount (DECIMAL, NOT NULL)` <br> `payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` <br> `payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)` | - FK: `booking_id` → Booking |
| **Review** | `review_id (PK, UUID, Indexed)` <br> `property_id (FK → Property.property_id)` <br> `user_id (FK → User.user_id)` <br> `rating (INTEGER, 1–5, NOT NULL)` <br> `comment (TEXT, NOT NULL)` <br> `created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` | - FK: `property_id` → Property <br> - FK: `user_id` → User <br> - Rating must be between 1–5 |
| **Message** | `message_id (PK, UUID, Indexed)` <br> `sender_id (FK → User.user_id)` <br> `recipient_id (FK → User.user_id)` <br> `message_body (TEXT, NOT NULL)` <br> `sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)` | - FK: `sender_id` → User <br> - FK: `recipient_id` → User |

---

## Relationships
| **Relationship** | **From Entity** | **To Entity** | **Cardinality** | **Description** |
|------------------|----------------|---------------|----------------|----------------|
| **Hosts Properties** | User (`user_id`) | Property (`host_id`) | 1 → Many | One host can list many properties. |
| **Books Property** | User (`user_id`) | Booking (`user_id`) | 1 → Many | A guest can make many bookings. |
| **Property Bookings** | Property (`property_id`) | Booking (`property_id`) | 1 → Many | A property can have many bookings. |
| **Booking Payments** | Booking (`booking_id`) | Payment (`booking_id`) | 1 → 1 (or 1 → Many) | Each booking has at least one payment. |
| **Property Reviews** | Property (`property_id`) | Review (`property_id`) | 1 → Many | A property can have many reviews. |
| **User Reviews** | User (`user_id`) | Review (`user_id`) | 1 → Many | A user can leave many reviews. |
| **User Messages** | User (`sender_id`) | User (`recipient_id`) | Many ↔ Many (via Message) | Users can exchange many messages with each other. |
