-- ============================================================
-- 02_SILVER_CLEANING.SQL
-- Transform Bronze tables into Silver tables (cleaned, consistent types)
-- ============================================================

-- Step 1 — Clean Products table: cast product_id to INT
CREATE OR REPLACE TABLE workspace.default.silver_products AS
SELECT
  CAST(TRIM(product_id) AS INT) AS product_id,
  name,
  category
FROM workspace.default.bronze_products;

-- Step 2 — Clean Stores table: cast store_id to INT
CREATE OR REPLACE TABLE workspace.default.silver_stores AS
SELECT
  CAST(TRIM(store_id) AS INT) AS store_id,
  store_name,
  city
FROM workspace.default.bronze_stores;

-- Step 3 — Optional: inspect cleaned Silver tables
SELECT * FROM workspace.default.silver_products LIMIT 20;
SELECT * FROM workspace.default.silver_stores LIMIT 20;
SELECT * FROM workspace.default.silver_sales LIMIT 20;

-- End of Silver cleaning
