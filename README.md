# SQL Sales Analytics — Company Sales Performance

## 📊 Project Overview

This project is part of my **DecodeLabs Data Analytics Internship** and focuses on using **SQL to transform a cleaned company sales dataset into meaningful business insights**.

The dataset contains **1,200 sales orders** covering multiple products, customers, order statuses, payment methods, referral sources, and coupon usage.

The objective of this phase was not simply to write SQL queries, but to use SQL to answer practical business questions around **sales performance, customer behaviour, product performance, operations, and marketing effectiveness**.

---

## 🎯 Business Objectives

The analysis was designed to answer questions such as:

* How much revenue is being generated?
* What is the average order value?
* How are sales changing over time?
* Which products generate the most revenue?
* How many customers return to make additional purchases?
* What proportion of orders are cancelled or returned?
* Which referral sources generate the most revenue?
* How effective are coupons?
* Where are the major opportunities and operational concerns?
* Are there patterns in the data that require further investigation?

---

## 🗂️ Dataset

The dataset contains **1,200 orders** and the following fields:

| Column            | Description                                    |
| ----------------- | ---------------------------------------------- |
| `OrderID`         | Unique identifier for each order               |
| `Date`            | Order date                                     |
| `CustomerID`      | Customer identifier                            |
| `Product`         | Product purchased                              |
| `Quantity`        | Number of units purchased                      |
| `UnitPrice`       | Price per unit                                 |
| `ShippingAddress` | Customer shipping address                      |
| `PaymentMethod`   | Payment method used                            |
| `OrderStatus`     | Current status of the order                    |
| `TrackingNumber`  | Shipment tracking identifier                   |
| `ItemsInCart`     | Number of items in the customer's cart         |
| `CouponCode`      | Coupon used on the order                       |
| `ReferralSource`  | Source through which the customer was acquired |
| `TotalPrice`      | Total order value                              |

---

## 🛠️ Tools & Technologies

* **SQL Server / T-SQL**
* **Microsoft Excel** — data preparation and exploratory analysis
* **Power BI** — planned/ongoing analytical visualization
* **Git & GitHub** — version control and project documentation

---

## 🔍 SQL Analysis

The SQL analysis was organized into eight analytical areas:

### 1. Data Quality

Before drawing business conclusions, I performed validation checks including:

* Total record count
* Unique customer count
* Customers with multiple orders
* Duplicate order IDs
* `Quantity × UnitPrice = TotalPrice` validation
* Data consistency checks

This helped establish confidence in the dataset before analysis.

---

### 2. Sales Performance

Key sales metrics included:

* Total order value
* Average order value
* Order volume
* Revenue by order status

The dataset contains approximately **$1.27M in total order value** across 1,200 orders, with an average order value of approximately **$1,054**.

---

### 3. Time Analysis

I analysed sales performance across time using:

* Monthly revenue
* Monthly order volume
* Yearly revenue
* Month-over-month growth
* Year-over-year growth

Window functions such as `LAG()` were used to compare current-period performance with previous periods.

> **Important:** Monthly calculations were grouped using a proper Year-Month date key to avoid combining January 2023, January 2024, and January 2025 into one category.

---

### 4. Product Analysis

Product performance was evaluated using:

* Total revenue by product
* Quantity sold by product
* Average order value by product
* Product rankings
* Product performance across different periods
* Revenue contribution by product

Window functions such as `RANK()` were used to identify the strongest-performing products within each period.

---

### 5. Customer Analysis

Customer behaviour was analysed through:

* Unique customers
* One-time vs repeat customers
* Repeat-customer rate
* Top customers by revenue
* Average customer value
* Customer revenue concentration

One notable finding was the very low level of repeat purchasing:

* **1,189 unique customers**
* **1,178 customers made only one purchase**
* **11 customers made repeat purchases**

This indicates a potential opportunity to investigate **customer retention, loyalty, and repeat-purchase strategies**.

---

### 6. Order & Operational Analysis

I analysed the distribution of orders across:

* Delivered
* Shipped
* Pending
* Returned
* Cancelled

I also examined:

* Cancellation rate
* Return rate
* Revenue by order status
* Product performance by order status

