# E-Commerce Customer Segmentation & Sales Analysis

An end-to-end e-commerce data analytics project using **Python, MySQL, and Power BI** to analyze sales performance, customer behavior, revenue trends, and RFM-based customer segmentation.

## 📌 Project Overview

This project transforms e-commerce transaction data into actionable business insights.

The analysis covers:

* Sales and revenue performance
* Monthly revenue and MoM growth
* Product performance
* Country-wise performance
* Top customers by revenue
* Customer repeat behavior
* RFM analysis and customer segmentation
* Interactive Power BI dashboard

The workflow follows **data preparation → analysis → SQL → RFM segmentation → dashboard → business recommendations**.

## 🎯 Business Problem

The e-commerce business generates a large amount of transactional data, but raw sales data does not clearly identify valuable customers, inactive customers, revenue trends, or the products and countries contributing most to sales.

The objective is to use data analytics to identify customer segments, understand sales and customer behavior, monitor revenue trends, and provide actionable insights through an interactive Power BI dashboard.

## 🎯 Project Objectives

* Analyze overall sales and revenue performance.
* Track monthly revenue and month-over-month growth.
* Identify top-performing products.
* Analyze country-wise revenue performance.
* Identify top customers by revenue.
* Understand customer repeat purchasing behavior.
* Perform RFM analysis.
* Segment customers based on purchasing behavior.
* Build an interactive two-page Power BI dashboard.
* Generate business insights and recommendations.

## 🛠️ Tools & Technologies

|Tool/Technology        |Purpose                               |
|-----------------------|--------------------------------------|
|Python|Data cleaning, analysis, RFM analysis and visualization|
|Pandas|Data manipulation and aggregation|
|Matplotlib|Data visualization|
|MySQL|SQL-based business analysis|
|MySQL Workbench|Database management and query execution|
|Power BI|Interactive dashboard and reporting|
|Google Colab|Python notebook environment|

## 📂 Repository Structure

```text
Ecommerce-Customer-Segmentation
│
├── Documentation
│   └── E-commerce_sales_data
│   └── E-commerce_sales_cleaned
│   └── RFM_analysis
|
├── SQL
│   └── Ecommerce_Customer_Segmentation_Analysis.sql
│
├── Python
│   └── Ecommerce_Customer_Segmentation_Analysis.ipynb
│
├── Power BI
│   └── Ecommerce_Customer_Segmentation_Analysis.pbix
│
├── Documentation
│   └── Ecommerce_Customer_Segmentation_Project_Documentation.docx
│   └── Ecommerce_Customer_Segmentation_Project_Documentation.pdf
│
└── README.md
```

## 📊 Dataset

The cleaned dataset used in the project contains **48,294 rows and 12 columns**.

### Main Columns

|Column            |Description          |
|------------------|---------------------|
|`InvoiceNo`|Invoice / transaction number|
|`StockCode`|Product code|
|`Description`|Product description|
|`Category`|Product category|
|`Quantity`|Quantity purchased|
|`InvoiceDate`|Transaction date|
|`UnitPrice`|Price per unit|
|`CustomerID`|Customer identifier|
|`Country`|Customer country|
|`Revenue`|Transaction revenue|
|`IsCancelled`|Cancellation indicator|
|`YearMonth`|Year and month derived from transaction date|

## 🔄 Project Workflow

```text
Raw E-Commerce Data
        ↓
Data Cleaning & Preparation
        ↓
Python Exploratory Data Analysis
        ↓
MySQL Data Loading & SQL Analysis
        ↓
RFM Analysis
        ↓
Customer Segmentation
        ↓
Power BI Dashboard
        ↓
Business Insights & Recommendations
```

# 🐍 Python Analysis

Python was used for data preparation, exploratory analysis, visualization, customer analysis, and RFM segmentation.

### Analysis Performed

* Product revenue analysis
* Top 10 customers by revenue
* Customer repeat behavior
* Country analysis
* Monthly revenue analysis
* Month-over-month growth analysis
* RFM scoring
* Customer segmentation
* Segment revenue analysis

# 🗄️ SQL Analysis

The cleaned dataset was loaded into MySQL using `LOAD DATA LOCAL INFILE`.

SQL was used to calculate important business KPIs and monthly revenue growth.

### Key KPIs

* Total Revenue
* Total Orders
* Total Customers
* Total Quantity Sold
* Average Order Value

