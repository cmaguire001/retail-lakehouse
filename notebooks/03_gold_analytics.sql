-- ============================================================
-- 03_GOLD_ANALYTICS.SQL
-- Transform Silver tables into Gold tables (aggregated analytics)
-- ============================================================

-- Step 1 — Gold Product Revenue
CREATE OR REPLACE TABLE workspace.default.gold_product_revenue AS
SELECT
  p.product_id,
  p.name AS product_name,
  p.category,
  SUM(s.quantity * s.price) AS total_revenue,
  SUM(s.quantity) AS total_units_sold
FROM workspace.default.silver_sales s
JOIN workspace.default.silver_products p
  ON CAST(s.product_id AS STRING) = CAST(p.product_id AS STRING)
GROUP BY p.product_id, p.name, p.category
ORDER BY total_revenue DESC;

-- Step 2 — Gold Store Revenue
CREATE OR REPLACE TABLE workspace.default.gold_store_revenue AS
SELECT
  st.store_id,
  st.store_name,
  st.city,
  SUM(s.quantity * s.price) AS total_revenue,
  SUM(s.quantity) AS total_units_sold
FROM workspace.default.silver_sales s
JOIN workspace.default.silver_stores st
  ON CAST(s.store_id AS STRING) = CAST(st.store_id AS STRING)
GROUP BY st.store_id, st.store_name, st.city
ORDER BY total_revenue DESC;

-- Step 3 — Gold Daily Revenue
CREATE OR REPLACE TABLE workspace.default.gold_daily_revenue AS
SELECT
  s.date,
  SUM(s.quantity * s.price) AS total_revenue,
  SUM(s.quantity) AS total_units_sold,
  COUNT(*) AS total_transactions
FROM workspace.default.silver_sales s
GROUP BY s.date
ORDER BY s.date;

-- Step 4 — Optional: inspect Gold tables
SELECT * FROM workspace.default.gold_product_revenue LIMIT 20;
SELECT * FROM workspace.default.gold_store_revenue LIMIT 20;
SELECT * FROM workspace.default.gold_daily_revenue LIMIT 20;

-- End of Gold analytics
