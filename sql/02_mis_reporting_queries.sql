-- Core MIS reporting queries for PostgreSQL

-- 1. Executive KPI summary
SELECT SUM(sales_amount) AS total_sales,
       SUM(profit) AS total_profit,
       SUM(quantity) AS units_sold,
       COUNT(DISTINCT order_id) AS unique_orders,
       ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales_amount),0),2) AS profit_margin_pct
FROM master_sales;

-- 2. Daily MIS
SELECT order_date, SUM(sales_amount) AS sales, SUM(profit) AS profit,
       SUM(quantity) AS units, COUNT(DISTINCT order_id) AS orders
FROM master_sales GROUP BY order_date ORDER BY order_date;

-- 3. Weekly MIS (week starts Monday)
SELECT DATE_TRUNC('week', order_date)::date AS week_start,
       SUM(sales_amount) AS sales, SUM(profit) AS profit,
       SUM(quantity) AS units, COUNT(DISTINCT order_id) AS orders
FROM master_sales GROUP BY 1 ORDER BY 1;

-- 4. Monthly sales/profit and unique orders
SELECT DATE_TRUNC('month', order_date)::date AS month_start,
       SUM(sales_amount) AS sales, SUM(profit) AS profit,
       SUM(quantity) AS units, COUNT(DISTINCT order_id) AS orders
FROM master_sales GROUP BY 1 ORDER BY 1;

-- 5. Monthly target achievement by category. Join targets at month/category grain.
WITH actual AS (
  SELECT DATE_TRUNC('month', order_date)::date AS month_start, category,
         SUM(sales_amount) AS actual_sales, SUM(profit) AS profit,
         COUNT(DISTINCT order_id) AS orders
  FROM master_sales GROUP BY 1,2
)
SELECT t.month_start, t.category, t.target, COALESCE(a.actual_sales,0) AS actual_sales,
       COALESCE(a.actual_sales,0)-t.target AS target_variance,
       ROUND(100.0*COALESCE(a.actual_sales,0)/NULLIF(t.target,0),2) AS target_achievement_pct,
       COALESCE(a.profit,0) AS profit, COALESCE(a.orders,0) AS orders
FROM sales_targets t LEFT JOIN actual a USING(month_start,category)
ORDER BY t.month_start,t.category;

-- 6. Category performance
SELECT category, SUM(sales_amount) AS sales, SUM(profit) AS profit,
       SUM(quantity) AS units, COUNT(DISTINCT order_id) AS orders
FROM master_sales GROUP BY category ORDER BY sales DESC;

-- 7. Region performance
SELECT region, SUM(sales_amount) AS sales, SUM(profit) AS profit,
       COUNT(DISTINCT order_id) AS orders
FROM master_sales GROUP BY region ORDER BY sales DESC;

-- 8. Order status mix and cancellation/return rate
SELECT order_status, COUNT(*) AS orders,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM operations_mis),2) AS share_pct
FROM operations_mis GROUP BY order_status ORDER BY orders DESC;

-- 9. On-time delivery and delay KPIs (simulation fields; use as portfolio demonstration only)
SELECT COUNT(*) FILTER (WHERE order_status='Delivered') AS delivered_orders,
       COUNT(*) FILTER (WHERE order_status='Delivered' AND on_time_flag='Yes') AS on_time_delivered,
       ROUND(100.0*COUNT(*) FILTER (WHERE order_status='Delivered' AND on_time_flag='Yes') /
             NULLIF(COUNT(*) FILTER (WHERE order_status='Delivered'),0),2) AS on_time_delivery_pct,
       AVG(delay_days) FILTER (WHERE order_status IN ('Delivered','Returned')) AS avg_delay_days,
       COUNT(*) FILTER (WHERE cancellation_flag='Yes') AS cancellations,
       COUNT(*) FILTER (WHERE return_flag='Yes') AS returns
FROM operations_mis;

-- 10. Data quality: order IDs in sales not found in operations
SELECT DISTINCT m.order_id FROM master_sales m
LEFT JOIN operations_mis o USING(order_id) WHERE o.order_id IS NULL;