# 👥 RFM Analysis

RFM analysis evaluates customer value using:

* **Recency** — how recently a customer made a purchase
* **Frequency** — how frequently a customer made purchases
* **Monetary** — how much revenue a customer generated

The final RFM scores were generated in Python using quintile-based `pd.qcut()` logic.

# 🎯 Customer Segmentation

|Segment|Rule|
|-------|---------------------|
|Champions|R ≥ 4, F ≥ 4, M ≥ 4|
|Loyal Customers|R ≥ 3, F ≥ 4|
|Big Spenders|R ≥ 4, M ≥ 4|
|At Risk|R ≤ 2, F ≥ 3|
|Lost Customers|R ≤ 2, F ≤ 2, M ≤ 2|
|Potential Loyalists|Remaining customers|

# 💰 RFM Revenue Results

|Segment|Revenue|
|---------------|-----------------|
|Champions|₹4,798,458.66|
|Potential Loyalists|₹1,471,930.76|
|Loyal Customers|₹1,287,287.53|
|At Risk|₹1,207,936.91|
|Lost Customers|₹691,145.95|
|Big Spenders|₹167,877.67|

**Total RFM Revenue: ₹9,624,637.48**

# 👤 Customer Distribution

|Segment|Customers|
|---------|-------------|
|Potential Loyalists|685|
|Lost Customers|609|
|Champions|581|
|At Risk|318|
|Loyal Customers|252|
|Big Spenders|43|

# 📈 Monthly Revenue Analysis

Monthly revenue and month-over-month growth were analyzed using the `YearMonth` field.

### Key Observations

* **March 2025:** +16.62% MoM growth.
* **April 2026:** ₹526,583.93 revenue, the highest monthly revenue in the supplied analysis.
* **August 2026:** -50.02% MoM decline, the largest decline in the supplied output.

The August 2026 decline should be investigated using order volume, customer activity, product mix, and country-level performance.

# 📊 Power BI Dashboard

The final Power BI report contains **two interactive pages**.

## Page 1 — Sales & Product Analysis

Includes:

* Five KPI cards
* Monthly revenue / growth analysis
* Product performance
* Country analysis
* Customer analysis
* Interactive slicers

## Page 2 — Customer & RFM Analysis

Includes:

* Customer KPIs
* Top 10 Customers by Revenue
* Customer Distribution by RFM Segment — Donut Chart
* Revenue by RFM Segment — Bar Chart
* Interactive RFM analysis
* Synchronized slicers with Page 1

# 🔍 Key Business Insights

1. **Champions are the highest-revenue segment**, generating ₹4,798,458.66.
2. **Potential Loyalists are the largest customer segment**, with 685 customers.
3. **Big Spenders** are a small segment of 43 customers but represent an important high-value group.
4. **At-Risk customers** represent a meaningful re-engagement opportunity.
5. **August 2026** recorded a -50.02% MoM revenue decline in the supplied monthly analysis.

# 💡 Business Recommendations

* Prioritize retention strategies for **Champions**.
* Use personalized offers to convert **Potential Loyalists** into Loyal Customers.
* Launch reactivation campaigns for **At Risk** and **Lost Customers**.
* Provide personalized experiences and upselling opportunities for **Big Spenders**.
* Monitor monthly revenue trends to identify unusual changes early.
* Investigate the August 2026 revenue decline through order, customer, product, and country analysis.
* Use Power BI slicers to drill down into relevant sales and customer dimensions.

# 📁 Project Deliverables

### Data

* Cleaned e-commerce dataset
* RFM analysis dataset

### Python

* Complete analysis notebook

### SQL

* MySQL analytical queries

### Power BI

* Two-page interactive dashboard

### Documentation

* Detailed project documentation

# 🏁 Conclusion

This project demonstrates an end-to-end data analytics workflow using **Python, MySQL, and Power BI**.

The analysis transforms e-commerce transaction data into meaningful business insights by combining sales analysis, customer behavior analysis, monthly growth analysis, and RFM customer segmentation.

The final two-page Power BI dashboard provides an interactive view of business performance and customer segments, helping identify opportunities for customer retention, re-engagement, and revenue growth.

## 👨‍💻 Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* Python
* Pandas
* Matplotlib
* SQL
* MySQL
* RFM Analysis
* Customer Segmentation
* Data Visualization
* Power BI
* Dashboard Development
* Business Intelligence
* Business Insights & Recommendations

