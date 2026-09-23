# Sales & Profitability Analytics

> **Portfolio project:** From Raw Data → Analysis → Insight → Business Action

## 📌 Project Overview

This project analyzes a synthetic retail sales dataset to answer practical business questions around **revenue, profitability, products, regions, channels and discounting**.

The goal is not simply to build a dashboard, but to demonstrate an end-to-end **Data Analyst workflow**.

### Business Problem

Management can see sales numbers, but needs to understand:

- Where is revenue coming from?
- Is revenue growth translating into profit?
- Which products have strong sales but weak margins?
- Which regions and channels need attention?
- How is discounting affecting profitability?

## 🛠 Tools

- **SQL** — data analysis and business queries
- **Microsoft Excel** — exploratory analysis and summaries
- **Power BI** — dashboarding and interactive reporting
- **DAX** — KPI calculations
- **GitHub** — documentation and versioned portfolio

## 🔄 Analytics Workflow

```text
Raw Data
   ↓
Data Cleaning & Validation
   ↓
Exploratory Analysis
   ↓
SQL Business Questions
   ↓
Power BI Data Model
   ↓
Dashboard
   ↓
Insights
   ↓
Business Actions
```

## 📊 Dashboard Pages

### 1. Executive Overview
- Revenue
- Gross Profit
- Gross Margin %
- Orders
- Units Sold
- YoY Revenue Growth
- Monthly revenue trend

### 2. Product Performance
- Top/Bottom products
- Revenue vs Gross Margin
- Category contribution
- Discount vs Margin

### 3. Regional & Channel Analysis
- Revenue by region
- Margin by region
- Channel performance
- Customer segment contribution

### 4. Profitability Deep Dive
- High-revenue / low-margin products
- Discount bands
- Margin trend
- Opportunity areas

## 🔍 Key Analytical Questions

1. Is revenue growing faster than gross profit?
2. Which products contribute most to revenue?
3. Which products contribute most to profit?
4. Are high discounts associated with lower margins?
5. Which regions combine strong revenue with healthy margins?
6. Which high-revenue products should be investigated for profitability?

## 📁 Repository Structure

```text
sales-profitability-analytics/
├── data/
│   ├── raw_sales_data.csv
│   └── cleaned_sales_data.csv
├── sql/
│   └── business_analysis.sql
├── excel/
│   └── exploratory_analysis.xlsx
├── powerbi/
│   └── sales_profitability_dashboard.pbix
├── screenshots/
├── insights/
│   └── business_insights.md
└── README.md
```

## 📈 Power BI Measures

Recommended core measures:

```DAX
Total Sales = SUM(Sales[Sales])

Gross Profit = SUM(Sales[Gross_Profit])

Gross Margin % =
DIVIDE([Gross Profit], [Total Sales])

Total Orders =
DISTINCTCOUNT(Sales[Order_ID])

Units Sold =
SUM(Sales[Quantity])

Average Discount % =
AVERAGE(Sales[Discount_Pct])

Revenue YoY % =
VAR PreviousYear =
    CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
RETURN
    DIVIDE([Total Sales] - PreviousYear, PreviousYear)
```

## ✅ Data Quality Checks

Before visualization:

- Checked duplicate Order IDs
- Checked missing values
- Validated date range
- Checked negative/zero sales
- Checked discount percentage range
- Reconciled Sales, Cost and Gross Profit
- Confirmed KPI totals against source data

## 💡 Analyst Takeaway

A dashboard should not end with:

> **“Here are the numbers.”**

It should help answer:

> **“What changed, why does it matter, and what should we investigate next?”**

This project demonstrates that principle using SQL, Excel and Power BI.

## ⚠️ Disclaimer

This is a **synthetic portfolio dataset** created for learning and demonstration. It does not represent actual company data or business performance.
