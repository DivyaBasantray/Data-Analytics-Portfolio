# United States Health Insurance Cost Analysis

## 1. Project Objective

- The goal of this project is to understand the factors that affect medical insurance charges. I used the US Health Insurance dataset to explore how age, BMI, smoking habits, gender, number of children, and region are related to insurance costs.

- Through data cleaning, exploratory data analysis (EDA), and visualizations, I wanted to find patterns in the data and understand which factors have the strongest relationship with medical expenses.

## 2. Key Insights

After exploring the dataset and studying the relationships between different variables, I found the following patterns:

- **Smoking has the strongest relationship with insurance charges.** The correlation between smoking status and charges was approximately 0.79, making it the strongest relationship among the features I tested.
- **Age is also an important factor.** Insurance charges generally tend to increase as people get older.
- **BMI has a positive relationship with insurance charges.** People with higher BMI values may have higher insurance costs, although this relationship is weaker than the relationship with smoking.
- **The obese BMI category showed a positive relationship with insurance charges.** However, BMI category alone does not explain all the differences in costs.
- **Region has a relatively small relationship with insurance charges.** The Southeast region showed a statistically significant association with the grouped charge levels in the test I performed.
- **Gender and the number of children showed weaker relationships with charges** compared with smoking and age.

Overall, the analysis suggests that smoking status and age are the most important factors to investigate when trying to understand differences in medical insurance costs. These findings show relationships in the dataset and do not prove that any single factor directly causes higher charges.

## 3. Tech Stack

- **Python:** Used to perform data cleaning, analysis, and calculations.
- **Pandas:** Used to load the dataset, inspect the data, remove duplicate records, and prepare it for analysis.
- **NumPy:** Used for numerical operations.
- **Matplotlib:** Used to create charts and visualize patterns in the data.
- **Seaborn:** Used to create histograms, box plots, count plots, and a correlation heatmap.
- **Jupyter Notebook:** Used to write and run the code, explore the dataset, and document the analysis.

## 4. EDA Purpose and Features

The main business question was: **Which factors are most closely related to medical insurance charges, and how can we understand the differences in costs between individuals?**

To explore this question, I performed the following analysis:

- **Data overview:** Checked the dataset's size, column names, data types, summary statistics, and missing values.
- **Data cleaning:** Checked for duplicate records and removed the duplicate found in the dataset.
- **Data distribution:** Studied the distribution of age, BMI, number of children, and insurance charges.
- **Category analysis:** Examined the distribution of smoking status, gender, and region.
- **Outlier analysis:** Used box plots to identify unusually high or low values in numerical columns.
- **Relationship analysis:** Examined how age, BMI, smoking status, gender, number of children, and region relate to insurance charges.
- **Statistical analysis:** Used correlation and chi-square tests to investigate relationships between selected features and insurance charges.

The purpose of this analysis was to turn raw data into useful findings that help explain differences in medical insurance costs.

## 5. Dataset

The dataset was obtained from Kaggle.

**Source:** [US Health Insurance Dataset](https://www.kaggle.com/datasets/teertha/ushealthinsurancedataset)

The original dataset contains **1,338 records and 7 columns** describing individuals and their medical insurance charges.

The columns include:

- `age`: Age of the individual.
- `sex`: Gender of the individual.
- `bmi`: Body Mass Index of the individual.
- `children`: Number of children covered by the insurance.
- `smoker`: Whether the individual is a smoker.
- `region`: Residential region in the United States.
- `charges`: Individual medical insurance charges.

During data cleaning, I removed one duplicate record, leaving **1,337 unique records** for the cleaned dataset. The original dataset contained no missing values.

