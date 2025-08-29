# AirBnB Database Seeding Script

## Objective
This script populates the AirBnB-style database with realistic sample data. The seeded data is essential for:
- Testing the database schema and verifying table relationships.
- Validating primary key and foreign key constraints.
- Providing a realistic environment for development and testing.

## Script Overview
The `seed.sql` file contains `INSERT` statements for each table in the schema. The sample data demonstrates key relationships and typical usage scenarios:

- **Users (`users`)**: Includes examples of host, guest, and admin roles.
- **Properties (`properties`)**: Linked to host users, with each host managing multiple properties.
- **Bookings (`bookings`)**: Guest users are associated with bookings for available properties.
- **Payments (`payments`)**: Each payment record is tied to a specific booking.
- **Reviews (`reviews`)**: Guests provide reviews and ratings for properties they have booked.
- **Messages (`messages`)**: Sample messages exchanged between guest and host users.

All primary key and foreign key relationships are maintained to ensure data integrity.

## Usage Instructions
1. **Create the Database Schema**  
   Run the schema setup file:
   ```bash
   psql -U your_username -d airbnb_db -f schema.sql