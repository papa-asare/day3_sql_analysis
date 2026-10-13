# Day 3 – SQL Foundations for Financial Data

## Project Overview

This project forms part of my Data Analytics Internship learning programme. Building on the Excel analysis completed during Days 1 and 2, I used SQL to examine accounting transactions, calculate financial performance, investigate expenditure patterns and compare actual expenses against budgeted amounts.

## Objectives

- Import and explore accounting data in a relational database.
- Use SQL queries to filter, sort and aggregate financial transactions.
- Calculate revenue, expenses and net profit.
- Analyse expenditure by department and category.
- Investigate monthly financial performance and budget variances.
- Validate SQL calculations against previous Excel results.

## Tools and Dataset

**Tools:** DBeaver, SQLite, SQL and Microsoft Excel.

**Dataset:** Accounting analytics practice dataset containing 180 transactions, with fields covering transaction IDs, dates, departments, categories, transaction types, actual amounts, budgeted amounts, payment methods and locations.

The original CSV was used to create a separate SQLite database without modifying the Day 1 and Day 2 analysis files.

## SQL Concepts Learned

- **SELECT:** Retrieves specific columns or information from a database table.
- **WHERE:** Filters records based on conditions, such as identifying only revenue or expense transactions.
- **GROUP BY:** Groups transactions with shared characteristics so totals can be calculated by department, category or month.
- **HAVING:** Filters grouped results after aggregation, such as identifying categories whose total actual expenditure exceeds their total budget.
- **ORDER BY:** Sorts results, including ranking expenses from highest to lowest.
- **LIMIT:** Restricts the number of records returned.
- **SUM:** Calculates financial totals.
- **CASE WHEN:** Applies conditional logic, such as separating revenue and expenses when calculating net profit.

## Financial Results

| Financial Metric | Amount (GH₵) |
|---|---:|
| Total Revenue | 318,721 |
| Total Expenses | 456,287 |
| Net Profit / (Loss) | -137,566 |

## Key Financial Insights

1. Total expenses exceeded revenue by GH₵137,566, resulting in a net loss during the period analysed.
2. Office Supplies was the largest expense category, accounting for GH₵105,273.
3. Software was the second-largest expense category at GH₵94,089, followed by Marketing at GH₵82,806.
4. The Sales department incurred the highest expenditure at GH₵134,953, followed by Finance at GH₵126,197.
5. All six expense categories remained below their respective aggregate budgets. Software recorded the largest favourable variance of GH₵5,676.
6. Marketing had the smallest favourable budget variance of GH₵284, suggesting that its expenditure was closest to the allocated budget.

## SQL and Excel Validation

The SQL results were compared with the Excel analysis from Days 1 and 2.

| Metric | Excel (GH₵) | SQL (GH₵) | Result |
|---|---:|---:|---|
| Revenue | 318,721 | 318,721 | Matched |
| Expenses | 456,287 | 456,287 | Matched |
| Net Loss | -137,566 | -137,566 | Matched |
| Office Supplies | 105,273 | 105,273 | Matched |
| Software | 94,089 | 94,089 | Matched |

These comparisons demonstrate consistency between the Excel calculations and SQL aggregations.

## Project Structure

```text
day3_sql_analysis/
├── day3_accounting.db
├── sql/
│   ├── schema.sql
│   └── day3_analysis.sql
├── screenshots/
│   └── day3_sql_results.png
└── README.md
```

## How to Reproduce the Analysis

1. Install DBeaver with SQLite support.
2. Open the included `day3_accounting.db` database.
3. Confirm that the `transactions` table contains 180 records.
4. Open `sql/day3_analysis.sql` in the SQL editor.
5. Execute the queries individually to reproduce the financial calculations and summaries.
6. Compare the resulting figures with the Excel findings from Days 1 and 2.

The `schema.sql` file documents the table structure used for the analysis.

## Conclusion

Day 3 strengthened my understanding of SQL as a tool for financial data analysis. By querying transaction-level accounting data directly, I reproduced important financial results previously calculated in Excel and gained experience with filtering, aggregation, grouping, conditional logic and budget variance analysis.