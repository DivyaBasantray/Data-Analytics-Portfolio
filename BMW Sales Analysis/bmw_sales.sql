USE bmw_project;

-- CHECK TOTAL ROWS AND COLUMNS
SELECT COUNT(*) AS total_rows
FROM bmw_sales;

-- VIEW SAMPLE DATA
SELECT *
FROM bmw_sales
LIMIT 10;

-- CHECKING COLUMN NAMES AND DATA TYPES
DESCRIBE bmw_sales;

-- CHECKING FOR MISSING/BLANK VALUES
SELECT
	SUM(CASE WHEN Model IS NULL OR Model = '' THEN 1 ELSE 0 END) AS missing_Model,
	SUM(CASE WHEN Year IS NULL OR Year = '' THEN 1 ELSE 0 END) AS missing_Year,
	SUM(CASE WHEN Region IS NULL OR Region = '' THEN 1 ELSE 0 END) AS missing_Region,
	SUM(CASE WHEN Color IS NULL OR Color = '' THEN 1 ELSE 0 END) AS missing_Color,
	SUM(CASE WHEN Fuel_Type IS NULL OR Fuel_Type = '' THEN 1 ELSE 0 END) AS missing_Fuel_Type,
	SUM(CASE WHEN Transmission IS NULL OR Transmission = '' THEN 1 ELSE 0 END) AS missing_Transmission,
	SUM(CASE WHEN Engine_Size_L IS NULL OR Engine_Size_L = '' THEN 1 ELSE 0 END) AS missing_Engine_Size_L,
	SUM(CASE WHEN Mileage_KM IS NULL OR Mileage_KM = '' THEN 1 ELSE 0 END) AS missing_Mileage_KM,
	SUM(CASE WHEN Price_USD IS NULL OR Price_USD = '' THEN 1 ELSE 0 END) AS missing_Price_USD,
	SUM(CASE WHEN Sales_Volume IS NULL OR Sales_Volume = '' THEN 1 ELSE 0 END) AS missing_Sales_Volume,
	SUM(CASE WHEN Sales_Classification IS NULL OR Sales_Classification = '' THEN 1 ELSE 0 END) AS missing_Sales_Classification
FROM bmw_sales;

-- CHECKING FOR DUPLICATE ROWS
SELECT Model, Year, Region, Color, Fuel_Type, Transmission, Engine_Size_L, Mileage_KM, Price_USD, Sales_Volume, Sales_Classification, 
COUNT(*)
FROM bmw_sales
GROUP BY Model, Year, Region, Color, Fuel_Type, Transmission, Engine_Size_L, Mileage_KM, Price_USD, Sales_Volume, Sales_Classification
HAVING COUNT(*) > 1;

SELECT Model, Year, Region, 
COUNT(*)
FROM bmw_sales
GROUP BY Model, Year, Region
HAVING COUNT(*) > 1;

SELECT Model, Year, Region, Fuel_Type, Transmission, 
COUNT(*) AS duplicates
FROM bmw_sales
GROUP BY Model, Year, Region, Fuel_Type, Transmission
HAVING COUNT(*) > 1;

SELECT DISTINCT Fuel_Type, Transmission, Color
FROM bmw_sales
WHERE Model = '5 Series' AND Year = 2016 AND Region = 'Asia';

-- CHECKING FOR OUTLIERS
SELECT
	MIN(Engine_Size_L) AS min_engine,
    MAX(Engine_Size_L) AS max_engine,
    AVG(Engine_Size_L) AS avg_engine,
    MIN(Mileage_KM) AS min_mileage,
    MAX(Mileage_KM) AS max_mileage,
    AVG(Mileage_KM) AS avg_mileage,
    MIN(Price_USD) AS min_price,
    MAX(Price_USD) AS max_price,
    AVG(Price_USD) AS avg_price,
    MIN(Sales_Volume)AS min_sales,
    MAX(Sales_Volume) AS max_sales,
    AVG(Sales_Volume) AS avg_sales
FROM bmw_sales;
 
SELECT 
  SUM(Mileage_KM = 0) AS zero_mileage_count,
  SUM(Sales_Volume = 100) AS min_sales_count,
  SUM(Sales_Volume = 9999) AS max_sales_count
FROM bmw_sales;

-- ADDITION OF A NEW COLUMN
ALTER TABLE bmw_sales
ADD COLUMN Revenue DECIMAL(15,2);

UPDATE bmw_sales
SET Revenue = Price_USD * Sales_Volume;

SELECT Model, Year, Region, Price_USD, Sales_Volume, Revenue
FROM bmw_sales
LIMIT 10;

-- CHECKS FOR TEXT STANDARDIZATION
SELECT DISTINCT Region
FROM bmw_sales;

SELECT DISTINCT Color
FROM bmw_sales;

SELECT DISTINCT Fuel_Type
FROM bmw_sales;

SELECT DISTINCT Transmission
FROM bmw_sales;

SELECT DISTINCT Sales_Classification
FROM bmw_sales;

-- CHECKS FOR VALUE RANGES BY YEAR
SELECT Year, MIN(Price_USD), MAX(Price_USD), AVG(Price_USD)
FROM bmw_sales
GROUP BY Year
ORDER BY Year;

SELECT
  COUNT(DISTINCT Model) AS unique_models,
  COUNT(DISTINCT Region) AS unique_regions,
  COUNT(DISTINCT Fuel_Type) AS unique_fuels,
  COUNT(DISTINCT Transmission) AS unique_transmissions
FROM bmw_sales;