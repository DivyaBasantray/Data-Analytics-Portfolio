-- STEP 1: VERIFICATION OF DATA IMPORT
-- 1. IMPORT THE CSV/DATA

CREATE DATABASE swiggy;

USE swiggy;

CREATE TABLE swiggy_raw(
  State VARCHAR(150),
  City VARCHAR(150),
  `Restaurant Name` VARCHAR(255),
  Location VARCHAR(255),
  Category VARCHAR(150),
  `Dish Name` VARCHAR(255),
  `Price (INR)` DECIMAL(10,2),
  Rating DECIMAL(3,1),
  `Rating Count` INT
);

SET GLOBAL local_infile = 1;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SHOW GLOBAL VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/swiggy_all_menus_india.csv'
INTO TABLE swiggy_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(State, City, `Restaurant Name`, Location, Category, `Dish Name`, `Price (INR)`, Rating, `Rating Count`);


-- 2. CHECK THE COUNT OF TOTAL ROWS

SELECT COUNT(*) AS total_rows
FROM swiggy_raw_new;

-- 3. VERIFY COLUMN NAMES

DESCRIBE swiggy_raw_new;

-- 4. PREVIEW FIRST 10 ROWS

SELECT *
FROM  swiggy_raw_new
LIMIT 10;

-- STEP 2: VALIDATION AND INITIAL DATA QUALITY CHECKS
-- 5. CHECK FOR EMPTY OR NULL VALUES

SELECT
	SUM(CASE WHEN State IS NULL OR TRIM(State) = '' THEN 1 ELSE 0 END) AS empty_state,
    SUM(CASE WHEN City IS NULL OR TRIM(City) = '' THEN 1 ELSE 0 END) AS empty_city,
	SUM(CASE WHEN `Restaurant Name` IS NULL OR TRIM(`Restaurant Name`) = '' THEN 1 ELSE 0 END) AS empty_Restaurant,
    SUM(CASE WHEN Location IS NULL OR TRIM(Location) = '' THEN 1 ELSE 0 END) AS empty_location,
    SUM(CASE WHEN Category IS NULL OR TRIM(Category) = '' THEN 1 ELSE 0 END) AS empty_category,
    SUM(CASE WHEN `Dish Name` IS NULL OR TRIM(`Dish Name`) = '' THEN 1 ELSE 0 END) AS empty_dish,
    SUM(CASE WHEN `Price (INR)` IS NULL OR TRIM(`Price (INR)`) = '' THEN 1 ELSE 0 END) AS empty_price,
    SUM(CASE WHEN Rating IS NULL OR TRIM(Rating) = '' THEN 1 ELSE 0 END) AS empty_rating,
    SUM(CASE WHEN `Rating Count` IS NULL OR TRIM(`Rating Count`) = '' THEN 1 ELSE 0 END) AS empty_rating_count
FROM swiggy_raw_new;


-- 6. CHECK FOR DUPLICATES
  
SELECT 
	COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT_WS('|', State, City, `Restaurant Name`, `Dish Name`, `Price (INR)`)) AS distinct_combinations
FROM swiggy_raw_new;

-- 7. IDENTIFY 0 RATINGS OR 0 RATING COUNTS
 
SELECT 
	SUM(CASE WHEN Rating = 0 THEN 1 ELSE 0 END) AS zero_rating,
	SUM(CASE WHEN `Rating Count` = 0 THEN 1 ELSE 0 END) AS zero_rating_count
FROM swiggy_raw_new;
    
-- 8. PRICE SANITY CHECK 

SELECT
	MIN(`Price (INR)`) AS min_price,
    MAX(`Price (INR)`) AS max_price,
    AVG(`Price (INR)`) AS avg_price
FROM swiggy_raw_new;

-- 9. PREVIEW A FEW POTENTIAL OUTLIERS 

SELECT *
FROM swiggy_raw_new
WHERE `Price (INR)` > 2000 OR `Price (INR)` = 0
LIMIT 20;

-- STEP 3: DATA CLEANING AND TRANSFORMATIONS
-- 10. REMOVE EXACT DUPLICATES (CREATE A DUPLICATE TABLE)

DROP TABLE IF EXISTS swiggy_dedup;

CREATE TABLE swiggy_dedup AS
SELECT 
  State,
  City,
  `Restaurant Name`,
  `Dish Name`,
  `Price (INR)`,
  ROUND(AVG(Rating), 1) AS Rating,
  ROUND(AVG(`Rating Count`), 0) AS `Rating Count`
FROM swiggy_raw_new
GROUP BY 
  State, City, `Restaurant Name`, `Dish Name`, `Price (INR)`;

SELECT COUNT(*) AS total_rows 
FROM swiggy_dedup;

DESCRIBE swiggy_dedup;


-- 11. CONVERT 0 RATINGS AND 0 RATING COUNTS TO NULL

UPDATE swiggy_dedup
SET Rating = NULL
WHERE Rating = 0;

UPDATE swiggy_dedup
SET `Rating Count` = NULL
WHERE `Rating Count` = 0;

SELECT 
  SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_rating_now,
  SUM(CASE WHEN `Rating Count` IS NULL THEN 1 ELSE 0 END) AS null_rating_count_now
FROM swiggy_dedup;

-- 12. TRIM EXTRA SPACES

UPDATE swiggy_dedup
SET 
  State = TRIM(State),
  City = TRIM(City),
  `Restaurant Name` = TRIM(`Restaurant Name`),
  `Dish Name` = TRIM(`Dish Name`);

SELECT State, City, `Restaurant Name`, `Dish Name`
FROM swiggy_dedup
LIMIT 10;

-- 13. CREATE FINAL TABLE

DROP TABLE IF EXISTS swiggy_cleaned;

CREATE TABLE swiggy_cleaned AS
SELECT 
  State,
  City,
  `Restaurant Name`,
  `Dish Name`,
  `Price (INR)`,
  Rating,
  `Rating Count`
FROM swiggy_dedup;

SELECT COUNT(*) AS total_rows 
FROM swiggy_cleaned;

SELECT * 
FROM swiggy_cleaned
LIMIT 10;