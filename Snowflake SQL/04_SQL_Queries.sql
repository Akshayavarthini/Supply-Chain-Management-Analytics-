USE WAREHOUSE SUPPLY_CHAIN_WH;
USE DATABASE SUPPLY_CHAIN_DB;
USE SCHEMA SCM;


-- SECTION 1 : BASIC SELECT

--1. Display all records from the CATEGORIES table.
SELECT * FROM Categories;
--2. Display all records from the PRODUCTS table.
SELECT * FROM Products;
--3. Display all records from the SUPPLIERS table.
SELECT * FROM Suppliers;
--4. Display all records from the CUSTOMERS table.
SELECT * FROM Customers;
--5. Display all records from the WAREHOUSES table.
SELECT * FROM Warehouses;
--6. Display all records from the INVENTORY table.
SELECT * FROM Inventory;
--7. Display all records from the ORDERS table.
SELECT * FROM Orders;
--8. Display all records from the SHIPMENTS table.
SELECT * FROM Shipments;
--9. Display all records from the PAYMENTS table.
SELECT * FROM Payments;
--10. Display all records from the RETURNS table.
SELECT * FROM Returns;


/*=========================================================
SECTION 2 : SELECT SPECIFIC COLUMNS
=========================================================*/

-- Display PRODUCT_NAME and SELLING_PRICE from the PRODUCTS table.
SELECT PRODUCT_NAME, SELLING_PRICE
FROM PRODUCTS;

-- Display CUSTOMER_NAME and CITY from the CUSTOMERS table.
SELECT CUSTOMER_NAME, CITY
FROM CUSTOMERS;

-- Display SUPPLIER_NAME and RATING from the SUPPLIERS table.
SELECT SUPPLIER_NAME, RATING
FROM SUPPLIERS;

-- Display ORDER_ID, ORDER_DATE and REVENUE from the ORDERS table.
SELECT ORDER_ID, ORDER_DATE, REVENUE
FROM ORDERS;

-- Display WAREHOUSE_NAME and CAPACITY from the WAREHOUSES table.
SELECT WAREHOUSE_NAME, CAPACITY
FROM WAREHOUSES;


/*=========================================================
SECTION 3 : WHERE CLAUSE
=========================================================*/

-- Display products whose SELLING_PRICE is greater than 30000.
SELECT *
FROM PRODUCTS
WHERE SELLING_PRICE > 30000;

-- Display products whose COST_PRICE is less than 10000.
SELECT *
FROM PRODUCTS
WHERE COST_PRICE < 10000;

-- Display customers who belong to Chennai.
SELECT *
FROM CUSTOMERS
WHERE CITY = 'Chennai';

-- Display suppliers whose rating is equal to 5.
SELECT *
FROM SUPPLIERS
WHERE RATING = 5;

-- Display warehouses whose capacity is greater than 25000.
SELECT *
FROM WAREHOUSES
WHERE CAPACITY > 25000;

-- Display inventory items whose STOCK_QUANTITY is less than 100.
SELECT *
FROM INVENTORY
WHERE STOCK_QUANTITY < 100;

-- Display all delivered orders.
SELECT *
FROM ORDERS
WHERE ORDER_STATUS = 'Delivered';

-- Display all cancelled orders.
SELECT *
FROM ORDERS
WHERE ORDER_STATUS = 'Cancelled';

-- Display all pending payments.
SELECT *
FROM PAYMENTS
WHERE PAYMENT_STATUS = 'Pending';

-- Display returns where REFUND_AMOUNT is greater than 20000.
SELECT *
FROM RETURNS
WHERE REFUND_AMOUNT > 20000;


/*=========================================================
SECTION 4 : OPERATORS
=========================================================*/

-- Display orders whose revenue is between 10000 and 50000.
SELECT *
FROM ORDERS
WHERE REVENUE BETWEEN 10000 AND 50000;

-- Display products whose selling price is NOT between 20000 and 40000.
SELECT *
FROM PRODUCTS
WHERE SELLING_PRICE NOT BETWEEN 20000 AND 40000;

-- Display customers who belong to Chennai or Bengaluru.
SELECT *
FROM CUSTOMERS
WHERE CITY IN ('Chennai', 'Bengaluru');

