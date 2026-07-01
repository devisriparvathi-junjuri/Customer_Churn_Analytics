-- =====================================================
-- File: 06_Dashboard_Views.sql
-- Project: Customer Churn Prediction & Business Analytics
-- Description: Create SQL Views for Tableau Dashboard
-- =====================================================
--1. Customer Summary View
CREATE OR REPLACE VIEW churn_analysis.customer_summary AS
SELECT
    contract,
    internet_service,
    COUNT(*) AS total_customers,
    SUM(total_charges) AS total_revenue,
    AVG(monthly_charges) AS avg_monthly_charges
FROM churn_analysis.customers
GROUP BY contract, internet_service;
--2. Churn Summary View
CREATE OR REPLACE VIEW churn_analysis.churn_summary AS
SELECT
    churn,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 /
          SUM(COUNT(*)) OVER (), 2) AS percentage
FROM churn_analysis.customers
GROUP BY churn;
--3. Contract Analysis View
CREATE OR REPLACE VIEW churn_analysis.contract_analysis AS
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*), 2
    ) AS churn_rate
FROM churn_analysis.customers
GROUP BY contract;
--4. Payment Method Analysis View
CREATE OR REPLACE VIEW churn_analysis.payment_analysis AS
SELECT
    payment_method,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM churn_analysis.customers
GROUP BY payment_method;
--5. Tenure Group Analysis View
CREATE OR REPLACE VIEW churn_analysis.tenure_analysis AS
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4-6 Years'
    END AS tenure_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM churn_analysis.customers
GROUP BY tenure_group;
--6. Revenue Analysis View
CREATE OR REPLACE VIEW churn_analysis.revenue_analysis AS
SELECT
    churn,
    SUM(total_charges) AS total_revenue,
    AVG(monthly_charges) AS average_monthly_charge
FROM churn_analysis.customers
GROUP BY churn;