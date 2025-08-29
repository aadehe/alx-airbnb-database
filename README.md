# Airbnb Clone Database Project
## Project Overview
This project involves designing and implementing a robust, scalable and production-ready relational database that will support
the backend of Airbnb-like application. The database is designed to efficiently manage users, properties, bookings, payments, reviews, and messaging functionalities.
The repository includes Entity-Relationship (ER) diagram, normalization processes, and the final database schema design.
The project is structured into two main parts: the database schema creation and the data seeding scripts.
The database is designed to handle users, properties, bookings, payments, reviews, and messaging functionalities.

## Project Structure
```text
alx-airbnb-database/
├── ERD/
│   ├── ALX AirBnB Database Schema.png # Visual ER diagram
│   └── requirements.md                # DBML file for the ER diagram
├── normalization.md                   # Explanation of normalization steps
├── database-script-0x01/
│   ├── schema.sql                     # SQL CREATE TABLE statements
│   └── README.md                      # Documentation for schema design
├── database-script-0x02/
│   ├── seed.sql                       # SQL INSERT statements for sample data
│   └── README.md                      # Documentation for data seeding
├── README.md                          # This file
└── .gitignore                         # Git exclusion rules
```

### How to Run
1. **Set Up the Database**  
   Ensure you have PostgreSQL installed and running. Create a new database for the project:
   ```bash
   createdb airbnb_db
   ```
2. **Create the Schema**
3.  Run the schema setup file:
   ```bash
   psql -U your_username -d airbnb_db -f database-script-0x01/schema.sql
   ```
4. **Seed the Database**  
   Populate the database with sample data:
   ```bash
   psql -U your_username -d airbnb_db -f database-script-0x02/seed.sql
   ```
   5. **Verify the Data**  
      Connect to the database and run queries to verify the data has been inserted correctly:
      ```bash
      psql -U your_username -d airbnb_db
      ```
      ```sql
      SELECT * FROM users;
      SELECT * FROM properties;
      SELECT * FROM bookings;

