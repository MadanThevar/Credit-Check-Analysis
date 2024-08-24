<div align="center">
  <img src="https://github.com/MadanThevar/Credit-Check-Analysis/blob/main/credit_card_animation.gif?raw=true" width="500"/>
</div>

<div align="center">
  <h1>  🎯 Credit Risk Analysis </h1>
</div>

## 🗂 Project Overview
This project aims to analyze credit application data to identify key factors influencing credit risk using RStudio, leveraging data cleaning, exploratory analysis, and visualization techniques to uncover actionable insights for predicting creditworthiness.

### 📁 Files in the Repository

- **`Credit Risk analysis.R`**: The R script containing the code for data cleaning, analysis, and visualization.
- **`CREDIT application_record.csv`**: The dataset used for the analysis.
- **`RStudio for the Credit Risk Analysis .docx`**: A document detailing the analysis process and findings.

---

## 🔍 Questions, Analysis, and Visuals

### 1. 🎓 What is the average total household income for each education level?

**Analysis:**
- Higher education levels are strongly correlated with significantly higher average household incomes, suggesting that education is a critical factor in financial stability and credit risk assessment.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="407" alt="Screenshot 2024-08-23 at 14 28 13" src="https://github.com/user-attachments/assets/5feeec74-f615-4e6d-8e09-26328a53e941">


---

### 2. 👶 What is the distribution of the number of children in the dataset?

**Analysis:**
- Distribution is that the majority of applicants have either no children or one child, suggesting that smaller family sizes are more common among the applicant pool, which could influence financial responsibilities and credit risk assessments.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="678" alt="Screenshot 2024-08-23 at 14 32 05" src="https://github.com/user-attachments/assets/51984d7e-0ff5-4716-9379-f176eba736ea">


---

### 3. 🏡 What is the average age of applicants based on their housing type?

**Analysis:**
- Younger applicants tend to live with their parents or in rented apartments, while older applicants are more likely to own or live in more stable housing types like municipal or house/apartment settings, which could reflect greater financial stability and lower credit risk.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="264" alt="Screenshot 2024-08-23 at 14 34 22" src="https://github.com/user-attachments/assets/54350fef-c301-4d1f-9832-6124d0359497">


---

### 4. 👨‍👩‍👧‍👦 How does the average total household income vary between different education levels when excluding those with a secondary or lower education?

**Analysis:**
- Completing an academic degree provides a substantial financial advantage, highlighting the importance of completing higher education to maximize earning potential.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="267" alt="Screenshot 2024-08-23 at 14 44 05" src="https://github.com/user-attachments/assets/23b10dcd-a5bf-4bed-bd9d-39511fd7ffae">


---

### 5. 🎓💰 What is the relationship between education level and total household income and what does this imply for credit risk?

**Analysis:**
- Individuals with an Academic degree earn significantly more on average compared to all other education levels, highlighting the strong positive impact of completing an academic degree on household income. This underscores the value of higher education in boosting earning potential.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="682" alt="Screenshot 2024-08-23 at 14 47 18" src="https://github.com/user-attachments/assets/75c82b64-6a0c-4a4a-8e8c-491f8421efb9">


---

### 6. 📈 How does the number of years employed relate to total household income and what implications does this have for credit risk?

**Analysis:**
- The graph shows that while there is a general trend where income tends to slightly increase with more years of employment, this relationship is weak across all education levels. The income disparity between different education levels is more pronounced than the impact of years employed on total household income.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="769" alt="Screenshot 2024-08-23 at 14 52 34" src="https://github.com/user-attachments/assets/35fb4c45-7635-4ecb-9566-1508dbfeef15">


---

### 7. 💸 How does the distribution of total household income vary across different income types and what insights can we draw using density plots?

**Analysis:**
- The key insight from the density plot is that the majority of individuals across all income types have lower household incomes, with the highest density of incomes clustered well below $500,000. This indicates that most people in these groups, particularly students and state servants, tend to earn significantly less, with few individuals achieving higher income levels, reflecting overall income disparities within these categories.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `ggplot2` for visualization.