-- Display suppliers who are NOT located in Chennai.
SELECT *
FROM SUPPLIERS
WHERE CITY <> 'Chennai';

-- Display products that belong to Category IDs 1, 3 and 5.
SELECT *
FROM PRODUCTS
WHERE CATEGORY_ID IN (1, 3, 5);

-- Display customers whose names start with the letter 'A'.
SELECT *
FROM CUSTOMERS
WHERE CUSTOMER_NAME LIKE 'A%';

-- Display suppliers whose names end with 'Ltd'.
SELECT *
FROM SUPPLIERS
WHERE SUPPLIER_NAME LIKE '%Ltd';

-- Display products whose brand contains the letter 'S'.
SELECT *
FROM PRODUCTS
WHERE BRAND LIKE '%S%';

-- Display orders whose status is NOT 'Delivered'.
SELECT *
FROM ORDERS
WHERE ORDER_STATUS <> 'Delivered';

-- Display payments made using UPI or Credit Card.
SELECT *
FROM PAYMENTS
WHERE PAYMENT_METHOD IN ('UPI', 'Credit Card');


/*=========================================================
SECTION 5 : ORDER BY & LIMIT
=========================================================*/

-- Display the Top 10 most expensive products.
SELECT *
FROM PRODUCTS
ORDER BY SELLING_PRICE DESC
LIMIT 10;

-- Display the Top 10 cheapest products.
SELECT *
FROM PRODUCTS
ORDER BY SELLING_PRICE ASC
LIMIT 10;

-- Display the Top 20 highest revenue orders.
SELECT *
FROM ORDERS
ORDER BY REVENUE DESC
LIMIT 20;

-- Display the latest 20 orders.
SELECT *
FROM ORDERS
ORDER BY ORDER_DATE DESC
LIMIT 20;

-- Display the oldest 20 orders.
SELECT *
FROM ORDERS
ORDER BY ORDER_DATE ASC
LIMIT 20;

-- Display warehouses in descending order of capacity.
SELECT *
FROM WAREHOUSES
ORDER BY CAPACITY DESC;

-- Display suppliers in descending order of rating.
SELECT *
FROM SUPPLIERS
ORDER BY RATING DESC;

-- Display inventory records in ascending order of stock quantity.
SELECT *
FROM INVENTORY
ORDER BY STOCK_QUANTITY ASC;

-- Display the Top 10 highest shipping costs.
SELECT *
FROM SHIPMENTS
ORDER BY SHIPPING_COST DESC
LIMIT 10;

-- Display the Top 15 highest payment amounts.
SELECT *
FROM PAYMENTS
ORDER BY AMOUNT DESC
LIMIT 15;


/*=========================================================
SECTION 6 : AGGREGATE FUNCTIONS
=========================================================*/

-- Find the total number of customers.
SELECT COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMERS;

-- Find the total number of products.
SELECT COUNT(*) AS TOTAL_PRODUCTS
FROM PRODUCTS;

-- Find the total number of orders.
SELECT COUNT(*) AS TOTAL_ORDERS
FROM ORDERS;

-- Calculate the total revenue generated from all orders.
SELECT SUM(REVENUE) AS TOTAL_REVENUE
FROM ORDERS;

-- Find the maximum, minimum and average shipping cost.
SELECT
    MAX(SHIPPING_COST) AS MAX_SHIPPING_COST,
    MIN(SHIPPING_COST) AS MIN_SHIPPING_COST,
    AVG(SHIPPING_COST) AS AVG_SHIPPING_COST
FROM SHIPMENTS;

/*=========================================================
SECTION 7 : GROUP BY
=========================================================*/

-- Count the number of products available in each category.
SELECT CATEGORY_ID, COUNT(*) AS TOTAL_PRODUCTS
FROM PRODUCTS
GROUP BY CATEGORY_ID;

-- Calculate the total revenue generated by each warehouse.
SELECT WAREHOUSE_ID, SUM(REVENUE) AS TOTAL_REVENUE
FROM ORDERS
GROUP BY WAREHOUSE_ID;

-- Find the total number of orders placed by each customer.
SELECT CUSTOMER_ID, COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY CUSTOMER_ID;

