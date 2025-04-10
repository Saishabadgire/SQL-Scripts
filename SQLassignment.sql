--assignment 2
--1
CREATE TABLE Customer1 (
    customer_id INT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20)
);   --2
INSERT INTO Customer1 (customer_id,first_name, last_name, email, address, city, state, zip) VALUES 
(1,'John', 'Doe', 'john.doe@gmail.com', 'unique colony', 'New York', 'NY', '10001'),
(2,'Jane', 'Smith', 'jane.smith@gnail..com', 'sunshine colony', 'Los Angeles', 'CA', '90001'),
(3,'Alice', 'Brown', 'alice.brown@gmail.com', 'gelexy building', 'san jose', 'california', '60601'),
(4,'jeni', 'Sword', 'jeni.s@gnail..com', 'moon colony', 'san jose', 'Cl', '34657'),
(5,'rutu','handargule','rutu22@gmail.com','gandhi chowk','beed','maharashtra','43556');

select*from customer1
--3
select first_name,last_name 
from customer
--4

select*
from customer1 
where first_name like 'g%' and city ='san jose';

SELECT *
FROM Customer1
WHERE email LIKE '%@gmail.com';

SELECT * 
FROM Customer1
WHERE last_name NOT LIKE '%A';

--assignment3
--1
CREATE TABLE Orders (
    order_id INT,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    customer_id INT,);
	--2
	INSERT INTO Orders (order_id,order_date, amount, customer_id) VALUES 
(101,'2024-02-20', 250.50, 1),
(102,'2024-02-21', 100.75, 2),
(103,'2024-02-22', 300.00, 1),
(104,'2024-02-23', 450.25, 3),
(105,'2024-02-24', 500.00, 2);

select*from orders

--3
SELECT Customer1.customer_id, Customer1.first_name, Customer1.last_name, Customer1.email, Orders.order_id, Orders.order_date, Orders.amount
FROM Customer1
INNER JOIN Orders ON Customer1.customer_id = Orders.customer_id;

--4
--right join

SELECT Customer1.customer_id, Customer1.first_name, Customer1.last_name, Customer1.email, Orders.order_id, Orders.order_date, Orders.amount
FROM Customer1
RIGHT JOIN Orders ON Customer1.customer_id = Orders.customer_id;

--left join

SELECT Customer1.customer_id, Customer1.first_name, Customer1.last_name, Customer1.email, Orders.order_id, Orders.order_date, Orders.amount
FROM Customer1
left JOIN Orders ON Customer1.customer_id = Orders.customer_id;

--outer join
--5
SELECT Customer1.customer_id, Customer1.first_name, Customer1.last_name, Customer1.email, Orders.order_id, Orders.order_date, Orders.amount
FROM Customer1
left JOIN Orders ON Customer1.customer_id = Orders.customer_id
union
SELECT Customer1.customer_id, Customer1.first_name, Customer1.last_name, Customer1.email, Orders.order_id, Orders.order_date, Orders.amount
FROM Customer1
RIGHT JOIN Orders ON Customer1.customer_id = Orders.customer_id;

--6
UPDATE Orders SET amount = 100 WHERE customer_id = 3;
select*from orders


--assignment 4

create table orders_table
(
order_id int
,customer_name varchar(100)
);
alter table orders_table
add amount int
insert into orders_table(order_id,customer_name,amount)
values (101,'alice',500),
      (102,'bob',1200),
	  (103,'charlie',800),
	  (104,'devid',300),
	  (105,'emma',1500);

	  select*from orders_table

	  create table employee_details1
	  (
	  emp_id int
	  ,emp_name varchar(100)
	  ,emp_salary int
	  );

	  insert into employee_details1(emp_id,emp_name,emp_salary)
	  values(1,'john',50000),
	        (2,'sarah',60000),
			(3,'mike',70000),
			(4,'emma',80000),
			(5,'robert',55000);

			select *from employee_details1

			create table employee_details2
			(
			emp_id int
			,emp_name varchar(100)
			,emp_salary int
			);

			insert into employee_details2(emp_id,emp_name,emp_salary)
			values (3,'mike',70000),
			      (4,'emma',80000),
				  (5,'robert',55000),
				  (6,'jessika',65000),
				  (7,'tom',75000);

				  select*from employee_details2

				  --1
				  SELECT 
    MIN(amount) AS min_amount,
    MAX(amount) AS max_amount,
    AVG(amount) AS avg_amount
FROM orders;

--2
CREATE FUNCTION MultiplyByTen (@num INT)  
RETURNS INT  
AS  
BEGIN  
    RETURN @num * 10;  
END;

--3
SELECT 
    CASE 
        WHEN 100 < 200 THEN '100 is less than 200'
        WHEN 100 > 200 THEN '100 is greater than 200'
        WHEN 100 = 200 THEN '100 is equal to 200'
        ELSE 'Unknown'
    END AS result;

	--4
	SELECT order_id, customer_name, amount,
    CASE 
        WHEN amount >= 1000 THEN 'High Amount'
        WHEN amount BETWEEN 500 AND 999 THEN 'Medium Amount'
        ELSE 'Low Amount'
    END AS amount_status
FROM orders_table;

--5

CREATE FUNCTION GetAmountsGreaterThan (@inputAmount DECIMAL(10,2))  
RETURNS TABLE  
AS  
RETURN  
(  
    SELECT * FROM orders_table WHERE amount > @inputAmount  
);