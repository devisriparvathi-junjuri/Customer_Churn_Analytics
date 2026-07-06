# Machine Learning Model Training Summary

## Model Development

1. Loaded the cleaned customer churn dataset.

2. Split the dataset into training (80%) and testing (20%) sets using stratified sampling.

3. Built a preprocessing pipeline using:
   - StandardScaler for numerical features.
   - OneHotEncoder for categorical features.

4. Combined preprocessing and model training using Scikit-learn Pipeline.

5. Trained three machine learning models:
   - Logistic Regression
   - Random Forest Classifier
   - XGBoost Classifier

6. Generated predictions using the testing dataset.

7. Compared the performance of all models.

8. Saved the trained machine learning models.

9. Exported model performance comparison to:
   model_comparison.csv