-- Calculate the average selling price for each category.
SELECT CATEGORY_ID, AVG(SELLING_PRICE) AS AVG_SELLING_PRICE
FROM PRODUCTS
GROUP BY CATEGORY_ID;

-- Count the number of suppliers in each city.
SELECT CITY, COUNT(*) AS TOTAL_SUPPLIERS
FROM SUPPLIERS
GROUP BY CITY;

-- Find the total stock quantity available in each warehouse.
SELECT WAREHOUSE_ID, SUM(STOCK_QUANTITY) AS TOTAL_STOCK
FROM INVENTORY
GROUP BY WAREHOUSE_ID;

-- Calculate the total payment amount for each payment method.
SELECT PAYMENT_METHOD, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY PAYMENT_METHOD;

-- Count the number of orders for each order status.
SELECT ORDER_STATUS, COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY ORDER_STATUS;

-- Find the total refund amount for each return reason.
SELECT RETURN_REASON, SUM(REFUND_AMOUNT) AS TOTAL_REFUND
FROM RETURNS
GROUP BY RETURN_REASON;

-- Calculate the average supplier rating for each state.
SELECT STATE, AVG(RATING) AS AVG_RATING
FROM SUPPLIERS
GROUP BY STATE;


/*=========================================================
SECTION 8 : HAVING
=========================================================*/

-- Display categories having more than 20 products.
SELECT CATEGORY_ID, COUNT(*) AS TOTAL_PRODUCTS
FROM PRODUCTS
GROUP BY CATEGORY_ID
HAVING COUNT(*) > 20;

-- Display customers who have placed more than 10 orders.
SELECT CUSTOMER_ID, COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 10;

-- Display warehouses having a total stock quantity greater than 10,000.
SELECT WAREHOUSE_ID, SUM(STOCK_QUANTITY) AS TOTAL_STOCK
FROM INVENTORY
GROUP BY WAREHOUSE_ID
HAVING SUM(STOCK_QUANTITY) > 10000;

-- Display cities having more than 10 suppliers.
SELECT CITY, COUNT(*) AS TOTAL_SUPPLIERS
FROM SUPPLIERS
GROUP BY CITY
HAVING COUNT(*) > 10;

-- Display payment methods whose total transaction amount is greater than ₹10,00,000.
SELECT PAYMENT_METHOD, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENTS
GROUP BY PAYMENT_METHOD
HAVING SUM(AMOUNT) > 1000000;


/*=========================================================
SECTION 9 : STRING FUNCTIONS
=========================================================*/

-- Display all customer names in uppercase.
SELECT UPPER(CUSTOMER_NAME) AS CUSTOMER_NAME
FROM CUSTOMERS;

-- Display all supplier names in lowercase.
SELECT LOWER(SUPPLIER_NAME) AS SUPPLIER_NAME
FROM SUPPLIERS;

-- Display the length of every product name.
SELECT PRODUCT_NAME,
       LENGTH(PRODUCT_NAME) AS NAME_LENGTH
FROM PRODUCTS;

-- Display the first five characters of each customer name.
SELECT CUSTOMER_NAME,
       SUBSTRING(CUSTOMER_NAME,1,5) AS FIRST_FIVE_CHARACTERS
FROM CUSTOMERS;

-- Concatenate customer name and city into one column.
SELECT CONCAT(CUSTOMER_NAME,' - ',CITY) AS CUSTOMER_DETAILS
FROM CUSTOMERS;

-- Remove leading and trailing spaces from supplier names.
SELECT TRIM(SUPPLIER_NAME) AS SUPPLIER_NAME
FROM SUPPLIERS;

-- Replace the word 'Warehouse' with 'Storage Hub' in warehouse names.
SELECT REPLACE(WAREHOUSE_NAME,'Warehouse','Storage Hub') AS WAREHOUSE_NAME
FROM WAREHOUSES;

-- Display the first three letters of each product brand.
SELECT BRAND,
       LEFT(BRAND,3) AS BRAND_CODE
FROM PRODUCTS;

-- Find the position of the letter 'A' in each customer name.
SELECT CUSTOMER_NAME,
       POSITION('A' IN UPPER(CUSTOMER_NAME)) AS POSITION_OF_A
