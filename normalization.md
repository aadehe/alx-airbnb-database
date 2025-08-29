# Database Normalization Review – AirBnB Schema
Normalization is a systematic approach to organizing data in a database to reduce redundancy and improve data integrity. The process involves decomposing tables into smaller, more manageable pieces while ensuring that relationships between the data are maintained. Here are the key steps and concepts involved in normalization:

## 1. Introduction
Normalization ensures data is stored efficiently by eliminating redundancy and maintaining data integrity.  
Our goal: Achieve **Third Normal Form (3NF)**.

## Objectives
- Apply normalization techniques to the database design.
- Ensure that the database adheres to the principles of normalization up to the Third Normal Form (3NF).
- Minimize data redundancy and enhance data integrity.
- Provide a clear and structured overview for database implementation.

## 1. First Normal Form (1NF)  

**A table is in 1NF if:**  
- It has a primary key that uniquely identifies each row.  
- There are no repeating groups of columns.  
- Each column contains an atomic value (a single, non-divisible value).  

**Analysis:**  
The current schema already satisfies 1NF.  
- Each entity (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) has a unique primary key (`user_id`, `property_id`, `booking_id`, etc.).  
- There are no repeating groups of data (e.g., multiple phone numbers are not crammed into one field).  
- All attributes are atomic; for example, `first_name` and `last_name` are separated.  

✅ **The schema is in 1NF.**  

---

## 2. Second Normal Form (2NF)  

**A table is in 2NF if:**  
- It is already in 1NF.  
- All non-key attributes depend on the whole of the primary key, not just part of it (applies to composite keys).  

**Analysis:**  
- Most tables (`User`, `Property`, `Booking`, etc.) use **single-column primary keys** (UUIDs), so partial dependency is not an issue.  
- For example, in the `Booking` table, attributes like `start_date`, `end_date`, and `status` all depend only on `booking_id` (the PK).  

✅ **The schema is in 2NF.**  

---

## 3. Third Normal Form (3NF)  

**A table is in 3NF if:**  
- It is already in 2NF.  
- There are no **transitive dependencies** (non-key attributes depending on other non-key attributes).  
- There are no **derived or redundant attributes**.  

**Analysis:**  
- `Booking.total_price` is a derived attribute (can be calculated as `(end_date - start_date) × pricepernight`). This introduces redundancy.  
- `Payment.amount` may also be redundant if it always equals `Booking.total_price`. However, if **partial payments** are allowed, keeping `amount` is valid.  
- No other transitive dependencies were found.  

**Adjustments:**  
- Remove `Booking.total_price`.  
- Keep `Payment.amount` only if partial payments are part of the business rules.  

✅ **After these adjustments, the schema is in 3NF.**  

---

## 4. Final Notes  
- The schema now conforms to **3NF**.  
- Benefits include:  
  - Reduced redundancy.  
  - Improved data integrity.  
  - Easier maintenance and queries.  
