-- Objective 1
-- Explore the items table
-- Your first objective is to better understand the items table by finding the number of rows in the table, the least and most expensive items, and the item prices within each category.

use restaurant_db;

-- 1. view the menu_items table.

select * 
from menu_items;

-- 2. Find the number of items on the menu.

select count(*) as number_of_items
from menu_items;

-- 3. what are the least and most expensive items on the menu?

select max(price) as most_expensive_item, min(price) as least_expensive_item
from menu_items;

-- 4. How many Italian dishes are on the menu?

select count(*) as number_of_Italian_dishes
from menu_items
where category = 'Italian';

-- 5. what are the least and most expensive Italian dishes on the menu?

select max(price) as most_expensive_item, min(price) as least_expensive_item
from menu_items
where category = 'Italian';

-- 6. How many dishes are in each category?

select category, count(menu_item_id) as number_of_dishes
from menu_items
group by category;

-- 7. What is the average dish price within each category?

select category, round(avg(price), 2) as avg_price
from menu_items
group by category;

-- Objective 2
-- Explore the orders table
-- Your second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.

-- 1. View the order_details table. 

select *
from order_details;

-- 2. What is the date range of the table?

select min(order_date) as start_date, max(order_date) as end_date
from order_details;

-- 3. How many orders were made within this date range? 

select count(distinct order_id) as total_orders
from order_details;

-- 4. How many items were ordered within this date range?

select count(*)
from order_details;

-- 5. Which orders had the most number of items?

select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

-- 6. How many orders had more than 12 items?

select count(*) orders_more_than_12_items
from
	(select order_id, count(item_id) as num_items
	from order_details
	group by order_id
	having num_items > 12) as num_orders;

-- Objective 3
-- Analyze customer behavior
-- Your final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.

-- 1. Combine the menu_items and order_details tables into a single table

select *
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?

select item_name, count(order_details_id) as num_purchases
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases;

select item_name, count(order_details_id) as num_purchases
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases desc;

select item_name, category, count(order_details_id) as num_purchases
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases;

-- 3. What were the top 5 orders that spent the most money?

select order_id, sum(price) as total_spent
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spent desc
limit 5;

-- 4. View the details of the highest spend order. Which specific items were purchased?

select category, count(item_id) as num_items
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- 6. BONUS: View the details of the top 5 highest spend orders.

select order_id, category, count(item_id) as num_items
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
where order_id in(440, 2075, 1957, 330, 2675)
group by category, order_id;

-- Final Step
-- Final Project Question
-- Answer the following question to validate your completed project.
-- How much was the most expensive order in the dataset?
 
select order_id, sum(price) as total_spent
from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spent desc
limit 1;
-- order_id = 440, total_spent=	192.15