FROM CUSTOMERS;

-- Display customer names in reverse alphabetical order.
SELECT CUSTOMER_NAME
FROM CUSTOMERS
ORDER BY CUSTOMER_NAME DESC;


/*=========================================================
SECTION 10 : DATE FUNCTIONS
=========================================================*/

-- Display the year in which each order was placed.
SELECT ORDER_ID,
       YEAR(ORDER_DATE) AS ORDER_YEAR
FROM ORDERS;

-- Display the month in which each order was placed.
SELECT ORDER_ID,
       MONTH(ORDER_DATE) AS ORDER_MONTH
FROM ORDERS;

-- Display the day of the month for every order.
SELECT ORDER_ID,
       DAY(ORDER_DATE) AS ORDER_DAY
FROM ORDERS;

-- Count the number of orders placed in each month.
SELECT MONTH(ORDER_DATE) AS ORDER_MONTH,
       COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY MONTH(ORDER_DATE)
ORDER BY ORDER_MONTH;

-- Calculate the total revenue generated in each year.
SELECT YEAR(ORDER_DATE) AS ORDER_YEAR,
       SUM(REVENUE) AS TOTAL_REVENUE
FROM ORDERS
GROUP BY YEAR(ORDER_DATE)
ORDER BY ORDER_YEAR;

-- Calculate the delivery time (in days) for every order.
SELECT ORDER_ID,
       ORDER_DATE,
       DELIVERY_DATE,
       DATEDIFF(DAY, ORDER_DATE, DELIVERY_DATE) AS DELIVERY_DAYS
FROM ORDERS;

-- Display orders delivered within 5 days.
SELECT *
FROM ORDERS
WHERE DATEDIFF(DAY, ORDER_DATE, DELIVERY_DATE) <= 5;

-- Display orders placed during January.
SELECT *
FROM ORDERS
WHERE MONTH(ORDER_DATE) = 1;

-- Display the current system date.
SELECT CURRENT_DATE();

-- Find the earliest and latest order dates.
SELECT MIN(ORDER_DATE) AS EARLIEST_ORDER_DATE,
       MAX(ORDER_DATE) AS LATEST_ORDER_DATE
FROM ORDERS;


/*=========================================================
SECTION 11 : CASE STATEMENT
=========================================================*/

-- Categorize products as Low Price, Medium Price and High Price.
SELECT PRODUCT_NAME,
       SELLING_PRICE,
       CASE
            WHEN SELLING_PRICE < 10000 THEN 'Low Price'
            WHEN SELLING_PRICE BETWEEN 10000 AND 30000 THEN 'Medium Price'
            ELSE 'High Price'
       END AS PRICE_CATEGORY
FROM PRODUCTS;

-- Categorize warehouses as Small, Medium and Large based on capacity.
SELECT WAREHOUSE_NAME,
       CAPACITY,
       CASE
            WHEN CAPACITY < 10000 THEN 'Small'
            WHEN CAPACITY BETWEEN 10000 AND 20000 THEN 'Medium'
            ELSE 'Large'
       END AS WAREHOUSE_SIZE
FROM WAREHOUSES;

-- Display payment status with a custom message using CASE.
SELECT PAYMENT_ID,
       PAYMENT_STATUS,
       CASE
            WHEN PAYMENT_STATUS='Paid' THEN 'Payment Completed'
            WHEN PAYMENT_STATUS='Pending' THEN 'Payment Pending'
            ELSE 'Payment Failed'
       END AS STATUS_MESSAGE
FROM PAYMENTS;

-- Categorize suppliers as Excellent, Good, Average or Poor based on rating.
SELECT SUPPLIER_NAME,
       RATING,
       CASE
            WHEN RATING=5 THEN 'Excellent'
            WHEN RATING=4 THEN 'Good'
            WHEN RATING=3 THEN 'Average'
            ELSE 'Poor'
       END AS SUPPLIER_CATEGORY
FROM SUPPLIERS;

-- Categorize orders as High Revenue or Low Revenue.
SELECT ORDER_ID,
       REVENUE,
       CASE
            WHEN REVENUE >= 50000 THEN 'High Revenue'
            ELSE 'Low Revenue'
       END AS REVENUE_CATEGORY
