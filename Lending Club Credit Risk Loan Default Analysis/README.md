# LENDING CLUB LOAN RISK & PORTFOLIO ANALYSIS

[📊 Download Power BI Dashboard](https://github.com/DivyaBasantray/Lending-Club-Credit-Risk-Loan-Default-Analysis/releases/tag/v1.0.0)

## 1. Project Objective

The objective of this project is to analyze Lending Club loan data and understand the factors associated with loan defaults.

The analysis focuses on borrower characteristics, loan details, credit-related factors, and portfolio trends to identify patterns in charged-off loans.

The main business question was:

> What borrower, loan, and credit characteristics are associated with loan defaults, and how can these insights help in understanding credit risk and loan portfolio performance?

---

## 2. Key Insights

The Power BI dashboard helped identify several important patterns in the loan portfolio:

- The overall charged-off rate for resolved loans was **19.96%**.
- Loan **grade** showed one of the clearest relationships with default risk. The charged-off rate increased from **6.04% for Grade A** to **49.93% for Grade G**.
- Loans with **higher interest rates** generally had higher charged-off rates. The rate increased from **8.16% for loans with 5–10% interest** to around **49% for loans above 30%**.
- **60-month loans** had a higher charged-off rate (**32.45%**) compared with **36-month loans (15.99%)**.
- Borrowers with **higher DTI** generally showed higher charged-off rates. The rate increased from **14.88% for DTI below 10** to **30.87% for DTI above 40**.
- Lower **FICO scores** were generally associated with higher charged-off rates. The rate was **25.28% for the 660–679 range**, compared with **7.10% for 780+**.
- Income showed a weaker relationship with default risk. Higher-income groups generally had lower charged-off rates.
- Most lending volume was concentrated in **debt consolidation and credit card loans**.
- **California, Texas, and New York** were among the largest states by loan volume and total loan amount.
- The FICO × DTI analysis showed that borrowers with **lower FICO scores and higher DTI** generally had higher charged-off rates.
- The dashboard also showed differences in charge-off rates across employment length, home ownership, verification status, loan purpose, and states.

These results show associations in the historical data and should not be interpreted as proof that a particular factor directly causes a loan to default.

---

## 3. Tech Stack

### Python
Used for data cleaning and exploratory data analysis.

Libraries used:
- Pandas – data cleaning, transformation, and analysis
- Matplotlib – data visualization

### Power BI
Used to build the final interactive dashboard.

Power BI was used for:
- KPI cards
- Interactive charts
- Risk segmentation
- Portfolio analysis
- Filters and slicers
- Comparing different borrower and loan characteristics

### GitHub
Used to document and showcase the project, analysis, and dashboard.

---

## 4. Dashboard Purpose and Features

### Business Problem

- Lending institutions need to understand which borrower and loan characteristics are associated with higher credit risk.

- A large loan portfolio can contain millions of records, making it difficult to identify important patterns from raw data alone.

- This project converts the Lending Club loan data into an interactive dashboard that makes these patterns easier to understand.

### Goal of the Dashboard

The main goal is to provide a clear view of:

- Overall loan portfolio performance
- Charged-off loan rate
- Borrower risk characteristics
- Loan characteristics associated with higher charge-off rates
- Lending volume and portfolio concentration
- Risk differences across borrower segments

### Dashboard Pages

#### 1. Credit Risk Overview

Provides an overall view of credit risk using:

- Total Loans
- Average Interest Rate
- Total Loan Amount
- Charged-Off Rate
- Average Loan Amount
- Charge-off rate by loan grade
- Charge-off rate by DTI
- Charge-off rate by FICO score
- Charge-off rate by income
- Charge-off rate by home ownership
- Charge-off rate by employment length
- Charge-off rate by loan term

#### 2. Loan Portfolio Analysis

Focuses on the size and distribution of the loan portfolio.

It includes:

- Charge-off rate by year
- Loan volume by year
- Loan volume by purpose
- Total loan amount by purpose
- Top states by loan volume
- Top states by total loan amount

#### 3. Risk Segmentation

Allows users to explore risk across different borrower and loan segments.

It includes:

- FICO × DTI charge-off analysis
- Grade × Loan Term analysis
- Verification status analysis
- Home ownership analysis
- Filters for loan term, state, grade, and loan purpose

---

## 5. Dataset

- The dataset used in this project is the **Lending Club Loan Data** dataset from Kaggle - https://www.kaggle.com/datasets/wordsforthewise/lending-club/data

- The original dataset contains Lending Club loan records from **2007 to 2018**.

- The selected dataset used for the dashboard contains approximately **2.26 million loan records** and 27 relevant columns.

The analysis includes information such as:

- Loan amount
- Funded amount
- Interest rate
- Loan term
- Loan grade and sub-grade
- Employment length
- Annual income
- Home ownership
- Verification status
- Debt-to-income ratio (DTI)
- FICO score
- Number of open accounts
- Revolving balance
- Revolving utilization
- Total accounts
- Loan purpose
- State
- Loan status

For default analysis, the focus was placed on **resolved loans**:

- Fully Paid → considered non-default
- Charged Off → considered default

- Current and other ongoing loan statuses were not included when calculating the final charged-off rate because their final outcome is not yet known.

- The final dataset was cleaned and prepared using Python before being used in Power BI.

---

## 📊 Dashboard Preview

### 1. Credit Risk Overview

![Credit Risk Overview](./Dashboard/Credit%20Risk%20Overview%20Dashboard.png)

### 2. Loan Portfolio Analysis

![Loan Portfolio Analysis](./Dashboard/Loan%20Portfolio%20Analysis%20Dashboard.png)

### 3. Risk Segmentation

![Risk Segmentation](./Dashboard/Risk%20Segmentation%20Dashboard.png)
