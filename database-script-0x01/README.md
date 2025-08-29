# AirBnB Database Schema Design (DDL)
## Introduction
The `schema.sql` file defines the core structure of the application's database. It includes table definitions, relationships, and constraints to ensure data integrity and support application features.

## Objective
This schema defines the foundational structure for the AirBnB database, translating the Entity-Relationship (ER) diagram and specifications into executable SQL `CREATE TABLE` statements. The goal is to ensure robust data integrity, scalability, and support for all core application features.

## Key Design Choices

- **UUIDs** are used for primary keys to ensure global uniqueness.
- **Role-based access** is implemented via the `role` field in the `users` table.
- **Timestamps** such as `created_at` are set automatically for audit purposes.
- **Constraints** enforce data validity, such as unique emails and valid role values.

## Schema Implementation
The `schema.sql` file contains the complete DDL script, implementing the following tables:

- **`users`**: Stores user records with globally unique emails and a `role` attribute (`guest`, `host`, `admin`).
- **`properties`**: Details properties available for rent, with a foreign key referencing the `host` in the `users` table.
- **`bookings`**: Manages property reservations, linking each booking to both the `user` and the `property`.
- **`payments`**: Tracks payment transactions associated with bookings.
- **`reviews`**: Contains user-generated reviews and ratings for properties, with constraints to ensure ratings are between 1 and 5.
- **`messages`**: Enables communication between users, with foreign keys for both sender and recipient.

## Key Features
- **Primary Keys**: All tables use `UUID` primary keys for global uniqueness.
- **Foreign Keys**: Table relationships are enforced with `FOREIGN KEY` constraints to maintain referential integrity.
- **Data Types**: Columns use appropriate SQL data types (`UUID`, `VARCHAR`, `TEXT`, `DECIMAL`, `DATE`, `TIMESTAMP`) for accuracy and efficiency.
- **Constraints**: Includes `NOT NULL`, `UNIQUE`, and `CHECK` constraints to ensure data validity (e.g., unique emails, valid roles, rating bounds).
- **Indexing**: Indexes are created on foreign key columns and the `email` column to optimize query performance.

Refer to `schema.sql` for full table definitions, relationships, and constraints.