FROM ORDERS;


/*=========================================================
SECTION 12 : INNER JOIN
=========================================================*/

-- Display order details along with customer names.
SELECT O.ORDER_ID,
       C.CUSTOMER_NAME,
       O.ORDER_DATE,
       O.REVENUE
FROM ORDERS O
INNER JOIN CUSTOMERS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID;

-- Display product names along with their category names.
SELECT P.PRODUCT_NAME,
       C.CATEGORY_NAME,
       P.SELLING_PRICE
FROM PRODUCTS P
INNER JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID;

-- Display orders along with supplier details.
SELECT O.ORDER_ID,
       S.SUPPLIER_NAME,
       S.CITY,
       O.REVENUE
FROM ORDERS O
INNER JOIN SUPPLIERS S
ON O.SUPPLIER_ID = S.SUPPLIER_ID;

-- Display inventory details along with warehouse names.
SELECT I.INVENTORY_ID,
       W.WAREHOUSE_NAME,
       I.STOCK_QUANTITY
FROM INVENTORY I
INNER JOIN WAREHOUSES W
ON I.WAREHOUSE_ID = W.WAREHOUSE_ID;

-- Display payment details along with order details.
SELECT P.PAYMENT_ID,
       O.ORDER_ID,
       O.ORDER_DATE,
       P.AMOUNT,
       P.PAYMENT_STATUS
FROM PAYMENTS P
INNER JOIN ORDERS O
ON P.ORDER_ID = O.ORDER_ID;


/*=========================================================
SECTION 13 : LEFT JOIN
=========================================================*/

-- Display all customers along with their orders, including customers without orders.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       O.ORDER_ID,
       O.ORDER_DATE
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- Display all products along with inventory details, including products not available in inventory.
SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       I.STOCK_QUANTITY
FROM PRODUCTS P
LEFT JOIN INVENTORY I
ON P.PRODUCT_ID = I.PRODUCT_ID;

-- Display all orders along with return details, including orders that were not returned.
SELECT O.ORDER_ID,
       O.ORDER_DATE,
       R.RETURN_ID,
       R.REFUND_AMOUNT
FROM ORDERS O
LEFT JOIN RETURNS R
ON O.ORDER_ID = R.ORDER_ID;


/*=========================================================
SECTION 14 : RIGHT JOIN & CROSS JOIN
=========================================================*/

-- Display all warehouses and their inventory using RIGHT JOIN.
SELECT W.WAREHOUSE_ID,
       W.WAREHOUSE_NAME,
       I.INVENTORY_ID,
       I.STOCK_QUANTITY
FROM INVENTORY I
RIGHT JOIN WAREHOUSES W
ON I.WAREHOUSE_ID = W.WAREHOUSE_ID;

-- Generate every possible combination of products and warehouses using CROSS JOIN.
SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       W.WAREHOUSE_ID,
       W.WAREHOUSE_NAME
FROM PRODUCTS P
CROSS JOIN WAREHOUSES W;

/*=========================================================
SECTION 15 : SELF JOIN
=========================================================*/

-- Display products that belong to the same category using a SELF JOIN.
SELECT
    P1.PRODUCT_ID,
    P1.PRODUCT_NAME,
    P2.PRODUCT_ID,
    P2.PRODUCT_NAME,
    P1.CATEGORY_ID
FROM PRODUCTS P1
JOIN PRODUCTS P2
ON P1.CATEGORY_ID = P2.CATEGORY_ID
AND P1.PRODUCT_ID <> P2.PRODUCT_ID;

-----------------------------------------------------------

-- Find customers who belong to the same city using a SELF JOIN.
SELECT
    C1.CUSTOMER_ID,
    C1.CUSTOMER_NAME,
    C2.CUSTOMER_ID,
    C2.CUSTOMER_NAME,
    C1.CITY
FROM CUSTOMERS C1
JOIN CUSTOMERS C2
ON C1.CITY = C2.CITY
AND C1.CUSTOMER_ID <> C2.CUSTOMER_ID;

-----------------------------------------------------------

