# Telco-Customer-Churn-Analysis


## 1. Project Objective

- The goal of this project is to understand why customers are leaving a telecom company (customer churn).
- Using SQL, Python and Power BI, I cleaned the dataset, explored patterns, and built an interactive dashboard that helps identify the key factors driving churn.
- This analysis will help the business take focused actions to retain customers and reduce revenue loss.


## 🔍 2. Key Insights

- After analyzing customer behavior and visualizing it in Power BI, these are the major findings:

    - Most churned customers are on month to month contracts. Customers with 1 or 2 year contracts rarely leave.

    - Customers using electronic check as payment method churn the most. Auto payment methods help retain customers.

    - Customers using Fiber Optic internet service churn more than those using DSL.

    - Churn is very high for customers in the first 6 months of their journey. After one year, churn falls significantly.

    - Customers who do not subscribe to security or tech support services are more likely to churn.

    - Higher churn is seen among customers with higher monthly charges.

- These insights suggest that the company should encourage yearly plans, promote auto payments, offer service bundles and focus on engagement during the first few months.


##  🛠 3. Tech Stack

- SQL (MySQL Server)
    - I used SQL to clean the raw dataset.
    - This involved removing duplicates, handling missing values, fixing inconsistent entries and preparing a final clean dataset ready for analysis.
    - SQL helped me quickly filter, query, and structure the data.

- Python (Pandas, Seaborn, Matplotlib)
    - Python was used for Exploratory Data Analysis (EDA).
    - Using Pandas, I explored trends and relationships.
    - With Seaborn and Matplotlib, I visualized patterns — like churn vs tenure, monthly charges, and contract type — before moving to Power BI.

- Power BI
    - Power BI was used to convert the insights into an interactive dashboard.
    - I created DAX measures (KPIs) and visuals that help business users understand churn trends and filter data by contract, payment method, or internet service.
    - Power BI made the findings visually clear and easy to interpret. 


## 📊 4. Dashboard Purpose & Features

- Business Problem:
    - The telecom company is losing customers every month and wants to know why customers are leaving and what factors contribute the most to churn.

- Goal of the Dashboard:
    - To help business decision makers understand key churn patterns and take targeted action to retain customers.

- Dashboard Highlights:

    - KPIs showing total customers, churn rate, average tenure and monthly charges

    - Slicers to filter insights by contract type, internet service, and payment method

- Visuals showing:

    - Churn by contract type

    - Churn by payment method

    - Churn by internet service type

    - Churn rate by tenure

    - Total monthly charges by churn category

    - Services used vs churn status (matrix)

- The dashboard tells a clear story:
    - Short contracts + fiber optic + electronic check payments + no extra services = High churn.


## 📁 5. Dataset

- Dataset Name: Telco Customer Churn
- Rows: 7043 customers
- Source: https://www.kaggle.com/datasets/blastchar/telco-customer-churn

- Contains information on:

    - Customer demographics (gender, senior citizen status)

    - Subscription details (internet type, contract type, phone services)

    - Billing details (monthly charges, payment method)

    - Churn status (Yes / No)
 
## 💼 6. Dashboard Snapshot
Here's a preview of the dashboard:
![Dashboard Preview](https://raw.githubusercontent.com/DivyaBasantray/Telco-Customer-Churn-Analysis/main/Snapshot%20of%20the%20Telco%20Customer%20Churn%20Dashboard.png)
