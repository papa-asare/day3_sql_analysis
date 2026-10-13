
-- Day 3: SQL Foundations for Financial Data
-- Database: SQLite
-- Table: transactions
-- Purpose: Store accounting transactions imported from the CSV.

CREATE TABLE IF NOT EXISTS transactions (
    Transaction_ID TEXT,
    Date TEXT,
    Department TEXT,
    Category TEXT,
    Type TEXT,
    Actual_Amount_GHS REAL,
    Budget_Amount_GHS REAL,
    Payment_Method TEXT,
    Location TEXT
);
