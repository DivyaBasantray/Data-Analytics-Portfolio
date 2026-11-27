# Product Demand & Inventory Analysis

## 1. Project Objective

The objective of this project is to analyse historical product demand across different warehouses, product categories and time periods to understand demand patterns, product performance and inventory requirements.

The project also uses ABC-XYZ analysis to classify products based on their demand contribution and demand variability. This helps businesses improve inventory planning, prioritise important products, manage stock levels and make better supply chain decisions.

## 2. Key Insights

- The business recorded a total net demand of **5.10 billion units** across 2,160 products, 33 product categories and 4 warehouses.
- Annual demand increased consistently from 2012 to 2015, reaching its highest level of **1.10 billion units in 2015**, before declining in 2016.
- March 2015 recorded the highest monthly demand of **104.65 million units**, while September 2012 recorded the lowest at **61.47 million units**.
- **Whse_J** contributed **65.62%** of the overall net demand, indicating a high dependency on a single warehouse.
- **Category_019** accounted for **82.67%** of total net demand, showing a high concentration of demand within one product category.
- **Product_1359** was the most demanded product, with a total net demand of **470.61 million units**.
- Only **60 AX products** contributed **64.12%** of total positive demand. These products have high and relatively stable demand, making them a priority for inventory planning.
- **1,052 CZ products** contributed only **1.57%** of total positive demand. Their low contribution and unpredictable demand indicate a potential risk of excess inventory.
- Products with high demand variability require careful inventory planning to reduce the risk of stock shortages and overstocking.

## 3. Tech Stack

| Tool | Purpose |
|---|---|
| Python | Data cleaning, preprocessing and exploratory data analysis |
| Pandas | Data manipulation, aggregation and product-level analysis |
| NumPy | Numerical and statistical calculations |
| Matplotlib | Visualising demand patterns and historical trends |
| Seaborn | Analysing demand distributions and relationships |
| DuckDB SQL | Querying large datasets, calculating business metrics and analysing product and warehouse performance |
| Jupyter Notebook | Performing and documenting the data analysis |
| Power BI | Creating interactive dashboards and presenting business insights |
| Power Query | Data transformation and preparation |
| DAX | Creating calculated measures, KPIs and demand contribution percentages |

## 4. Dashboard Purpose and Features

### Business Problem

Managing thousands of products across multiple warehouses can make inventory planning difficult. While some products have consistently high demand, others have low or unpredictable demand.

Without a proper understanding of these demand patterns, businesses may face stock shortages, excess inventory, unnecessary storage costs and inefficient distribution of resources across warehouses.

### Goal of the Dashboard

The goal of the dashboard is to help businesses understand historical demand patterns, identify important products and warehouses, monitor demand variability and improve inventory planning.

It presents complex data in a simple and interactive format, making it easier for business users to understand the results and make informed decisions.

### Dashboard Features

#### Page 1: Executive Overview

- Key business performance indicators
- Total net demand and positive demand
- Annual and monthly demand trends
- Total products, categories and warehouses
- Overall historical demand performance

#### Page 2: Warehouse & Product Demand Analysis

- Demand contribution by warehouse
- Monthly demand trends across warehouses
- Top 5 products by demand
- Demand contribution by product category
- Identification of major demand contributors

#### Page 3: ABC-XYZ & Inventory Strategy

- ABC classification based on demand contribution
- XYZ classification based on demand variability
- Combined ABC-XYZ product segmentation
- Identification of high-priority inventory products
- Identification of low-demand and unpredictable products
- Inventory management recommendations based on product classification

## 5. Dataset

The dataset used in this project is the **Historical Product Demand** dataset, available on Kaggle. It contains historical product demand records from a manufacturing company across multiple warehouses and product categories.

**Dataset Source:** [Product Demand Forecasting - Kaggle](https://www.kaggle.com/datasets/felixzhao/productdemandforecasting)

### Dataset Overview

| Attribute | Details |
|---|---|
| File Name | Historical Product Demand.csv |
| File Format | CSV |
| Records After Cleaning | 1,036,643 |
| Unique Products | 2,160 |
| Total Warehouses | 4 |
| Product Categories | 33 |
| Analysis Period | 2012–2016 |

### Dataset Description

| Column | Description |
|---|---|
| Product_Code | Unique identifier assigned to each product |
| Warehouse | Warehouse associated with the demand record |
| Product_Category | Category to which the product belongs |
| Date | Date on which the demand was recorded |
| Order_Demand | Quantity of product demand recorded |

The dataset was cleaned and transformed using Python before performing exploratory data analysis, SQL analysis, ABC-XYZ segmentation and Power BI dashboard development.

### Project Scope

This project focuses on historical demand analysis, demand variability, product segmentation and inventory planning. The insights can serve as a foundation for future demand forecasting and inventory optimisation. Predictive forecasting models are not included in the current scope of this project.

## 6. Power BI Dashboard

### Page 1: Executive Overview

![Executive Overview](Dashboard/Executive%20Overview.png)

---

### Page 2: Warehouse & Product Analysis

![Warehouse & Product Analysis](Dashboard/Warehouse%20%26%20Product%20Analysis.png)

---

### Page 3: ABC-XYZ Inventory Segmentation

![ABC-XYZ Inventory Segmentation](Dashboard/ABC%20-%20XYZ%20Inventory%20Segmentation.png)