-- Find warehouses located in the same city using a SELF JOIN.
SELECT
    W1.WAREHOUSE_ID,
    W1.WAREHOUSE_NAME,
    W2.WAREHOUSE_ID,
    W2.WAREHOUSE_NAME,
    W1.CITY
FROM WAREHOUSES W1
JOIN WAREHOUSES W2
ON W1.CITY = W2.CITY
AND W1.WAREHOUSE_ID <> W2.WAREHOUSE_ID;

/*=========================================================
SECTION 16 : SUBQUERIES
=========================================================*/

-- Display products whose selling price is greater than the average selling price.
SELECT *
FROM PRODUCTS
WHERE SELLING_PRICE >
(
    SELECT AVG(SELLING_PRICE)
    FROM PRODUCTS
);

-----------------------------------------------------------

-- Display customers who placed orders with revenue greater than the average order revenue.
SELECT DISTINCT C.*
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.REVENUE >
(
    SELECT AVG(REVENUE)
    FROM ORDERS
);

-----------------------------------------------------------

-- Find suppliers whose rating is higher than the average supplier rating.
SELECT *
FROM SUPPLIERS
WHERE RATING >
(
    SELECT AVG(RATING)
    FROM SUPPLIERS
);

-----------------------------------------------------------

-- Display warehouses whose capacity is greater than the average warehouse capacity.
SELECT *
FROM WAREHOUSES
WHERE CAPACITY >
(
    SELECT AVG(CAPACITY)
    FROM WAREHOUSES
);

-----------------------------------------------------------

-- Find orders having the maximum revenue.
SELECT *
FROM ORDERS
WHERE REVENUE =
(
    SELECT MAX(REVENUE)
    FROM ORDERS
);

-----------------------------------------------------------

-- Display products having the minimum cost price.
SELECT *
FROM PRODUCTS
WHERE COST_PRICE =
(
    SELECT MIN(COST_PRICE)
    FROM PRODUCTS
);

-- Display products that have never been ordered.
SELECT *
FROM PRODUCTS
WHERE PRODUCT_ID NOT IN
(
    SELECT PRODUCT_ID
    FROM ORDERS
);

-----------------------------------------------------------

-- Display suppliers who have never supplied any orders.
SELECT *
FROM SUPPLIERS
WHERE SUPPLIER_ID NOT IN
(
    SELECT SUPPLIER_ID
    FROM ORDERS
);

-----------------------------------------------------------

-- Display customers who have never placed any orders.
SELECT *
FROM CUSTOMERS
WHERE CUSTOMER_ID NOT IN
(
    SELECT CUSTOMER_ID
    FROM ORDERS
);

/*=========================================================
SECTION 17 : CORRELATED SUBQUERIES
=========================================================*/

-- Display customers whose total spending is greater than the average spending of all customers.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME
FROM CUSTOMERS C
WHERE
(
    SELECT SUM(O.REVENUE)
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
)
>
(
    SELECT AVG(TOTAL_REVENUE)
    FROM
    (
        SELECT SUM(REVENUE) AS TOTAL_REVENUE
        FROM ORDERS
        GROUP BY CUSTOMER_ID
    )
);

-----------------------------------------------------------

-- Find products whose selling price is higher than the average selling price within their category.
SELECT *
FROM PRODUCTS P
WHERE SELLING_PRICE >
(
    SELECT AVG(SELLING_PRICE)
    FROM PRODUCTS
    WHERE CATEGORY_ID = P.CATEGORY_ID
);

-----------------------------------------------------------

-- Display suppliers whose rating is higher than the average rating of suppliers in the same state.
SELECT *
FROM SUPPLIERS S
WHERE RATING >
(
    SELECT AVG(RATING)
    FROM SUPPLIERS
    WHERE STATE = S.STATE
);

-----------------------------------------------------------

-- Find warehouses having stock quantity greater than the average stock quantity of all warehouses.
SELECT WAREHOUSE_ID,
       SUM(STOCK_QUANTITY) AS TOTAL_STOCK
FROM INVENTORY
GROUP BY WAREHOUSE_ID
HAVING SUM(STOCK_QUANTITY) >
(
    SELECT AVG(TOTAL_STOCK)
    FROM
    (
        SELECT SUM(STOCK_QUANTITY) AS TOTAL_STOCK
        FROM INVENTORY
        GROUP BY WAREHOUSE_ID
    )
);

