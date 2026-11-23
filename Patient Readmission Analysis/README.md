# Patient Readmission Analysis

## 1. Project Objective

The goal of this project was to understand why some patients with diabetes return to the hospital within 30 days of being discharged.

I analysed hospital encounter data to identify patterns related to previous hospital visits, length of stay, number of diagnoses, age, gender, and diabetes treatment. The aim was to turn the data into useful insights that could help hospitals identify patient groups that may need closer follow-up after discharge.

## 2. Key Insights

The SQL analysis and Power BI dashboard revealed the following patterns:

- **Overall readmission:** Around 11.16% of hospital encounters resulted in readmission within 30 days.
- **Previous inpatient visits:** The early readmission rate increased from 8.44% for patients with no previous inpatient visits to 47.81% for patients with 8 or more.
- **Emergency visits:** The rate increased from 10.47% for patients with no previous emergency visits to 28.54% for those with 4 or more.
- **Length of hospital stay:** Early readmission rates increased from 8.18% for a one-day stay to 14.23% for an eight-day stay.
- **Number of diagnoses:** The rate increased from 5.94% for patients with one diagnosis to 12.38% for patients with nine diagnoses.
- **Age and gender:** The dashboard compares early readmission rates across age groups and between male and female patients.
- **Diabetes treatment:** The dashboard compares readmission rates across insulin treatment categories, diabetes medication status, and medication changes.

**Main takeaway:** Previous hospital visits and greater medical complexity were associated with higher early readmission rates. These patterns can help identify patient groups for further investigation and follow-up.

*Note: These findings show associations, not proof that a particular factor causes readmission. Rates for groups with very few encounters should also be interpreted carefully.*

## 3. Tech Stack

- **MySQL:** Used to store, clean, validate, and analyse the hospital encounter data.
- **SQL:** Used to answer business questions, calculate readmission rates, and identify patterns in patient readmissions.
- **Microsoft Power BI:** Used to build an interactive dashboard and present the findings visually.
- **Power Query:** Used to prepare the data and assign appropriate data types before loading it into the report.
- **DAX:** Used to create measures for total encounters, unique patients, early readmissions, and early readmission rate.
- **CSV:** Used as the dataset format for transferring the cleaned data into Power BI.

## 4. Dashboard Purpose and Features

### Business Problem

Hospitals need to understand which patient groups are more likely to return within 30 days of discharge. Analysing readmission patterns can help healthcare teams identify areas where discharge planning and follow-up care may need more attention.

### Dashboard Goal

The goal of the dashboard is to present readmission patterns in a clear, interactive format so that users can explore patient characteristics, previous hospital visits, and diabetes treatment.

### Dashboard Pages and Features

**Page 1: Readmission Overview**
- KPI cards showing total encounters, unique patients, early readmissions, and early readmission rate.
- Donut chart showing the distribution of readmission categories.
- Column chart comparing early readmission rates across age groups.

**Page 2: Patient Risk Factors**
- Early readmission rate by previous inpatient visits.
- Early readmission rate by previous emergency visits.
- Early readmission rate by length of hospital stay.
- Early readmission rate by number of diagnoses.
- Key insight notes summarising important patterns.

**Page 3: Diabetes Care and Treatment**
- Early readmission rate by insulin treatment.
- Early readmission rate by diabetes medication status.
- Early readmission rate by medication change status.
- Early readmission rate by age group and gender.
- Notes explaining the treatment-related comparisons.

The dashboard uses KPI cards, column charts, a donut chart, percentage formatting, and insight notes to make the results easier to understand.

## 5. Dataset

- **Dataset name:** Diabetes 130-US Hospitals for Years 1999–2008
- **Source:** [Kaggle — Diabetes Dataset](https://www.kaggle.com/datasets/brandao/diabetes)
- **Original data size:** 101,766 hospital encounters and 50 columns.
- **Time period:** 1999–2008.
- **Data includes:** Patient demographics, admission details, length of stay, diagnoses, previous hospital visits, diabetes medications, and readmission status.

The data was cleaned and analysed using SQL before being used to create the Power BI dashboard.

## 6. Dashboard Screenshots

### 1. Readmission Overview

![Readmission Overview Dashboard](dashboard/Readmission%20Overview.png)

### 2. Patient Risk Factors

![Patient Risk Factors Dashboard](dashboard/Patient%20Risk%20Factors.png)

### 3. Diabetes Care and Treatment

![Diabetes Care and Treatment Dashboard](dashboard/Diabetes%20Care%20and%20Treatment.png)
