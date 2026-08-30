# sql_sales-analysis
SQL sales analysis project exploring revenue, products, regions, sales performance, profitability, customers, and business trends.

My first SQL project — analyzing a small retail sales dataset using SQL Server (T-SQL).

## What this project covers

- **Database & table design** — creating a `Sales` table and inserting sample data
- **Aggregate analysis** — total revenue, total profit, and profit margin
- **Ranking** — top 3 selling products, top 5 highest sales
- **Grouping** — sales by region, by category, and by salesperson
- **Time-based analysis** — monthly sales trend, month-over-month growth, using `GROUP BY` 
- **Business questions** — best salesperson, products with low profit margin, average order value, repeat customers per salesperson
- **Data manipulation** — `UPDATE` statements, adding a new column with `ALTER TABLE`
- **Filtering** — `WHERE`, `BETWEEN`, multiple conditions

## Skills practiced

`CREATE TABLE`, `INSERT`, `GROUP BY`, `ORDER BY`, aggregate functions (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`), `HAVING`, subqueries, Common Table Expressions , `NULLIF()` for safe division, `UPDATE`, `ALTER TABLE`.

## File

- [`sales_analysis.sql`](./sql_sales-analysis.sql) — the full script, organized section by section with comments.

## Notes
This was a learning project, so a few queries include an "another version" — a second attempt at solving the same question after finding a cleaner approach (e.g. using `NULLIF` to avoid divide-by-zero errors).