-----------------------------------------------------------

-- Display customers whose order count is greater than the average number of orders placed by customers.
SELECT CUSTOMER_ID,
       COUNT(*) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) >
(
    SELECT AVG(ORDER_COUNT)
    FROM
    (
        SELECT COUNT(*) AS ORDER_COUNT
        FROM ORDERS
        GROUP BY CUSTOMER_ID
    )
);

/*=========================================================
SECTION 18 : EXISTS / NOT EXISTS
=========================================================*/

-- Display customers who have placed at least one order using EXISTS.
SELECT *
FROM CUSTOMERS C
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);

-----------------------------------------------------------

-- Display customers who have never placed an order using NOT EXISTS.
SELECT *
FROM CUSTOMERS C
WHERE NOT EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
);

/*=========================================================
SECTION 18 : EXISTS / NOT EXISTS
=========================================================*/

-- Display products that exist in the INVENTORY table using EXISTS.
SELECT *
FROM PRODUCTS P
WHERE EXISTS
(
    SELECT 1
    FROM INVENTORY I
    WHERE I.PRODUCT_ID = P.PRODUCT_ID
);

-----------------------------------------------------------

-- Display products that do not exist in the INVENTORY table using NOT EXISTS.
SELECT *
FROM PRODUCTS P
WHERE NOT EXISTS
(
    SELECT 1
    FROM INVENTORY I
    WHERE I.PRODUCT_ID = P.PRODUCT_ID
);

-----------------------------------------------------------

-- Display suppliers who have supplied at least one order using EXISTS.
SELECT *
FROM SUPPLIERS S
WHERE EXISTS
(
    SELECT 1
    FROM ORDERS O
    WHERE O.SUPPLIER_ID = S.SUPPLIER_ID
);

/*=========================================================
SECTION 19 : COMMON TABLE EXPRESSIONS (CTE)
=========================================================*/

-- Use a CTE to display the Top 10 highest revenue orders.
WITH TOP_ORDERS AS
(
    SELECT *
    FROM ORDERS
    ORDER BY REVENUE DESC
    LIMIT 10
)
SELECT *
FROM TOP_ORDERS;

-----------------------------------------------------------

-- Use a CTE to calculate total revenue generated by each customer.
WITH CUSTOMER_REVENUE AS
(
    SELECT
        CUSTOMER_ID,
        SUM(REVENUE) AS TOTAL_REVENUE
    FROM ORDERS
    GROUP BY CUSTOMER_ID
)
SELECT *
FROM CUSTOMER_REVENUE
ORDER BY TOTAL_REVENUE DESC;

-----------------------------------------------------------

-- Use a CTE to display warehouse-wise total stock quantity.
WITH WAREHOUSE_STOCK AS
(
    SELECT
        WAREHOUSE_ID,
        SUM(STOCK_QUANTITY) AS TOTAL_STOCK
    FROM INVENTORY
    GROUP BY WAREHOUSE_ID
)
SELECT *
FROM WAREHOUSE_STOCK
ORDER BY TOTAL_STOCK DESC;

-----------------------------------------------------------

-- Use a CTE to calculate category-wise average selling price.
WITH CATEGORY_PRICE AS
(
    SELECT
        CATEGORY_ID,
        AVG(SELLING_PRICE) AS AVG_PRICE
    FROM PRODUCTS
    GROUP BY CATEGORY_ID
)
SELECT *
FROM CATEGORY_PRICE
ORDER BY CATEGORY_ID;

-----------------------------------------------------------

-- Use a CTE to display suppliers with a rating greater than 4.
WITH HIGH_RATED_SUPPLIERS AS
(
    SELECT *
    FROM SUPPLIERS
    WHERE RATING > 4
)
SELECT *
FROM HIGH_RATED_SUPPLIERS;

-----------------------------------------------------------

-- Use a CTE to calculate monthly revenue.
WITH MONTHLY_REVENUE AS
(
    SELECT
        MONTH(ORDER_DATE) AS ORDER_MONTH,
        SUM(REVENUE) AS TOTAL_REVENUE
    FROM ORDERS
    GROUP BY MONTH(ORDER_DATE)
)
SELECT *
FROM MONTHLY_REVENUE
ORDER BY ORDER_MONTH;

