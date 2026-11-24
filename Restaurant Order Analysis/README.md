# Restaurant Order Analysis Using SQL

## 1. Project Objective
Analyze restaurant menu and order data using SQL to understand menu pricing, customer ordering patterns, popular and unpopular dishes, and high-value orders. The goal is to generate insights that can help the restaurant make informed decisions about its menu and operations.

## 2. Business Problem
Taste of the World Café introduced a new menu at the beginning of the year. The restaurant wanted to understand how customers were responding to the new offerings, which dishes were performing well, and which items were less popular. SQL was used to explore menu and order data to identify trends and evaluate order performance.

## 3. Tools & Technologies
- **SQL:** Data exploration, aggregation, filtering, and analysis
- **MySQL / SQL Server Management Studio (SSMS):** SQL query development and execution

## 4. Dataset
The project uses two tables from the restaurant database:

- **`menu_items`**: Contains menu item details, including item IDs, names, categories, and prices.
- **`order_details`**: Contains order information, including order IDs, dates, and ordered item IDs.

The dataset used for this project was from [Maven Analytics](https://app.mavenanalytics.io/guided-projects/d7167b45-6317-49c9-b2bb-42e2a9e9c0bc)

## 5. Analysis Performed

### 1. Menu Analysis
- Counted the total number of menu items.
- Identified the least and most expensive dishes.
- Analyzed Italian dishes and their price range.
- Examined the number of dishes in each category.
- Calculated average prices across menu categories.

### 2. Order Analysis
- Identified the date range covered by the dataset.
- Calculated the total number of unique orders and items ordered.
- Analyzed the number of items in each order.
- Identified orders containing more than 12 items.

### 3. Customer Ordering Patterns
- Combined menu and order data using a `LEFT JOIN`.
- Identified the most and least ordered dishes.
- Compared ordering patterns across menu categories.
- Identified the five highest-spending orders.
- Analyzed the category-wise composition of high-value orders.

## 6. Key Insights
- **Highest-value order:** Order ID 440 had a total item value of **192.15**.
- Identified the most and least frequently ordered menu items to understand differences in dish popularity.
- Examined category-level pricing and demand to identify potential menu performance patterns.
- Analyzed high-value orders to understand their item counts and category composition.

*Note: The currency unit and the remaining numerical findings should be confirmed from the dataset and query outputs before publication.*

## 7. SQL Skills Demonstrated
- `SELECT`, `WHERE`, and `ORDER BY`
- Aggregate functions: `COUNT()`, `MIN()`, `MAX()`, `AVG()`, and `SUM()`
- `GROUP BY` and `HAVING`
- `LEFT JOIN`
- Subqueries
- `DISTINCT`
- Sorting and ranking results
- Business problem-solving using SQL

## 8. Business Value
- The analysis provides a foundation for understanding menu performance, customer demand, and high-value orders.
- These insights can support menu planning, pricing reviews, and decisions about which dishes may need further investigation.
