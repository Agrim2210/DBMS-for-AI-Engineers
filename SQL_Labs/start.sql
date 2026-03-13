use learning ;
-- Create table
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
) ;
-- insert data
INSERT INTO customers VALUES(1,"Shivam","Yamunanagar");
INSERT INTO customers VALUES(2,"Rana","Rajasthan");



-- Retrieve Data
SELECT * FROM customers;
/*
Result:

customer_id | name  | city
1  | Shivam | Yamunanagar
2  |  Rana  | Rajasthan


*/