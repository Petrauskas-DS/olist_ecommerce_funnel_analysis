# Olist E-Commerce SQL Analytics Project

A structured SQL analytics project built on the Olist Brazilian e-commerce dataset.  

This project focuses on relational data modeling, business metric construction, and writing production-style analytical queries to extract meaningful insights from transactional data.

---

## Project Objective

To simulate a real-world analytics workflow by:

- Designing and querying a relational database
- Constructing business KPIs from raw transactional tables
- Analyzing revenue, delivery performance, customer behavior, and seller metrics
- Writing clear, reusable SQL using joins, aggregations, CTEs, and window functions

The emphasis is on translating raw data into decision-relevant insights.

---

## Dataset

The project uses the public **Olist E-Commerce Dataset**, which includes:

- Orders
- Customers
- Sellers
- Products
- Payments
- Reviews
- Geolocation data

The dataset mimics a real transactional marketplace environment with multiple relational dependencies.

---

## Database Structure

The database was structured in PostgreSQL with proper relational joins across:

- `orders`
- `order_items`
- `customers`
- `sellers`
- `products`
- `payments`
- `reviews`

Primary and foreign key relationships were used to replicate a real-world warehouse-style structure.

---

## Key Analyses

### Revenue & Sales Metrics
- Total revenue by month
- Revenue by state
- Revenue by seller
- Payment type distribution
- Average order value

### Operational Metrics
- Delivery time (actual vs estimated)
- Late delivery rates
- Shipping performance by region

### Customer Analytics
- Repeat purchase behavior
- Order frequency
- Geographic distribution

### Seller Performance
- Seller revenue ranking
- Volume vs. rating comparison
- Review score impact analysis

---

## Example Query Themes

- Multi-table joins across transactional datasets
- Aggregations with `GROUP BY`
- CTEs for modular query structure
- Window functions for ranking and performance comparisons
- Conditional logic for KPI construction

---

## Skills Demonstrated

- Relational database design
- SQL query optimization and structure
- Business metric definition
- Analytical reasoning from transactional data
- Translating data into performance indicators

---

## Tools

- PostgreSQL
- DBeaver
- SQL

---

## Purpose

This project demonstrates practical SQL analytics in a marketplace setting and reflects the type of structured, KPI-driven querying used in production analytics environments.

It is intended as a portfolio piece showcasing database fluency and business-oriented data analysis.
