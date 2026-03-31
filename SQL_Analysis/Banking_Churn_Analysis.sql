--CREATE DATABASE BankChurnProject;

/*
===============================================================================
Project: Bank Customer Churn - Business Analytics
Industry: Finance / Retail Banking
Goal: Data Validation and Strategic Business Insights
Author: Ranginov Ngongo
Date: March 2026
===============================================================================
*/

USE BankChurnProject;

-- =============================================
-- 1. DATA INTEGRITY & VALIDATION
-- =============================================

-- Check total record count to ensure full import
SELECT COUNT(*) AS Total_Records FROM dbo.Bank_Customer_Churn_Prediction;

-- Identify Missing Values (NULLs) across key financial columns
SELECT 
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS Missing_ID,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS Missing_Balance,
    SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS Missing_CreditScore
FROM dbo.Bank_Customer_Churn_Prediction;

-- Check for Duplicate Customers 
SELECT customer_id, COUNT(*) 
FROM dbo.Bank_Customer_Churn_Prediction
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Validate Data Ranges (Check for outliers or "impossible" data)
SELECT 
    MIN(age) AS Min_Age, MAX(age) AS Max_Age,
    MIN(balance) AS Min_Balance, MAX(balance) AS Max_Balance,
    MIN(credit_score) AS Min_Credit, MAX(credit_score) AS Max_Credit
FROM dbo.Bank_Customer_Churn_Prediction;


-- =============================================
-- 2. CORE BUSINESS INSIGHTS 
-- =============================================

-- A. Churn Rate by Country & Gender (Market Segmentation)
SELECT 
    country, 
    gender, 
    COUNT(*) AS Total_Customers,
    SUM(CAST(churn AS INT)) AS Churned_Customers,
    ROUND(AVG(CAST(churn AS FLOAT)) * 100, 2) AS Churn_Rate_Pct
FROM dbo.Bank_Customer_Churn_Prediction
GROUP BY country, gender
ORDER BY country, Churn_Rate_Pct DESC;

-- B. Capital at Risk (Revenue Impact)
-- Analyzing how much "Balance" is leaving the bank due to churn
SELECT 
    country,
    SUM(balance) AS Total_Balance_Lost,
    AVG(balance) AS Avg_Balance_of_Lost_Customer
FROM dbo.Bank_Customer_Churn_Prediction
WHERE churn = 1
GROUP BY country
ORDER BY Total_Balance_Lost DESC;

-- C. Product Stickiness Analysis
-- Does having more products lead to higher retention?
SELECT 
    products_number, 
    COUNT(*) AS Total_Customers,
    ROUND(AVG(CAST(churn AS FLOAT)) * 100, 2) AS Churn_Rate_Pct
FROM dbo.Bank_Customer_Churn_Prediction
GROUP BY products_number
ORDER BY products_number;


-- =============================================
-- 3. CUSTOMER SEGMENTATION FOR TARGETING
-- =============================================

-- Identifying "High Value, High Risk" Customers
-- Criteria: Balance > 100k, Inactive, but haven't churned YET.
SELECT 
    customer_id, 
    credit_score, 
    balance, 
    estimated_salary
FROM dbo.Bank_Customer_Churn_Prediction
WHERE churn = 0 
  AND active_member = 0 
  AND balance > 100000
ORDER BY balance DESC;

-- Creating a View for Power BI Connection
CREATE VIEW vw_Cleaned_Churn_Data AS
SELECT 
    customer_id,
    credit_score,
    country,
    gender,
    age,
    tenure,
    balance,
    products_number,
    credit_card,
    active_member,
    estimated_salary,
    churn,
    -- Simple Age Binning for better visualization
    CASE 
        WHEN age < 30 THEN 'Young Adult'
        WHEN age BETWEEN 30 AND 50 THEN 'Mid-Career'
        ELSE 'Senior' 
    END AS Age_Group
FROM dbo.Bank_Customer_Churn_Prediction;

SELECT * 
FROM vw_Cleaned_Churn_Data;