-- Sales & Profitability Analytics
-- Compatible with PostgreSQL / SQL Server with minor date-function adjustments.

-- 1. Overall KPI
SELECT
    COUNT(DISTINCT order_id) AS orders,
    SUM(quantity) AS units,
    SUM(sales) AS revenue,
    SUM(gross_profit) AS gross_profit,
    ROUND(100.0 * SUM(gross_profit) / NULLIF(SUM(sales),0),2) AS gross_margin_pct
FROM cleaned_sales_data;

-- 2. Revenue and profit by year
SELECT year,
       SUM(sales) AS revenue,
       SUM(gross_profit) AS gross_profit,
       ROUND(100.0*SUM(gross_profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM cleaned_sales_data
GROUP BY year
ORDER BY year;

-- 3. Top and bottom products by revenue
WITH product_perf AS (
    SELECT product_name, category,
           SUM(sales) AS revenue,
           SUM(gross_profit) AS gross_profit,
           AVG(discount_pct) AS avg_discount
    FROM cleaned_sales_data
    GROUP BY product_name, category
)
SELECT * FROM product_perf
ORDER BY revenue DESC;

-- 4. Regional performance
SELECT region,
       SUM(sales) AS revenue,
       SUM(gross_profit) AS gross_profit,
       ROUND(100.0*SUM(gross_profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM cleaned_sales_data
GROUP BY region
ORDER BY revenue DESC;

-- 5. Discount vs margin bands
SELECT
    CASE
      WHEN discount_pct < 5 THEN '<5%'
      WHEN discount_pct < 10 THEN '5-10%'
      WHEN discount_pct < 20 THEN '10-20%'
      ELSE '20%+'
    END AS discount_band,
    COUNT(*) AS order_lines,
    SUM(sales) AS revenue,
    ROUND(AVG(gross_margin_pct),2) AS avg_margin_pct
FROM cleaned_sales_data
GROUP BY 1
ORDER BY 1;

-- 6. Find high-revenue, low-margin products
SELECT product_name,
       SUM(sales) AS revenue,
       ROUND(100.0*SUM(gross_profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM cleaned_sales_data
GROUP BY product_name
HAVING SUM(sales) > (SELECT AVG(product_sales) FROM
    (SELECT SUM(sales) AS product_sales FROM cleaned_sales_data GROUP BY product_name) x)
   AND 100.0*SUM(gross_profit)/NULLIF(SUM(sales),0) < 20
ORDER BY revenue DESC;

-- 7. Monthly trend
SELECT year, month, month_name,
       SUM(sales) AS revenue,
       SUM(gross_profit) AS gross_profit
FROM cleaned_sales_data
GROUP BY year, month, month_name
ORDER BY year, month;
