# Supply Chain Management & Analytics 

A comprehensive **Supply Chain Analytics project built using Snowflake and SQL** to analyze products, suppliers, customers, warehouses, inventory, orders, shipments, payments, and returns.

The project demonstrates relational database design and advanced SQL techniques to generate meaningful insights into **sales, inventory, supplier performance, customer behavior, order fulfillment, delivery efficiency, payments, and returns**.

## Project Overview

This project simulates an enterprise-level supply chain management system using a structured relational database in Snowflake.

The database consists of **10 interconnected tables** representing different stages of the supply chain lifecycle.

More than **150+ SQL queries** were developed to perform data analysis using joins, aggregations, subqueries, CTEs, window functions, ranking, conditional logic, and date-based analysis.

## Database Tables

| Table | Description |
|---|---|
| `CATEGORIES` | Stores product category information |
| `PRODUCTS` | Contains product, brand, cost, and selling price details |
| `SUPPLIERS` | Stores supplier details and ratings |
| `CUSTOMERS` | Contains customer information and customer types |
| `WAREHOUSES` | Stores warehouse locations and capacity |
| `INVENTORY` | Tracks product stock across warehouses |
| `ORDERS` | Stores order, revenue, customer, supplier, and warehouse details |
| `SHIPMENTS` | Contains shipment and delivery information |
| `PAYMENTS` | Stores payment methods, statuses, and amounts |
| `RETURNS` | Tracks returned orders, reasons, and refund amounts |

## Database Relationships

```text
CATEGORIES
     │
     ▼
 PRODUCTS
     │
     ├──────── INVENTORY ──────── WAREHOUSES
     │
     ▼
   ORDERS
   │  │  │  │
   │  │  │  └──────── CUSTOMERS
   │  │  └──────────── SUPPLIERS
   │  └─────────────── WAREHOUSES
   │
   ├──────── SHIPMENTS
   ├──────── PAYMENTS
   └──────── RETURNS
