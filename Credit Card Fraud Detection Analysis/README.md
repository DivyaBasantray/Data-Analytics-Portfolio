# Credit Card Fraud Detection Analysis

[📊 Download Power BI Dashboard](https://github.com/DivyaBasantray/Credit-Card-Fraud-Detection-Analysis/releases/tag/v1.0.0)

## 1. Project Objective

The objective of this project is to analyze credit card transactions and identify patterns associated with fraudulent activity.

The analysis focuses on understanding how fraud differs from legitimate transactions based on transaction amount, transaction frequency, time patterns, and anonymized PCA-transformed features. The goal is to turn these findings into a clear and interactive Power BI dashboard that can help understand credit card fraud patterns and potential risk areas.

---

## 2. Key Insights

The Power BI dashboard helped identify several important patterns:

- A total of **284,807 transactions** were analyzed, including **492 fraudulent transactions**.
- Fraudulent transactions accounted for approximately **0.17%** of all transactions, showing a highly imbalanced dataset.
- The average fraudulent transaction value was approximately **€122.21**, compared with **€88.29** for legitimate transactions.
- Fraud rates varied across transaction-value ranges, with the **€500–€1K** range showing the highest observed fraud rate at approximately **0.42%**.
- The **€0–€10** transaction range contained the largest number of fraudulent transactions.
- The **€100–€500** range contributed the largest total fraudulent transaction value.
- Fraud activity varied across the approximately **48-hour observation period**, with noticeable changes in fraud rates across different elapsed hours.
- Several PCA-transformed features showed substantial differences between fraudulent and legitimate transactions, particularly **V3, V14, V17, and V12**.
- The analysis shows that fraud rate, fraud volume, and fraudulent monetary value can tell different stories, so all three need to be considered when analyzing fraud risk.

---

## 3. Tech Stack

### Python
Used for data exploration and analysis. Python helped examine the dataset, identify patterns, compare fraudulent and legitimate transactions, and perform exploratory data analysis.

**Libraries used:**
- Pandas
- NumPy
- Matplotlib
- Seaborn

### Power BI
Used to build the interactive dashboard and present the findings in a clear and visual way.

Power BI was used for:
- Data transformation
- Data modeling
- DAX calculations
- KPI creation
- Interactive visualizations
- Dashboard development

### DAX
Used to create calculated measures and columns for metrics such as fraud rate, fraudulent transaction count, fraudulent amount, transaction bands, and PCA feature comparisons.

### GitHub
Used for version control, project documentation, source code, screenshots, and sharing the final Power BI project file through a release.

---

## 4. Dashboard Purpose and Features

### Business Problem

Credit card fraud is difficult to identify because fraudulent transactions represent only a very small proportion of total transactions. This creates a highly imbalanced dataset where simply looking at transaction volume does not provide the complete picture.

The challenge is to understand:

- How common is fraud?
- What transaction amounts are associated with fraud?
- Where is fraud concentrated by transaction value?
- How does fraud activity vary over time?
- Which anonymized features show the strongest differences between fraudulent and legitimate transactions?

### Dashboard Goal

The goal of the dashboard is to convert the results of the exploratory analysis into an interactive and easy-to-understand view of credit card fraud patterns.

### Dashboard Pages

**1. Fraud Overview**

Provides a high-level view of the dataset using KPIs and charts covering:
- Total transactions
- Fraudulent transactions
- Fraud rate
- Fraudulent transaction value
- Average fraudulent transaction value
- Fraud vs legitimate transactions
- Fraud activity over elapsed time

**2. Fraud Patterns**

Explores how fraud varies across transaction-value bands and time.

The page includes:
- Fraud rate by transaction amount
- Fraudulent transaction count by amount band
- Fraudulent transaction value by amount band
- Fraud rate by elapsed hour
- Key observations from the analysis

**3. Fraud Feature Analysis**

Focuses on the anonymized PCA-transformed features in the dataset.

The page compares the average feature values for fraudulent and legitimate transactions and highlights the features showing the largest differences.

Since these PCA features are anonymized, they are treated as statistical components rather than being assigned specific business meanings.

### Dashboard Access

The complete Power BI dashboard is available in the GitHub release:

[**View / Download Power BI Dashboard (v1.0.0)**](https://github.com/DivyaBasantray/Credit-Card-Fraud-Detection-Analysis/releases/tag/v1.0.0)

---

## 5. Dataset Origin

- The dataset is the **Credit Card Fraud Detection dataset**, originally made available on Kaggle - https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud/data

- It contains transactions made by European cardholders during **September 2013** over a period of approximately two days.

- The dataset contains **284,807 transactions**, of which **492 are fraudulent**.

The dataset includes:
- `Time` – seconds elapsed between each transaction and the first transaction
- `V1` to `V28` – anonymized PCA-transformed features
- `Amount` – transaction amount in euros
- `Class` – transaction classification, where `0` represents a legitimate transaction and `1` represents fraud

Due to confidentiality and privacy concerns, most of the original transaction features were transformed using PCA and are therefore provided as anonymized variables.

---

---

## Dashboard Preview

### 1. Fraud Overview

![Fraud Overview](dashboard/Fraud%20Overview.png)

### 2. Fraud Patterns

![Fraud Patterns](dashboard/Fraud%20Patterns.png)

### 3. Fraud Feature Analysis

![Fraud Feature Analysis](dashboard/Fraud%20Feature%20Analysis.png)