-----------------------------------------------------------

-- Use a CTE to display customers whose total spending exceeds ₹1,00,000.
WITH CUSTOMER_SPENDING AS
(
    SELECT
        CUSTOMER_ID,
        SUM(REVENUE) AS TOTAL_SPENDING
    FROM ORDERS
    GROUP BY CUSTOMER_ID
)
SELECT *
FROM CUSTOMER_SPENDING
WHERE TOTAL_SPENDING > 100000;

/*=========================================================
SECTION 20 : WINDOW FUNCTIONS
=========================================================*/

-- Assign a ROW_NUMBER to each order based on revenue in descending order.
SELECT
    ORDER_ID,
    CUSTOMER_ID,
    REVENUE,
    ROW_NUMBER() OVER(ORDER BY REVENUE DESC) AS ROW_NUM
FROM ORDERS;

-----------------------------------------------------------

-- Rank products based on selling price using RANK().
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    SELLING_PRICE,
    RANK() OVER(ORDER BY SELLING_PRICE DESC) AS PRODUCT_RANK
FROM PRODUCTS;

-----------------------------------------------------------

-- Find the DENSE_RANK of suppliers based on rating.
SELECT
    SUPPLIER_ID,
    SUPPLIER_NAME,
    RATING,
    DENSE_RANK() OVER(ORDER BY RATING DESC) AS SUPPLIER_RANK
FROM SUPPLIERS;

-----------------------------------------------------------

-- Display the Top 3 highest revenue orders using RANK().
SELECT *
FROM
(
    SELECT
        ORDER_ID,
        CUSTOMER_ID,
        REVENUE,
        RANK() OVER(ORDER BY REVENUE DESC) AS RANK_NO
    FROM ORDERS
)
WHERE RANK_NO <= 3;

-----------------------------------------------------------

-- Display the previous order revenue using LAG().
SELECT
    ORDER_ID,
    ORDER_DATE,
    REVENUE,
    LAG(REVENUE) OVER(ORDER BY ORDER_DATE) AS PREVIOUS_REVENUE
FROM ORDERS;

-----------------------------------------------------------

-- Display the next order revenue using LEAD().
SELECT
    ORDER_ID,
    ORDER_DATE,
    REVENUE,
    LEAD(REVENUE) OVER(ORDER BY ORDER_DATE) AS NEXT_REVENUE
FROM ORDERS;

-----------------------------------------------------------

-- Display the first order placed by each customer using FIRST_VALUE().
SELECT
    CUSTOMER_ID,
    ORDER_ID,
    ORDER_DATE,
    FIRST_VALUE(ORDER_ID) OVER
    (
        PARTITION BY CUSTOMER_ID
        ORDER BY ORDER_DATE
    ) AS FIRST_ORDER
FROM ORDERS;

-----------------------------------------------------------

-- Display the latest order placed by each customer using LAST_VALUE().
SELECT
    CUSTOMER_ID,
    ORDER_ID,
    ORDER_DATE,
    LAST_VALUE(ORDER_ID) OVER
    (
        PARTITION BY CUSTOMER_ID
        ORDER BY ORDER_DATE
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LAST_ORDER
FROM ORDERS;

-----------------------------------------------------------

-- Divide customers into four groups based on total spending using NTILE(4).
SELECT
    CUSTOMER_ID,
    TOTAL_SPENDING,
    NTILE(4) OVER(ORDER BY TOTAL_SPENDING DESC) AS CUSTOMER_GROUP
FROM
(
    SELECT
        CUSTOMER_ID,
        SUM(REVENUE) AS TOTAL_SPENDING
    FROM ORDERS
    GROUP BY CUSTOMER_ID
);

-----------------------------------------------------------

-- Calculate the running total revenue using SUM() OVER().
SELECT
    ORDER_ID,
    ORDER_DATE,
    REVENUE,
    SUM(REVENUE) OVER
    (
        ORDER BY ORDER_DATE
    ) AS RUNNING_TOTAL_REVENUE
FROM ORDERS;