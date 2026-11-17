# **Uber Ride Analysis**

## **1. Project Objective**
- The goal of this project was to analyze one full year of Uber ride activity using SQL, Python and Power BI.  
- The main focus was to understand ride demand, cancellations, revenue patterns and the overall quality of drivers and customers.  
- This dashboard helps identify how Uber rides behave across time, locations, vehicle types and user behaviour.

---

## **2. Key Insights (From Power BI Dashboard)**  
Here’s a summary of the most important findings:

### **Ride Completion & Cancellations**
- Out of **150K rides**, around **62% were completed**.  
- **25% rides were cancelled**, with “Cancelled by Driver” being the highest category.  
- **7% rides had ‘No Driver Found’**, mostly during peak hours.

### **Demand Trends**
- Ride demand peaks between **5 PM – 8 PM**.  
- Weekends show slightly higher demand compared to weekdays.  
- Monthly rides stay consistent across the year.

### **Revenue & Fare Patterns**
- **Autos and Go Mini** generate the highest revenue due to high volume.  
- Average Ride Fare is around **₹508**.  
- Average Ride Distance is about **24.6 km**.  
- All vehicle types charge a fairly similar **fare per km** (~₹38/km).

### **Ratings**
- **Average customer rating:** 4.40  
- **Average driver rating:** 4.23  
- All vehicle types show stable and similar rating trends.

### **Overall**
The data shows strong evening demand, moderate cancellation issues, and fairly consistent pricing across the fleet.

---

## **3. Tech Stack**  

### **SQL (MySQL)**  
Used for **data cleaning and preprocessing**:
- Removed duplicates  
- Fixed data types  
- Created new features (ride hour, weekday, month, ride type)  
- Converted messy values into usable formats  

SQL helped convert raw CSV data into an analysis-ready dataset.

### **Python (Pandas + Seaborn/Matplotlib)**  
Used for:
- Exploratory data analysis  
- Detecting outliers  
- Understanding distributions  
- Validating SQL cleaning  

Python helped confirm that the cleaned dataset was correct before moving to Power BI.

### **Power BI**  
Used to build the **interactive dashboard**.  
Great for:
- KPI tracking  
- Heatmaps  
- Time-series analysis  
- Dynamic filters  
- Clean visual storytelling for business use  

Power BI turned all insights into an easy-to-use dashboard.

---

## **4. Dashboard Purpose & Features**

### **Business Problem**
Uber often faces fluctuations in demand, cancellations, revenue inconsistency, and varying driver/customer behaviour. Understanding these patterns is crucial for improving operations.

### **Goal of the Dashboard**
- Monitor ride volume across months, weekdays and hours  
- Identify when and why cancellations occur  
- Track revenue and fare behaviour  
- Compare performance across vehicle types  
- Evaluate driver and customer satisfaction  

### **Dashboard Features**
- **Overview Page:** Key KPIs (rides, completion rate, fare, distances)  
- **Time Analysis:** Hourly, daily and monthly demand patterns  
- **Cancellation Deep Dive:**  
  - Cancellations by hour  
  - Cancellations by vehicle type  
  - Top cancellation reasons  
- **Revenue Analysis:**  
  - Total revenue by vehicle type  
  - Fare vs distance distribution  
  - Fare per km  
- **Rating Analysis:**  
  - Driver ratings  
  - Customer ratings  
  - Vehicle-wise comparison  

This structure makes the dashboard easy to understand for managers, analysts and stakeholders.

---

## **5. Dataset**
The dataset contains **150,000 Uber ride records** for the year **2024**

Columns included:
- Ride date & time  
- Booking ID  
- Vehicle type  
- Pickup & drop location  
- Ride distance  
- Payment method  
- Cancellation details  
- Driver / customer ratings  
- Ride outcome (completed, cancelled, no driver found, incomplete)

**Dataset Source:** https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard/data 

**Tools Used:** SQL | Python | Power BI

- The data was initially raw, inconsistent and contained empty strings, text-based numbers and missing values.  
- All these issues were fixed using SQL before analysis.

**Data Preparation :**
- Cleaned in SQL
- Exploratory data analysis in Python
- Visualized in Power BI

## **6. Screenshot/Demos**  

Here's a preview of the dashboard:

![Uber Dashboard Overview](https://raw.githubusercontent.com/DivyaBasantray/Uber-Ride-Analysis/main/Screenshot%20of%20the%20Dashboard%20(Overview).png)

![Uber Dashboard Overview](https://raw.githubusercontent.com/DivyaBasantray/Uber-Ride-Analysis/main/Screenshot%20of%20the%20Dashboard%20(Ratings).png)
