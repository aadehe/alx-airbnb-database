# ALX Airbnb Clone Database Advanced Queries
This repository contains advanced SQL queries for the ALX Airbnb clone database project. The queries are designed to extract meaningful insights and perform complex data manipulations on the Airbnb dataset.

---

## Task0: Write Complex Queries with Joins
### Task Description
Write SQL queries that involve multiple table joins to retrieve specific information from the Airbnb clone database.

### Objectives
- Understand the relationships between different tables in the database.
- Write SQL queries that utilize JOIN operations to combine data from multiple tables.
- Retrieve specific information based on given criteria.

### Queries
**1. INNER JOIN**
- Retrieve all bookings and their respective users who made the bookings.

**2. LEFT JOIN**
- Retrieve all properties and their reviews.
- Include properties even if they have no reviews.

**2. FULL OUTER JOIN**
- Retrieve all users and all bookings, 
- Even if the user has no booking or a booking is not linked to a user.

---

## Task1: Write Subqueries
### Objectives
Write both correlated and uncorrelated subqueries to perform complex data retrieval.

### Queries
1. Uncorrelated Subquery
- Retrieve all properties where the average rating is greater than 4.0 using a subquery
2. Correlated Subquery
- users who have made more than 3 bookings.

---