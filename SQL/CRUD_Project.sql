CREATE DATABASE project;
USE DATABASE project;

CREATE TABLE products (
    product_id VARCHAR(100) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    discounted_price DECIMAL(10, 2),
    actual_price DECIMAL(10, 2),
    discount_percentage DECIMAL(5, 2),
    rating DECIMAL(3, 2),
    rating_count INT,
    about_product VARCHAR(2000),
    PRIMARY KEY (product_id)
);

CREATE TABLE users (
    user_id VARCHAR(100) NOT NULL,
    user_name VARCHAR(255),
    PRIMARY KEY (user_id)
);

CREATE TABLE reviews (
    review_id VARCHAR(100),
    review_title VARCHAR(255),
    review_content VARCHAR(5000),
    img_link VARCHAR(2083),
    product_link VARCHAR(2083),
    product_id VARCHAR(100) NOT NULL,
    user_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (review_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);




--PRODUCTS Table:
--INSERT Statements:
--Insert a new product:
INSERT INTO products (product_id, product_name, category, discounted_price, actual_price, discount_percentage, rating, rating_count, about_product) 
VALUES ('B00KXULGJQ', 'TP-Link AC750 Wifi Range Extender | Up to 750Mbps | Dual Band WiFi Extender, Repeater, Wifi Signal Booster, Access Point| Easy Set-Up | Extends Wifi to Smart Home & Alexa Devices (RE200)', 'Computers&Accessories|NetworkingDevices|Repeaters&Extenders', 0.00, 0.00, 66.00, 4.20, 49, 'Boosts wireless signal to previously unreachable or hard-to-wire areas flawlessly|Compatible with 802.11 b/g/n and 802.11ac Wi-Fi devices|Dual band speeds up to 750Mbps|Miniature size and wall-mounted design make it easy to deploy and move flexibly|Ethernet port allows the Extender to function as a wireless adapter to connect wired devices');
--Insert another new product:
INSERT INTO products (product_id, product_name, category, discounted_price, actual_price, discount_percentage, rating, rating_count, about_product) 
VALUES ('B00NFD0ETQ', 'Logitech G402 Hyperion Fury USB Wired Gaming Mouse, 4,000 DPI, Lightweight, 8 Programmable Buttons, Compatible for PC/Mac - Black', 'Electronics', 0.00, 0.00, 31.00, 4.60, 10, 'HIGH SPEED TRACKING : Fusion engine delivers one of the highest gaming mouse tracking speeds of up to 500 IPS. Requirements : Windows 8, Windows 8.1, Windows 7 or Windows Vista. Length Cable: 2.1 m|ON-THE-FLY DPI : Shift through up to four DPI settings, from pixel-precise targeting (250 DPI) to lightning-fast manoeuvres (4000 DPI)');

--SELECT Statements:
--Select all products in a specific category, ordered by rating:
SELECT product_id, product_name, category, rating
FROM products
WHERE category LIKE '%Electronics%'
AND rating > 4.0
ORDER BY rating DESC;
--Select the average discounted percentage of products in each category, having more than 10 products:
SELECT category, AVG(discount_percentage) AS avg_discount_percentage
FROM products
GROUP BY category
HAVING COUNT(product_id) > 10;

--UPDATE Statements:
--Update the discounted price of a specific product:
UPDATE products
SET discounted_price = 89.99
WHERE product_id = 'B00KXULGJQ';
--Update the rating of products in a specific category:
UPDATE products
SET rating = 4.8
WHERE category = 'Electronics';



--USERS Table:
--INSERT Statements:
--Insert a new user:
INSERT INTO users (user_id, user_name)
VALUES ('AG1234567890', 'Peter Mazuryk');
INSERT INTO users (user_id, user_name)
VALUES ('AH0987654321', 'Sean Bezerra');

--SELECT Statements:
--Select all users ordered by user_name:
SELECT user_id, user_name
FROM users
ORDER BY user_name ASC;
--Select users with a specific user_id pattern:
SELECT user_id, user_name
FROM users
WHERE user_id LIKE 'AG%'
ORDER BY user_name DESC;

--UPDATE Statements:
--Update the user_name of a specific user:
UPDATE users
SET user_name = 'Johnathan Doe'
WHERE user_id = 'AG1234567890';
--Update the user_name of users with a specific pattern:
UPDATE users
SET user_name = 'Anonymous'
WHERE user_id LIKE 'AH%';






--REVIEWS Table
--INSERT Statements:
--Insert a new review:
INSERT INTO reviews (review_id, review_title, review_content, img_link, product_link, product_id, user_id)
VALUES ('R110CR4AD558XA', 'Very helpful', 'The product is so good', 'https://m.media-amazon.com/images/I/414eE-M+gfL._SY300_SX300_.jpg', 'https://www.amazon.in/Wonderchef-Nutri-Blend-CKM-Jars-Black/dp/B07FL3WRX5/ref=sr_1_204?qid=1672923601&s=kitchen&sr=1-204', 'B07FL3WRX5', 'AEDL3PA6SU7XPRZ3LKDR7XYKZC4A');
INSERT INTO reviews (review_id, review_title, review_content, img_link, product_link, product_id, user_id)
VALUES ('R112HB5700T6SG', 'Good but lack some features', 'Its a good wireless mouse but sometimes lags when I do heavy tasks like video editing.', 'https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/31C+JNS-7PL._SY300_SX300_.jpg', 'https://www.amazon.in/Lenovo-GY50R91293-Wireless-Mouse-Black/dp/B07J2NGB69/ref=sr_1_258?qid=1672903007&s=computers&sr=1-258', 'B07J2NGB69', 'AFHAATSERIT56U7QXWGJIL4MO3KQ');

--SELECT Statements:
--Select all reviews for a specific product, ordered by review_id:
SELECT review_id, review_title, review_content, product_id
FROM reviews
WHERE product_id = 'B07JW9H4J1'
ORDER BY review_title DESC;
--Select the number of reviews for each product, having more than 5 reviews:
SELECT product_id, COUNT(1) AS no_of_reviews
FROM reviews
GROUP BY product_id
HAVING no_of_reviews > 5;

--UPDATE Statements:
--Update the review content of a specific review:
UPDATE reviews
SET review_content = 'This product is fantastic!'
WHERE review_id = 'R110CR4AD558XA';
--Update the review title of reviews for a specific product:
UPDATE reviews
SET review_title = 'Rapid Charge is Great'
WHERE product_id = 'B07JW9H4J1';



--DELETE Statements:
--Delete a specific review:
DELETE FROM reviews
WHERE review_id = 'R110CR4AD558XA';

--Delete all reviews for a specific product:
DELETE FROM reviews
WHERE product_id = 'B07JW9H4J1';


--Delete a specific product:
DELETE FROM products
WHERE product_id = 'B09XYZ1234';
--Delete all products in a specific category:
DELETE FROM products
WHERE category = 'Home Appliances';


--Delete a specific user:
DELETE FROM users
WHERE user_id = 'AG1234567890';
--Delete users with a specific user_id pattern:
DELETE FROM users
WHERE user_id LIKE 'AH%';