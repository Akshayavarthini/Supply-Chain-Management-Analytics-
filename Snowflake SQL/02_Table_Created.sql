USE WAREHOUSE SUPPLY_CHAIN_WH;
USE DATABASE SUPPLY_CHAIN_DB;
USE SCHEMA SCM;

---------------------------------------------------------------
-- 1. CATEGORIES
---------------------------------------------------------------

CREATE OR REPLACE TABLE CATEGORIES
(
    CATEGORY_ID     INT NOT NULL,
    CATEGORY_NAME   VARCHAR(50) NOT NULL,

    CONSTRAINT PK_CATEGORIES PRIMARY KEY (CATEGORY_ID)
);

---------------------------------------------------------------
-- 2. PRODUCTS
---------------------------------------------------------------

CREATE OR REPLACE TABLE PRODUCTS
(
    PRODUCT_ID      INT NOT NULL,
    CATEGORY_ID     INT NOT NULL,
    PRODUCT_NAME    VARCHAR(100),
    BRAND           VARCHAR(50),
    COST_PRICE      NUMBER(10,2),
    SELLING_PRICE   NUMBER(10,2),

    CONSTRAINT PK_PRODUCTS PRIMARY KEY (PRODUCT_ID),

    CONSTRAINT FK_PRODUCTS_CATEGORY
        FOREIGN KEY (CATEGORY_ID)
        REFERENCES CATEGORIES(CATEGORY_ID)
);

---------------------------------------------------------------
-- 3. SUPPLIERS
---------------------------------------------------------------

CREATE OR REPLACE TABLE SUPPLIERS
(
    SUPPLIER_ID     INT NOT NULL,
    SUPPLIER_NAME   VARCHAR(100),
    CITY            VARCHAR(50),
    STATE           VARCHAR(50),
    RATING          INT,

    CONSTRAINT PK_SUPPLIERS PRIMARY KEY (SUPPLIER_ID)
);

---------------------------------------------------------------
-- 4. CUSTOMERS
---------------------------------------------------------------

CREATE OR REPLACE TABLE CUSTOMERS
(
    CUSTOMER_ID     INT NOT NULL,
    CUSTOMER_NAME   VARCHAR(100),
    CITY            VARCHAR(50),
    STATE           VARCHAR(50),
    CUSTOMER_TYPE   VARCHAR(20),

    CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMER_ID)
);

---------------------------------------------------------------
-- 5. WAREHOUSES
---------------------------------------------------------------

CREATE OR REPLACE TABLE WAREHOUSES
(
    WAREHOUSE_ID    INT NOT NULL,
    WAREHOUSE_NAME  VARCHAR(100),
    CITY            VARCHAR(50),
    CAPACITY        INT,

    CONSTRAINT PK_WAREHOUSES PRIMARY KEY (WAREHOUSE_ID)
);

---------------------------------------------------------------
-- 6. INVENTORY
---------------------------------------------------------------

CREATE OR REPLACE TABLE INVENTORY
(
    INVENTORY_ID    INT NOT NULL,
    PRODUCT_ID      INT NOT NULL,
    WAREHOUSE_ID    INT NOT NULL,
    STOCK_QUANTITY  INT,
    REORDER_LEVEL   INT,

    CONSTRAINT PK_INVENTORY PRIMARY KEY (INVENTORY_ID),

    CONSTRAINT FK_INVENTORY_PRODUCT
        FOREIGN KEY (PRODUCT_ID)
        REFERENCES PRODUCTS(PRODUCT_ID),

    CONSTRAINT FK_INVENTORY_WAREHOUSE
        FOREIGN KEY (WAREHOUSE_ID)
        REFERENCES WAREHOUSES(WAREHOUSE_ID)
);

---------------------------------------------------------------
-- 7. ORDERS
---------------------------------------------------------------

CREATE OR REPLACE TABLE ORDERS
(
    ORDER_ID        INT NOT NULL,
    CUSTOMER_ID     INT NOT NULL,
    PRODUCT_ID      INT NOT NULL,
    SUPPLIER_ID     INT NOT NULL,
    WAREHOUSE_ID    INT NOT NULL,

    QUANTITY        INT,
    ORDER_DATE      DATE,
    DELIVERY_DATE   DATE,
    ORDER_STATUS    VARCHAR(20),
    REVENUE         NUMBER(12,2),

    CONSTRAINT PK_ORDERS PRIMARY KEY (ORDER_ID),

    CONSTRAINT FK_ORDERS_CUSTOMER
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMERS(CUSTOMER_ID),

    CONSTRAINT FK_ORDERS_PRODUCT
        FOREIGN KEY (PRODUCT_ID)
        REFERENCES PRODUCTS(PRODUCT_ID),

    CONSTRAINT FK_ORDERS_SUPPLIER
        FOREIGN KEY (SUPPLIER_ID)
        REFERENCES SUPPLIERS(SUPPLIER_ID),

    CONSTRAINT FK_ORDERS_WAREHOUSE
        FOREIGN KEY (WAREHOUSE_ID)
        REFERENCES WAREHOUSES(WAREHOUSE_ID)
);

---------------------------------------------------------------
-- 8. SHIPMENTS
---------------------------------------------------------------

CREATE OR REPLACE TABLE SHIPMENTS
(
    SHIPMENT_ID         INT NOT NULL,
    ORDER_ID            INT NOT NULL,
    SHIPPING_MODE       VARCHAR(20),
    SHIPPING_COST       NUMBER(10,2),
    DELIVERY_STATUS     VARCHAR(20),

    CONSTRAINT PK_SHIPMENTS PRIMARY KEY (SHIPMENT_ID),

    CONSTRAINT FK_SHIPMENTS_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID)
);

---------------------------------------------------------------
-- 9. PAYMENTS
---------------------------------------------------------------

CREATE OR REPLACE TABLE PAYMENTS
(
    PAYMENT_ID          INT NOT NULL,
    ORDER_ID            INT NOT NULL,
    PAYMENT_METHOD      VARCHAR(30),
    PAYMENT_STATUS      VARCHAR(20),
    AMOUNT              NUMBER(12,2),

    CONSTRAINT PK_PAYMENTS PRIMARY KEY (PAYMENT_ID),

    CONSTRAINT FK_PAYMENTS_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID)
);

---------------------------------------------------------------
-- 10. RETURNS
---------------------------------------------------------------

CREATE OR REPLACE TABLE RETURNS
(
    RETURN_ID           INT NOT NULL,
    ORDER_ID            INT NOT NULL,
    RETURN_REASON       VARCHAR(100),
    REFUND_AMOUNT       NUMBER(12,2),

    CONSTRAINT PK_RETURNS PRIMARY KEY (RETURN_ID),

    CONSTRAINT FK_RETURNS_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID)
);



SHOW TABLES;