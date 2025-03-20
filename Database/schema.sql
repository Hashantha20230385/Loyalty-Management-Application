//creating the required tables in PostgreSQL
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    mobile VARCHAR(15),
    address TEXT,
    identification_no VARCHAR(50) UNIQUE,
    points INT DEFAULT 0
);

CREATE TABLE points_structure (
    id SERIAL PRIMARY KEY,
    spend_amount DECIMAL(10,2),
    points_awarded INT
);

INSERT INTO points_structure (spend_amount, points_awarded) VALUES (1.0, 1);

CREATE TABLE tiers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    threshold INT,
    discount DECIMAL(5,2)
);

INSERT INTO tiers (name, threshold, discount) VALUES ('Silver', 200, 5), ('Gold', 500, 10);
