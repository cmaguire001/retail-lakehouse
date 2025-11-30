-- ============================================================
-- 01_BRONZE_INGESTION.SQL
-- Raw data onboarding into the Lakehouse (Bronze Layer)
-- Source: CSV files manually uploaded into Databricks Workspace
-- ============================================================

-- Step 1 — Create empty Bronze Delta tables
CREATE TABLE IF NOT EXISTS workspace.default.bronze_sales;
CREATE TABLE IF NOT EXISTS workspace.default.bronze_products;
CREATE TABLE IF NOT EXISTS workspace.default.bronze_stores;

-- Step 2 — Load CSVs from Workspace user directory into Bronze
-- These file paths match the user-uploaded CSVs in Databricks
COPY INTO workspace.default.bronze_sales
FROM '/Workspace/Users/cmaguire001@gmail.com/sales.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true')
COPY_OPTIONS ('mergeSchema' = 'true');

COPY INTO workspace.default.bronze_products
FROM '/Workspace/Users/cmaguire001@gmail.com/products.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true')
COPY_OPTIONS ('mergeSchema' = 'true');

COPY INTO workspace.default.bronze_stores
FROM '/Workspace/Users/cmaguire001@gmail.com/stores.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header' = 'true')
COPY_OPTIONS ('mergeSchema' = 'true');

-- Step 3 — Verify Bronze tables
SELECT * FROM workspace.default.bronze_sales LIMIT 20;
SELECT * FROM workspace.default.bronze_products LIMIT 20;
SELECT * FROM workspace.default.bronze_stores LIMIT 20;

-- End of Bronze ingestion
