-- =====================================================
-- File: 05_Business_Analysis.sql
-- Project: Customer Churn Prediction & Business Analytics
-- =====================================================

-- 1. Total Customers

SELECT COUNT(*) AS total_customers
FROM churn_analysis.customers;

-- 2. Total Churned Customers

SELECT COUNT(*) AS churned_customers
FROM churn_analysis.customers
WHERE churn = 'Yes';

-- 3. Churn Rate (%)

SELECT
COUNT(*) FILTER (WHERE churn='Yes') * 100.0 /
COUNT(*) AS churn_rate
FROM churn_analysis.customers;

-- 4. Revenue Lost Due to Churn

SELECT
SUM(total_charges) AS revenue_loss
FROM churn_analysis.customers
WHERE churn='Yes';

-- 5. Churn by Contract Type

SELECT
contract,
COUNT(*) AS churn_count
FROM churn_analysis.customers
WHERE churn='Yes'
GROUP BY contract
ORDER BY churn_count DESC;

-- 6. Average Monthly Charges by Churn Status

SELECT
churn,
AVG(monthly_charges) AS avg_monthly_charge
FROM churn_analysis.customers
GROUP BY churn;

-- 7. Churn by Internet Service

SELECT
internet_service,
COUNT(*) AS churn_count
FROM churn_analysis.customers
WHERE churn='Yes'
GROUP BY internet_service
ORDER BY churn_count DESC;

-- 8. Customer Segmentation by Tenure

SELECT
CASE
WHEN tenure <= 12 THEN '0-1 Year'
WHEN tenure <= 24 THEN '1-2 Years'
WHEN tenure <= 48 THEN '2-4 Years'
ELSE '4+ Years'
END AS tenure_group,
COUNT(*) AS customers
FROM churn_analysis.customers
GROUP BY tenure_group;