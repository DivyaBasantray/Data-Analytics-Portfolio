-- STEP 1: VERIFICATION OF DATA IMPORT
-- 1. IMPORT THE CSV/DATA

CREATE DATABASE airbnb;

USE airbnb;

CREATE TABLE airbnb_raw (
  address TEXT,
  isHostedBySuperhost BOOLEAN,
  `location/lat` DOUBLE,
  `location/lng` DOUBLE,
  name TEXT,
  numberOfGuests INT,
  `pricing/rate/amount` INT,
  roomType TEXT,
  stars DOUBLE
);

ALTER TABLE airbnb_raw DROP COLUMN dummy_col;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Airbnb_India_Top_500.csv'
INTO TABLE airbnb_raw
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(address, isHostedBySuperhost, `location/lat`, `location/lng`, name, numberOfGuests,
 `pricing/rate/amount`, roomType, stars);

-- STEP 2: DATA VALIDATION
-- 2. CHECK THE COUNT OF TOTAL ROWS

SELECT COUNT(*) FROM airbnb_raw;

-- 3. PREVIEW FIRST 5 ROWS

SELECT * FROM airbnb_raw LIMIT 5;

-- 4. VERIFY COLUMN NAMES

DESCRIBE airbnb_raw;

-- 5.  NULL VALUE CHECK FOR EACH COLUMN 

SELECT 
  SUM(address IS NULL OR address = '') AS address_nulls,
  SUM(isHostedBySuperhost IS NULL OR isHostedBySuperhost = '') AS superhost_nulls,
  SUM(`location/lat` IS NULL) AS lat_nulls,
  SUM(`location/lng` IS NULL) AS lng_nulls,
  SUM(name IS NULL OR name = '') AS name_nulls,
  SUM(numberOfGuests IS NULL) AS guests_nulls,
  SUM(`pricing/rate/amount` IS NULL OR `pricing/rate/amount` = '') AS price_nulls,
  SUM(roomType IS NULL OR roomType = '') AS roomtype_nulls,
  SUM(stars IS NULL OR stars = '') AS stars_nulls
FROM airbnb_raw;

-- 6. DUPLICATE RECORDS CHECK

SELECT 
    address, name, COUNT(*) AS duplicate_count
FROM airbnb_raw
GROUP BY address, name
HAVING COUNT(*) > 1;

-- 7. BASIC RANGE VALIDATIONS

SELECT 
  MIN(`location/lat`) AS min_lat, MAX(`location/lat`) AS max_lat,
  MIN(`location/lng`) AS min_lng, MAX(`location/lng`) AS max_lng,
  MIN(`pricing/rate/amount`) AS min_price, MAX(`pricing/rate/amount`) AS max_price
FROM airbnb_raw;
  
-- 8. ROOM TYPE FREQUENCY

SELECT roomType, COUNT(*) AS count
FROM airbnb_raw
GROUP BY roomType
ORDER BY count DESC;
   
-- 9. SUPERHOST DISTRIBUTION

SELECT isHostedBySuperhost, COUNT(*) AS count
FROM airbnb_raw
GROUP BY isHostedBySuperhost;

-- STEP 3: SQL CLEANING
-- 10. REMOVE DUPLICATES

CREATE TABLE airbnb_dedup AS
SELECT * FROM airbnb_raw
WHERE (address, name) NOT IN (
  SELECT address, name
  FROM airbnb_raw
  GROUP BY address, name
  HAVING COUNT(*) > 1
)
UNION
SELECT * FROM airbnb_raw
WHERE (address, name) IN (
  SELECT address, name
  FROM airbnb_raw
  GROUP BY address, name
  HAVING COUNT(*) = 1
);

SELECT COUNT(*) FROM airbnb_dedup;

-- 11. FIX INVALID LONGITUDE

UPDATE airbnb_dedup
SET `location/lng` = NULL
WHERE `location/lng` < 68 OR `location/lng` > 97.5;

SELECT MIN(`location/lng`), MAX(`location/lng`) FROM airbnb_dedup;

-- 12. CLEAN ROOMTYPE VALUES

UPDATE airbnb_dedup
SET roomType = CASE
  WHEN roomType LIKE '%entire%' THEN 'Entire place'
  WHEN roomType LIKE '%private%' THEN 'Private room'
  WHEN roomType LIKE '%shared%' THEN 'Shared room'
  WHEN roomType LIKE '%room in%' THEN 'Room in hotel/home'
  ELSE roomType
END;

SELECT roomType, COUNT(*) 
FROM airbnb_dedup
GROUP BY roomType
ORDER BY COUNT(*) DESC;

-- 13. HANDLE MISSING STARS

-- 1️⃣ Calculate the average stars (excluding blanks)
SET @avg_stars = (
  SELECT ROUND(AVG(CAST(stars AS DECIMAL(3,2))), 1)
  FROM airbnb_dedup
  WHERE stars IS NOT NULL AND stars != ''
);

-- 2️⃣ Replace NULL or blank stars with that average
UPDATE airbnb_dedup
SET stars = @avg_stars
WHERE stars IS NULL OR stars = '';

SELECT COUNT(*) AS missing_stars
FROM airbnb_dedup
WHERE stars IS NULL OR stars = '';

-- 14. CREATE FINAL TABLE

CREATE TABLE airbnb_clean AS
SELECT 
  address,
  isHostedBySuperhost,
  `location/lat`,
  `location/lng`,
  name,
  numberOfGuests,
  `pricing/rate/amount`,
  roomType,
  stars
FROM airbnb_dedup;

SELECT COUNT(*) FROM airbnb_clean;

SELECT * FROM airbnb_clean LIMIT 5;
