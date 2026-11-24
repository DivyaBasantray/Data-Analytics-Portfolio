# Bank Customer Churn Analysis

## 1. Project Objective
Prepare and explore customer data for the Bank of Mavenland to understand customer churn patterns and identify relationships between customer characteristics and churn. The project focuses on data quality, exploratory data analysis, and feature engineering to prepare the dataset for two potential machine learning applications: **customer churn prediction and customer segmentation**.

## 2. Business Problem
The Bank of Mavenland has observed an increase in customer churn and a decline in growth. The product team wants to understand customer behavior, identify patterns associated with customers leaving the bank, and prepare reliable data for machine learning projects that could help reduce churn and attract new customers.

## 3. Tools & Technologies
- **Python:** Data preparation, cleaning, and analysis
- **Pandas:** Data manipulation, merging, and missing-value handling
- **NumPy:** Data standardization and transformation
- **Matplotlib:** Data visualization
- **Seaborn:** Statistical visualization
- **Jupyter Notebook:** Interactive analysis and documentation

## 4. Dataset
The project uses the `Bank_Churn_Messy.xlsx` Excel workbook, which contains two tables:

- **Customer Information:** Customer ID, surname, credit score, geography, gender, age, tenure, and estimated salary.
- **Account Information:** Customer ID, account balance, number of products, credit card ownership, active membership status, and churn status.

The two tables were joined using `CustomerId` to create a consolidated customer dataset.

The dataset that was used for this project was from [Maven Analytics](https://app.mavenanalytics.io/guided-projects/c2ec6307-35bc-42cf-8501-290a11c15778)

## 5. Analysis Process

### 1. Data Import & Quality Checks
- Imported customer and account information from separate Excel sheets.
- Combined both tables using a left join.
- Checked for duplicate records and redundant columns.
- Examined column data types, missing values, and dataset structure.

### 2. Data Cleaning & Preparation
- Removed duplicate records and redundant tenure columns.
- Converted `EstimatedSalary` and `Balance` from currency-formatted text into numeric values.
- Handled missing surname values using a placeholder.
- Imputed missing age values using the median.
- Standardized inconsistent country names in the `Geography` column.
- Reviewed numerical summaries and data distributions.

### 3. Exploratory Data Analysis (EDA)
- Compared the proportions of churned and retained customers.
- Explored categorical variables against churn status.
- Examined churn patterns across geography, gender, and other categorical features.
- Used box plots to compare numerical variables between churned and retained customers.
- Used histograms to explore numerical distributions and potential differences between churn groups.

### 4. Feature Engineering & Modeling Preparation
- Removed `CustomerId` and `Surname` because they were not suitable predictive features.
- Converted categorical variables into dummy variables using one-hot encoding.
- Created a new `Balance_v_Sal` feature by dividing account balance by estimated salary.
- Visualized the relationship between the engineered feature and churn status.
- Prepared a structured dataset for subsequent machine learning work.

## 6. Key Dataset Statistics
- **Total customer records:** 10,000
- **Average customer age:** 38.92 years
- **Average credit score:** 650.53
- **Average account balance:** 76,485.89
- **Average estimated salary:** 100,092.25
- **Customers who exited:** 20.37%

*Currency figures are reported in the dataset's currency units.*

## 7. Key Observations
- Approximately **20.37% of customers** in the dataset had exited the bank.
- The dataset contained inconsistent country labels, including `FRA`, `France`, and `French`, which were standardized into a single `France` category.
- Currency symbols in the balance and salary columns required conversion before numerical analysis.
- Missing values were identified in the surname and age columns and handled during data preparation.
- A balance-to-salary ratio was engineered to explore whether a customer's balance relative to their estimated salary was associated with churn.

## 8. Skills Demonstrated
- Data cleaning and preprocessing
- Data quality assessment
- Joining datasets using Pandas
- Missing-value imputation
- Duplicate removal
- Data type conversion
- Categorical data standardization
- Exploratory data analysis
- Statistical data visualization
- Feature engineering
- One-hot encoding
- Preparing data for machine learning

## 9. Business Value
This analysis establishes a cleaner and more consistent dataset for investigating customer churn. By exploring customer characteristics and preparing relevant features, the project supports further analysis for churn prediction and customer segmentation, helping the bank investigate potential retention opportunities.

## 10. Project Outcome
A consolidated, cleaned, and explored customer dataset, with engineered features and encoded categorical variables, ready for further modeling and evaluation.
