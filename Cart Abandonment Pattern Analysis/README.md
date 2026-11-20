# Cart Abandonment Pattern Analysis

## 1. Project Objective

The objective of this project was to understand why customers abandon their shopping carts before completing a purchase.

Using e-commerce event data from February 2020, I analyzed customer and session behavior to identify the main factors associated with cart abandonment. The analysis covered product categories, brands, price ranges, number of products in the cart, session depth, customer engagement, devices, and traffic sources.

The goal was to turn these findings into clear business insights that can help an e-commerce team understand where customers are dropping off and what areas should be investigated first.

## 📊 Power BI Dashboard

The final Power BI dashboard is available as a GitHub Release because the `.pbix` file is too large to store directly in the repository.

👉 **[Download/View the Power BI Dashboard (v1.0.0)](https://github.com/DivyaBasantray/Cart-Abandonment-Pattern-Analysis/releases/tag/v1.0.0)**

The dashboard covers cart abandonment, conversion, customer behavior, product-level patterns, device and traffic-source analysis, and the main drop-off points in the purchase journey.

---

## 2. Key Insights

The Power BI dashboard highlighted several important patterns behind cart abandonment.

### Headline Metrics

- **13,544,595** unique sessions
- **1,660,110** sessions added products to the cart
- **700,091** cart sessions resulted in a purchase
- **960,019** cart sessions were abandoned
- **57.83%** cart abandonment rate
- **42.17%** cart-to-purchase conversion rate
- **5.31%** overall view-to-purchase conversion rate

### Key Findings

- Certain product categories had significantly higher abandonment rates than others.
- Some brands showed extremely high abandonment rates, with **Silverlit reaching 97.76%** abandonment.
- Lower-priced products showed higher abandonment. Products priced between **$0-$50 had a 65.64% abandonment rate**, compared with **50.69% for products priced between $100-$200**.
- Customers with only **1 product in their cart had a 60.16% abandonment rate**, while sessions with 2 products had a lower abandonment rate of **39.82%**.
- Session depth also showed a clear relationship with conversion. Sessions with only **1 session had a 65.42% abandonment rate**, while customers with **6+ sessions had a 45.94% abandonment rate**.
- Customers who purchased showed stronger engagement with the website compared with customers who abandoned their carts.
- Some device types and traffic sources showed higher abandonment rates, highlighting areas that may need further investigation.
- The largest drop-off in the purchase journey occurred between **adding a product to the cart and completing the purchase**, making this an important area for the product team to investigate.

Overall, the analysis showed that cart abandonment is not caused by one single factor. Product, price, customer engagement, session behavior, device, and traffic source all play a role in the likelihood of completing a purchase.

---

## 3. Actionable Recommendations

Based on the dashboard findings, the following actions can be taken to reduce cart abandonment and improve conversion:

### 1. Simplify the Cart-to-Purchase Journey
The biggest opportunity is the drop-off between adding a product to the cart and completing the purchase. The business should review the checkout process and reduce unnecessary steps.

**Action:** Make checkout shorter, show the final price early, provide clear delivery information, and offer commonly used payment options.

**Expected impact:** A smoother checkout experience can reduce last-minute drop-offs and improve cart-to-purchase conversion.

### 2. Investigate High-Abandonment Product Categories
Some product categories have much higher abandonment rates than others.

**Action:** Compare these categories on price, product availability, delivery charges, product descriptions, ratings, and reviews. Identify whether customers are adding products mainly for comparison rather than immediate purchase.

**Expected impact:** Improving the product information and purchase experience for these categories can increase conversion.

### 3. Focus on High-Abandonment Brands
Brands with high cart abandonment should not be treated the same as brands with strong conversion.

**Action:** Review the pricing, product ratings, reviews, availability, and competitor pricing for these brands. Identify whether customers are using the cart to compare products before buying elsewhere.

**Expected impact:** Better pricing and stronger product information may help convert more users who are already showing purchase intent.

### 4. Target Single-Product Cart Sessions
Customers adding only one product showed a higher likelihood of abandonment.

**Action:** Test product recommendations, complementary products, customer reviews, and relevant offers on single-product cart sessions.

**Expected impact:** Encouraging customers to explore related products can increase engagement and give them more reasons to complete the purchase.

### 5. Improve Low-Engagement Customer Journeys
Customers with lower engagement and fewer sessions were more likely to abandon.

**Action:** Provide clearer product information, reviews, recommendations, and trust signals early in the customer journey. For returning visitors, personalize recommendations based on previously viewed or added products.

**Expected impact:** Increasing engagement before checkout can improve purchase intent and reduce abandonment.

### 6. Optimize High-Abandonment Devices
If a particular device type shows a higher abandonment rate, it should be investigated separately rather than assuming the behavior is the same across all devices.

**Action:** Compare page loading time, cart usability, checkout layout, payment experience, and error rates across devices.

**Expected impact:** Fixing device-specific issues can remove technical or usability barriers during checkout.

### 7. Review Traffic Sources with High Abandonment
Some traffic sources may generate many cart sessions but relatively few purchases.

**Action:** Compare the landing pages, campaigns, keywords, and customer intent for these traffic sources. Check whether the marketing message matches the product and offer shown after the customer arrives on the website.

**Expected impact:** Better-qualified traffic should lead to higher conversion and reduce wasted marketing spend.

### 8. Prioritize High-Traffic, Low-Conversion Segments
Not every high-abandonment segment has the same business value. Segments with both high traffic and low conversion should be prioritized.

**Action:** Create a priority list of categories, brands, devices, and traffic sources based on traffic volume and abandonment rate. Start optimization experiments with the largest opportunities.

**Expected impact:** Focusing resources on high-volume problem areas can produce a larger improvement in overall conversion.

### 9. Test Cart Abandonment Recovery
Customers who abandon their carts have already shown purchase interest.

**Action:** Test reminder emails, personalized product recommendations, or limited-time incentives for selected abandoned-cart segments.

**Expected impact:** Recovering even a small percentage of abandoned carts can directly increase completed purchases.

### 10. Continuously Monitor Cart Abandonment
Cart abandonment should be tracked regularly instead of being treated as a one-time analysis.

**Action:** Monitor abandonment rate by category, brand, device, traffic source, price range, and customer behavior. Compare these metrics over time after implementing changes.

**Expected impact:** Continuous monitoring helps the business identify new problems and measure whether optimization efforts are actually improving conversion.

--- 

## 4. Tech Stack

### Python
Used for data cleaning, data preparation, and exploratory data analysis. Python was also used to process the large dataset in chunks.

### Pandas
Used to clean, filter, transform, and analyze the e-commerce data.

### MySQL
Used for SQL analysis and answering business questions related to cart abandonment, customer behavior, and high-abandonment segments.

### Power BI
Used to build the final interactive dashboard and present the analysis through clear visualizations and business insights.

### Excel
Used for supporting data checks and basic analysis during the project.

### Jupyter Notebook
Used to perform the Python-based data cleaning and exploratory data analysis.

### GitHub
Used to store the project files, analysis, SQL queries, and documentation.

---

## 5. Dashboard Purpose and Features

### Business Problem

E-commerce businesses can have a large number of customers who add products to their carts but leave without completing the purchase.

The main business problem addressed in this project was:

**Why are customers abandoning their carts, and which customer or product factors are most strongly associated with abandonment?**

### Dashboard Goal

The goal of the Power BI dashboard was to turn the analysis into a simple business view that helps identify the main areas of customer drop-off.

The dashboard allows users to explore:

- Total cart sessions
- Purchased and abandoned sessions
- Cart abandonment rate
- Cart-to-purchase conversion rate
- Abandonment trends over time
- Abandonment by device
- Abandonment by traffic source
- Abandonment by product category and brand
- Abandonment by price range
- Impact of product count on abandonment
- Customer engagement differences between purchasers and abandoners
- Relationship between session depth and purchase behavior
- High-traffic segments with low conversion
- Major drop-off points in the purchase journey

The dashboard is designed to help an e-commerce or product team identify the biggest drop-off areas and decide what should be investigated or improved first.

---

## 6. Dataset

The project uses the **E-commerce Behavior Data from Multi-Category Store** dataset from Kaggle: https://www.kaggle.com/datasets/mkechinov/ecommerce-behavior-data-from-multi-category-store/data?select=2019-Nov.csv

The original dataset contains e-commerce events such as:

- `view`
- `cart`
- `purchase`

along with information about products, categories, brands, prices, users, and sessions.

For this project, the analysis focused on the **February 2020 dataset**.

The February file contained approximately **55 million events**. Because of its large size, the data was processed in chunks using Python instead of loading the entire file into memory at once.

For the cart abandonment analysis, the focus was specifically on **cart events**, resulting in **2,656,528 cart records** after processing and cleaning.

The final cart-level dataset included information such as:

- Event time
- Product ID
- Category
- Brand
- Price
- User ID
- User session
- Purchase status
- Date
- Hour
- Day of week

The processed data was then used across **Python, SQL, and Power BI** to complete the analysis and build the final dashboard.

## 7. Dashboard Screenshots

### Executive Overview
![Executive Overview](https://github.com/DivyaBasantray/Cart-Abandonment-Pattern-Analysis/blob/main/Dashboard/Executive%20Overview.png)

### Abandonment Drivers
![Abandonment Drivers](https://github.com/DivyaBasantray/Cart-Abandonment-Pattern-Analysis/blob/main/Dashboard/Abandonment%20Drivers.png)

### Customer & Session Behavior
![Customer & Session Behavior](https://github.com/DivyaBasantray/Cart-Abandonment-Pattern-Analysis/blob/main/Dashboard/Customer%20%26%20Session%20Behavior.png)

### Funnel Analysis
![Funnel Analysis](https://github.com/DivyaBasantray/Cart-Abandonment-Pattern-Analysis/blob/main/Dashboard/Funnel%20Analysis.png)