**Output:**
- <img width="769" alt="Screenshot 2024-08-23 at 14 54 55" src="https://github.com/user-attachments/assets/acb661a0-8418-4c58-a578-211e8a6c7241">


---

## 🚀 Advanced Analysis

### 🧠 Correlation Analysis

**Objective:**
- Perform a correlation analysis to understand the relationships between key financial variables and explore clustering to segment applicants based on their financial characteristics.

**Tools Used:**
- **R Libraries**: `dplyr` for data manipulation, `corrplot` for correlation heatmaps, `ggplot2` for visualization, `magrittr` for piping operations.

**Analysis:**
- The heatmap shows that the variables examined are largely independent of each other, meaning that within this dataset, years employed, family size, and total household income do not have strong linear relationships. This implies that understanding income, family size, or employment duration likely requires considering additional variables or non-linear models to capture more complex interactions that might exist between them.

**Output:**
-
<img width="613" alt="Screenshot 2024-08-23 at 15 02 07" src="https://github.com/user-attachments/assets/5f369658-d50c-4832-acae-bfa379712e83">


---

## 🛠 Tools and Libraries Summary

- **R**: The core programming language used for this analysis.
- **Key Libraries**:
  - `dplyr` 🌐: Data manipulation across all analyses.
  - `caret` 🧠: Used for model preparation and one-hot encoding.
  - `ggplot2` 📊: Used for all visualizations.
  - `corrplot` 🔥: Used for correlation analysis.
  - `magrittr` ➡️: For efficient data processing with piping.

---
## 📈 Machine Learning Models Tested Using R

In this section, we tested five different machine learning models using R to predict **Total Household Income** based on the features **Years Employed** and **Family Size**. Below are the performance metrics for each model.

### 1. **Linear Regression Model**

- **RMSE**: 98,065.27
- **R-squared**: 0.0011
- **MAE**: 71,089.83

### 2. **Decision Tree Model**

- **RMSE**: 98,120.37
- **R-squared**: NA
- **MAE**: 71,186.61

### 3. **Random Forest Model**

- **RMSE**: 97,085.86
- **R-squared**: 0.0235
- **MAE**: 70,436.61

### 4. **Support Vector Machine (SVM) Model**

- **RMSE**: 100,004.50
- **R-squared**: 0.0091
- **MAE**: 68,355.84

### 5. **Gradient Boosting Model (XGBoost)**

- **RMSE**: 96,774.73
- **R-squared**: 0.0276
- **MAE**: 70,219.89

### Conclusion

- **Best Performing Model**: The Gradient Boosting Model (XGBoost) had the lowest RMSE and the highest R-squared, making it the best performing model in this analysis.
- **Overall**: Despite Gradient Boosting performing better, all models showed low R-squared values, suggesting that additional features or further model tuning is needed to improve predictive accuracy.

### 📌 Key Takeaways
- **Model Performance**: Gradient Boosting (XGBoost) outperformed other models but still had a low R-squared value, indicating that the current predictors (Years Employed and Family Size) are insufficient for accurate income prediction.

- **Feature Importance**: The results suggest that more relevant features, such as marital status, occupation, and loan amounts, need to be incorporated to enhance model accuracy.

- **Complexity and Non-Linearity**: Linear models were less effective, highlighting the need to explore non-linear relationships and more complex algorithms to better capture the underlying data patterns.

- **Data Handling**: The presence of outliers and the potential for overfitting in models like Random Forest suggests a need for improved data preprocessing and model tuning.

## 🧭 Future Work

- **Enhance Predictive Modeling**: Focus on optimizing complex models like Gradient Boosting and Random Forest, which showed the best performance. Consider hyperparameter tuning and exploring non-linear relationships to improve accuracy.

- **Expand Feature Engineering**: Incorporate additional variables such as marital status, occupation type, and loan amounts to better capture the factors influencing household income.

- **Cluster Analysis**: Utilize K-means clustering to identify distinct financial segments within the data, potentially revealing patterns not captured by regression models.

- **Improve Data Quality**: Address outliers and explore dimensionality reduction techniques to enhance model performance and interpretability.