This provides an operational perspective beyond simply measuring sales.

---

### 7. Marketing Analysis

Marketing performance was analysed using:

* Revenue by referral source
* Average order value by referral source
* Referral source × order status
* Coupon performance
* Coupon vs no-coupon performance

The purpose was to understand not only which channels generate orders, but also whether different acquisition and promotional sources are associated with different levels of revenue and order outcomes.

---

### 8. Advanced SQL Analysis

The project also incorporates more advanced SQL techniques for deeper analysis, including:

* Common Table Expressions (CTEs)
* Window functions
* `LAG()`
* `RANK()`
* Subqueries
* Conditional aggregation
* Running totals
* Revenue concentration / Pareto analysis
* Top-N analysis
* Period-over-period comparisons

These techniques allowed the analysis to move beyond simple aggregation into more analytical business questions.

---

## 💡 Key Insights

Some of the findings from the analysis include:

### 💰 Strong overall order value

The dataset contains approximately **$1.27M in total order value** across 1,200 orders.

### 👥 Very low repeat purchasing

Only **11 of 1,189 unique customers** made more than one purchase.

This suggests that customer acquisition may be significantly stronger than customer retention and presents an opportunity for further investigation.

### 📦 Product performance varies

Revenue is distributed across seven products, with some products contributing considerably more revenue than others.

Analysing both **revenue and quantity sold** provides a better picture of product performance than looking at sales volume alone.

### ⚠️ Significant order-status issues

The dataset contains substantial numbers of **cancelled and returned orders**, meaning gross order value should not automatically be interpreted as realized revenue.

This highlights the importance of separating sales performance from operational outcomes.

### 📈 Time-based analysis reveals performance patterns

Yearly, monthly, MoM and YoY analysis provides a more useful view of business performance than a single overall revenue figure.

---

## 🧠 Key SQL Concepts Demonstrated

```text
SELECT / WHERE
GROUP BY / HAVING
ORDER BY
Aggregate Functions
CASE Statements
Subqueries
CTEs
Window Functions
LAG()
RANK()
Conditional Aggregation
Date Functions
Period-over-Period Analysis
Running Totals
Revenue Concentration Analysis
```

---

## 📁 Project Structure

```text
SQL-Sales-Analytics/
│
├── README.md
│
├── SQL/
│   ├── 01_data_quality.sql
│   ├── 02_sales_performance.sql
│   ├── 03_time_analysis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_customer_analysis.sql
│   ├── 06_order_status_analysis.sql
│   ├── 07_marketing_analysis.sql
│   └── 08_advanced_analysis.sql
│
├── Data/
│   └── Dataset.xlsx
│
└── Screenshots/
    ├── sql_results.png
    └── key_insights.png
```

---

## 📌 Analytical Approach

The project followed a structured workflow:

```text
Raw Dataset
     ↓
Data Cleaning
     ↓
Exploratory Data Analysis
     ↓
Business Question Development
     ↓
SQL Analysis
     ↓
Insight Generation
     ↓
Visualization & Storytelling
```

Rather than treating SQL as an exercise in query writing, I used it as a tool for **business problem solving**.

---

## 📈 Next Steps

The next stage of the project is to build on the SQL findings through visualization and business storytelling.

Planned activities include:

* Developing an interactive Power BI dashboard
* Combining SQL findings with previous EDA results
* Creating KPI-driven visualizations
* Investigating the causes behind cancellations and returns
* Exploring strategies for improving repeat purchases
* Translating analytical findings into actionable business recommendations

---

## 👨‍💻 What I Learned

This project strengthened my ability to:

* Translate business problems into SQL questions
* Structure analytical queries logically
* Work with CTEs and window functions
* Perform time-series comparisons
* Analyse customer behaviour
* Distinguish between gross sales and operational outcomes
* Validate data before drawing conclusions
* Interpret SQL results from a business perspective

Most importantly, I learned that **writing a technically correct query is only part of analytics. The real value comes from asking the right question and understanding what the result means for the business.**

---

## 🔗 Project

**Part of my DecodeLabs Data Analytics Internship**

