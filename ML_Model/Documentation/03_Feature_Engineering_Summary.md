# Feature Engineering Summary

## Dataset Transformation

1. Loaded the cleaned customer churn dataset prepared after the data cleaning phase.

2. Removed the `customer_id' column as it is a unique identifier and does not contribute to churn prediction.

3. Converted the target variable `churn' into binary format:
   - Yes → 1
   - No → 0

4. Separated the dataset into:
   - Features (X) for model input.
   - Target (y) for churn prediction.

5. Identified categorical and numerical features.

6. Converted categorical variables into numerical format using One-Hot Encoding.

7. Used `drop_first=True' to avoid redundant features during encoding.

8. Converted boolean encoded values into integer format:
   - True → 1
   - False → 0

9. Prepared the final machine learning-ready dataset containing numerical features.

10. Saved the processed dataset as:
   `ml_ready_customer_churn.csv'

## Purpose

Feature engineering transforms cleaned customer data into a format suitable for machine learning models by improving data consistency and model compatibility.