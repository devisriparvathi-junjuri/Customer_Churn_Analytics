-- Data Validation Queries

-- Check total records 
SELECT COUNT(*) AS total_records
FROM churn_analysis.customers;

-- Preview Imported Data

SELECT *
FROM churn_analysis.customers
LIMIT 10;

-- Check for NULL values in total_charges

SELECT COUNT(*)
FROM churn_analysis.customers
WHERE total_charges IS NULL;

-- Check duplicate customer IDs

SELECT customer_id,
       COUNT(*)
FROM churn_analysis.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
