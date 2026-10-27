# Signature Noodle Restaurant Database Management System

A relational database project developed using **Oracle SQL**.

This project focuses on designing and implementing a database management system for **Signature Noodle (SNN)**, a restaurant specializing in Sarawak-style noodles and local Malaysian cuisine.

The system models restaurant operations, including customer orders, menu management, inventory, financial records, cancellations, refunds, and sales reporting.

## Project Overview

The database was designed to support the restaurant's daily operations through structured data storage, relational integrity, and SQL-based reporting.

## Database Structure

The system consists of **17 relational tables**, organized into three categories.

### Core Tables

| Table | Description |
|---|---|
| Staff | Stores restaurant employee information |
| Customer | Stores customer information |
| Category | Categorizes food and beverage menu items |
| Ala_Carte_Menu | Stores individual food menu items |
| Set_Menu | Stores set meals |
| Drinks_Menu | Stores beverages and their prices |

### Transaction Tables

| Table | Description |
|---|---|
| Inventory | Records inventory quantities and restocking |
| Finance | Tracks financial income and expenses |
| Food_Order | Stores customer order information |
| Order_List | Records ordered items and quantities |
| Cancellation | Tracks cancelled orders |
| Refund | Records refund transactions |
| Receipts | Stores payment and receipt details |
| Discount | Stores discount information |

### Associative Tables

| Table | Description |
|---|---|
| Ord_Ala_Carte_Menu | Links food orders to à la carte items |
| Ord_Set_Menu | Links food orders to set meals |
| Ord_Drinks_Menu | Links food orders to beverages |

## Key Database Features

### 1. Relational Database Design
- Database relationships modelled using Crow's Foot notation.
- Primary and foreign keys used to maintain referential integrity.
- Database attributes organized according to 3NF principles.

### 2. Order Management
- Supports dine-in and takeaway orders.
- Records customer orders and assigned staff.
- Associates orders with food and beverage items.
- Tracks order cancellations and refunds.

### 3. Inventory and Financial Management
- Stores ingredient inventory and restocking records.
- Tracks financial transactions.
- Supports financial reporting and analysis.

## SQL Queries and Reports

The project includes **12 SQL queries and reports** designed to extract business insights.

| No. | SQL Report |
|---|---|
| 1 | Customer Loyalty Analysis |
| 2 | Average Order Value by Customer |
| 3 | Total Discount Amount for Each Customer |
| 4 | Top Spending Customers |
| 5 | Top Selling Set Menu Items |
| 6 | Total Number of Orders and Revenue by Staff |
| 7 | Total Revenue by Category for a Given Year |
| 8 | Total Amount of Customer Cancelled Orders |
| 9 | Percentage of Total Revenue Contributed by Each Category |
| 10 | Total Drinks Revenue for a Given Year |
| 11 | Total Number of Takeaway Orders by Month |
| 12 | Total Number of Orders and Spending by Customer |

These reports demonstrate SQL techniques such as multi-table joins, aggregate functions, grouping, filtering, and interactive parameterized queries.

## Running the Project

1. Install or access an Oracle Database environment.
2. Create the database tables using the scripts in `01_tables/`.
3. Execute the INSERT statements in `02_sample_data/` to populate the database.
4. Run the SQL reports in `03_queries/` to explore the data.
