
-- Day 3: SQL Foundations for Financial Data
-- Create a table to store accounting transactions

CREATE TABLE IF NOT EXISTS transactions (
    Transaction_ID TEXT PRIMARY KEY,
    Date TEXT,
    Department TEXT,
    Category TEXT,
    Type TEXT,
    Actual_Amount_GHS REAL,
    Budget_Amount_GHS REAL,
    Payment_Method TEXT,
    Location TEXT
);
-- Day 3: Verify the number of imported transactions

SELECT COUNT(*) AS total_transactions
FROM transactions;

-- View the first 10 accounting transactions

SELECT *
FROM transactions
LIMIT 10;


SELECT *
FROM transactions
WHERE Type = 'Revenue';

-- Day 3: Calculate total revenue

SELECT SUM(Actual_Amount_GHS) AS Total_Revenue_GHS
FROM transactions
WHERE Type = 'Revenue';

-- Day 3: Calculate total expenses

SELECT SUM(Actual_Amount_GHS) AS Total_Expenses_GHS
FROM transactions
WHERE Type = 'Expense';

-- Day 3: Calculate net profit or loss

SELECT
    SUM(CASE WHEN Type = 'Revenue'
        THEN Actual_Amount_GHS ELSE 0 END)
    -
    SUM(CASE WHEN Type = 'Expense'
        THEN Actual_Amount_GHS ELSE 0 END)
    AS Net_Profit_GHS
FROM transactions;

-- Day 3: Calculate total expenses by department

SELECT
    Department,
    SUM(Actual_Amount_GHS) AS Total_Expenses_GHS
FROM transactions
WHERE Type = 'Expense'
GROUP BY Department
ORDER BY Total_Expenses_GHS DESC;

-- Day 3: Calculate total expenses by category

SELECT
    Category,
    SUM(Actual_Amount_GHS) AS Total_Expenses_GHS
FROM transactions
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Total_Expenses_GHS DESC;

-- Day 3: Identify the five largest expense transactions

SELECT
    Transaction_ID,
    Date,
    Department,
    Category,
    Actual_Amount_GHS
FROM transactions
WHERE Type = 'Expense'
ORDER BY Actual_Amount_GHS DESC
LIMIT 5;

-- Day 3: Calculate monthly revenue, expenses and profit

SELECT
    SUBSTR(Date, 1, 7) AS Month,
    SUM(CASE WHEN Type = 'Revenue'
        THEN Actual_Amount_GHS ELSE 0 END) AS Revenue_GHS,
    SUM(CASE WHEN Type = 'Expense'
        THEN Actual_Amount_GHS ELSE 0 END) AS Expenses_GHS,
    SUM(CASE WHEN Type = 'Revenue'
        THEN Actual_Amount_GHS ELSE 0 END)
    -
    SUM(CASE WHEN Type = 'Expense'
        THEN Actual_Amount_GHS ELSE 0 END) AS Profit_GHS
FROM transactions
GROUP BY SUBSTR(Date, 1, 7)
ORDER BY Month;

-- Day 3: Identify expense categories exceeding their budgets

SELECT
    Category,
    SUM(Actual_Amount_GHS) AS Actual_GHS,
    SUM(Budget_Amount_GHS) AS Budget_GHS,
    SUM(Actual_Amount_GHS) -
    SUM(Budget_Amount_GHS) AS Variance_GHS
FROM transactions
WHERE Type = 'Expense'
GROUP BY Category
HAVING SUM(Actual_Amount_GHS) >
       SUM(Budget_Amount_GHS)
ORDER BY Variance_GHS DESC;

-- Day 3: Analyse budget variance by expense category

SELECT
    Category,
    SUM(Actual_Amount_GHS) AS Actual_GHS,
    SUM(Budget_Amount_GHS) AS Budget_GHS,
    SUM(Actual_Amount_GHS) -
    SUM(Budget_Amount_GHS) AS Variance_GHS
FROM transactions
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Variance_GHS ASC;
