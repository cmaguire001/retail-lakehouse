# retail-lakehouse
Turn messy nightly CSVs from a retail chain into clean, ready-to-query tables. Bronze holds raw files, Silver cleans and standardizes, Gold delivers business-ready insights. Learn the lakehouse flow and see data transform. 
Every night, a retail chain dumps thousands of lines of CSVs—sales, products, stores—into a digital abyss. Left unchecked, this data is messy, incomplete, and slow to query. That’s money left on the table.

This Lakehouse project walks you through transforming that raw chaos into a structured, analytics-ready goldmine. Bronze captures the raw data as-is. Silver cleans, validates, and standardizes it. Gold delivers ready-to-use business tables that could power KPIs, dashboards, and strategic decisions.

Think of it as turning data into actionable intelligence, without the fluff. Analysts get reliable numbers, managers get clarity, and engineers build pipelines that scale efficiently. Most data projects online feel like demos. I wanted something closer to the real thing: raw files landing in storage, Bronze ingestion, Silver cleanup, and Gold analytics that actually answer business questions. So I built a miniature Lakehouse in Databricks using three simple CSVs — sales, products, and stores — and turned them into a clean analytical model.

The path wasn’t smooth. Free Databricks doesn’t give you clusters, Volumes behave differently, and table schemas rarely line up on the first try. I kept everything transparent in the notebooks so anyone can follow the same path without getting stuck on cryptic errors like “Missing cloud file system scheme.” Every fix is here in the SQL.

The project flows the same way a real retail company moves data: raw files become Bronze tables, inconsistent types are ironed out in Silver, and Gold tables surface the answers executives care about — revenue by product, revenue by store, and how much money comes in every day.
