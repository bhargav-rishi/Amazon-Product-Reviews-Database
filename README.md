# Amazon Product Review Database – Advanced DBMS Project

This project was developed as part of the **Advanced Database Management Systems** course. It focuses on building a robust, relational product review database using **MariaDB** with full **CRUD functionality**, **ACID compliance**, and real-world e-commerce applicability.

##  Dataset

The dataset simulates Amazon products, users, and reviews, capturing essential attributes like:
- Product ID, category, pricing, rating
- User information
- Review title, content, image/product links

Sourced and adapted from:  
https://www.kaggle.com/code/mehakiftikhar/amazon-sales-dataset-eda

##  Key Features

-  Three relational tables: `products`, `users`, and `reviews`
-  Full ACID-compliant transactional design
-  All CRUD operations implemented via SQL
-  Entity integrity using primary and foreign keys
-  Indexed IDs for fast retrieval and real-time updates

##  Project Structure

| File/Folder         | Description                                       |
|---------------------|---------------------------------------------------|
| `SQL/CRUD_Group_Project.sql` | Full SQL schema + CRUD operations |
| `report/Project_Report.docx` | Detailed technical report |
| `presentation/Project_Presentation.pptx` | Final presentation deck |

##  Entity Relationship Summary

- **Products**: `product_id` (PK)
- **Users**: `user_id` (PK)
- **Reviews**: `review_id` (PK), `product_id` (FK), `user_id` (FK)

##  CRUD Operations (Sample)

```sql
-- Create Table
CREATE TABLE products (
    product_id VARCHAR(100) PRIMARY KEY,
    product_name VARCHAR(255),
    ...
);

-- Insert Sample Data
INSERT INTO products (...) VALUES (...);

-- Query Products with High Ratings
SELECT product_id, product_name
FROM products
WHERE rating > 4.0;

-- Update User
UPDATE users SET user_name = 'Johnathan Doe' WHERE user_id = 'AG1234567890';

-- Delete Review
DELETE FROM reviews WHERE review_id = 'R110CR4AD558XA';
