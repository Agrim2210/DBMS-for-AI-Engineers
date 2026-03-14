use  e_commerce;

-- Stores customer information
CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

--Stores Products catalog
CREATE TABLE products(
    product_id INT AUTO_INCREMENT PRIMARY KEY ,
    product_name VARCHAR(150),
    price DECIMAL(10,2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Stores order placed by customers (customers->orders)
CREATE TABLE orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY ,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    Foreign Key (customer_id) REFERENCES customers(customer_id)
);

-- Handles many-to-many relationship between orders and products.
CREATE TABLE order_items(
    order_items_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT ,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    Foreign Key (order_id) REFERENCES orders(order_id),
    Foreign Key (product_id) REFERENCES products(product_id)
    

);

-- Tracks Payments for orders
CREATE Table payment(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_time  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

/*
FINAL DATABASE SCHEMA :

customers
    │
    │ customer_id
    │
orders
    │
    │ order_id
    │
order_items
    │
    ├── product_id
    │
products

orders
   │
   └── payments
*/
