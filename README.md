# sql_sales-analysis
SQL sales analysis project exploring revenue, products, regions, sales performance, profitability, customers, and business trends.

My first SQL project — analyzing a small retail sales dataset using SQL Server (T-SQL).

## What this project covers

- **Database & table design** — creating a `Sales` table and inserting sample data  
  [View result](./01_sales_table.png)

- **Aggregate analysis** — total revenue, total profit, and profit margin  
  [View result](./02_total_revenue.png)

- **Ranking** — top 3 selling products, top 5 highest sales  
  [View results](./03_top_3_products.png) · [Top 5 sales](./12_top_5_sales.png)

- **Grouping** — sales by region, by category, and by salesperson  
  [View sales by region](./04_sales_by_region.png) · [View category performance](./07_category_performance.png)

- **Time-based analysis** — monthly sales trend, month-over-month growth, using `GROUP BY`  
  [View monthly sales trend](./05_monthly_sales_trend.png) · [View month-over-month growth](./11_month_over_month.png)

- **Business questions** — best salesperson, products with low profit margin, average order value, repeat customers per salesperson  
  [Best salesperson](./06_best_salesperson.png) · [Low profit products](./08_low_profit_products.png) · [Average order value](./09_average_order_value.png) · [Repeat customers](./10_repeat_customers.png)

- **Data manipulation** — `UPDATE` statements, adding a new column with `ALTER TABLE`  
  [View results](./13_data_manipulation.png)

- **Filtering** — `WHERE`, `BETWEEN`, multiple conditions  
  [View date/filter results](./14_date_based_queries.png)

## Skills practiced

`CREATE TABLE`, `INSERT`, `GROUP BY`, `ORDER BY`, aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`), `HAVING`, subqueries, Common Table Expressions , `NULLIF()` for safe division, `UPDATE`, `ALTER TABLE`.

## File

- [`sales_analysis.sql`](./sql_sales-analysis.sql) — the full script, organized section by section with comments.

## Notes
This was a learning project, so a few queries include an "another version" — a second attempt at solving the same question after finding a cleaner approach (e.g. using `NULLIF` to avoid divide-by-zero errors).
