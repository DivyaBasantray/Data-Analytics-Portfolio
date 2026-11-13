CREATE DATABASE telco_churn;

USE telco_churn;

-- MAKE A DUPLICATE TABLE AND THEN RUN ALL THE UPDATE QUERIES (OG - customer_churn)

CREATE TABLE customers (
  customerID VARCHAR(50),
  gender VARCHAR(10),
  SeniorCitizen INT,
  Partner VARCHAR(10),
  Dependents VARCHAR(10),
  tenure INT,
  PhoneService VARCHAR(10),
  MultipleLines VARCHAR(30),
  InternetService VARCHAR(30),
  OnlineSecurity VARCHAR(30),
  OnlineBackup VARCHAR(30),
  DeviceProtection VARCHAR(30),
  TechSupport VARCHAR(30),
  StreamingTV VARCHAR(30),
  StreamingMovies VARCHAR(30),
  Contract VARCHAR(30),
  PaperlessBilling VARCHAR(10),
  PaymentMethod VARCHAR(50),
  MonthlyCharges DECIMAL(10,2),
  TotalCharges VARCHAR(20),
  Churn VARCHAR(10)
);

TRUNCATE TABLE customers;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customer_Churn.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



-- STEP 1: BASIC DATA OVERVIEW (STRUCTURE AND QUALITY CHECK)
-- A) CREATE TABLE STRUCTURE

DESCRIBE customers;

SELECT COUNT(*) 
FROM customers;

-- B) PREVIEW 1ST 10 ROWS 

SELECT * 
FROM customers
LIMIT 10;

-- C) CHECK TOTAL NUMBER OF ROWS 

SELECT COUNT(*) 
FROM customers;

-- D) CHECK FOR DUPLICATE customerIDS 

SELECT customerID,
COUNT(*) AS frequency
FROM customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-- E) CHECK FOR NULL AND BLANK VALUES IN EACH COLUMN 

SELECT
	SUM(CASE WHEN customerID IS NULL OR customerID = '' THEN 1 ELSE 0 END) AS missing_customerID,
	SUM(CASE WHEN gender IS NULL OR gender = '' THEN 1 ELSE 0 END) AS missing_gender,
	SUM(CASE WHEN SeniorCitizen IS NULL OR SeniorCitizen = '' THEN 1 ELSE 0 END) AS missing_SeniorCitizen,
	SUM(CASE WHEN Partner IS NULL OR Partner = '' THEN 1 ELSE 0 END) AS missing_Partner,
	SUM(CASE WHEN Dependents IS NULL OR Dependents = '' THEN 1 ELSE 0 END) AS missing_Dependents,
	SUM(CASE WHEN tenure IS NULL OR tenure = '' THEN 1 ELSE 0 END) AS missing_tenure,
	SUM(CASE WHEN PhoneService IS NULL OR PhoneService = '' THEN 1 ELSE 0 END) AS missing_PhoneService,
	SUM(CASE WHEN MultipleLines IS NULL OR MultipleLines = '' THEN 1 ELSE 0 END) AS missing_MultipleLines,
	SUM(CASE WHEN InternetService IS NULL OR InternetService = '' THEN 1 ELSE 0 END) AS missing_InternetService,
	SUM(CASE WHEN OnlineSecurity IS NULL OR OnlineSecurity = '' THEN 1 ELSE 0 END) AS missing_OnlineSecurity,
	SUM(CASE WHEN OnlineBackup IS NULL OR OnlineBackup = '' THEN 1 ELSE 0 END) AS missing_OnlineBackup,
	SUM(CASE WHEN DeviceProtection IS NULL OR DeviceProtection = '' THEN 1 ELSE 0 END) AS missing_DeviceProtection,
	SUM(CASE WHEN TechSupport IS NULL OR TechSupport = '' THEN 1 ELSE 0 END) AS missing_TechSupport,
	SUM(CASE WHEN StreamingTV IS NULL OR StreamingTV = '' THEN 1 ELSE 0 END) AS missing_StreamingTV,
	SUM(CASE WHEN StreamingMovies IS NULL OR StreamingMovies = '' THEN 1 ELSE 0 END) AS missing_StreamingMovies,
	SUM(CASE WHEN Contract IS NULL OR Contract = '' THEN 1 ELSE 0 END) AS missing_Contract,
	SUM(CASE WHEN PaperlessBilling IS NULL OR PaperlessBilling = '' THEN 1 ELSE 0 END) AS missing_PaperlessBilling,
	SUM(CASE WHEN PaymentMethod IS NULL OR PaymentMethod = '' THEN 1 ELSE 0 END) AS missing_PaymentMethod,
	SUM(CASE WHEN MonthlyCharges IS NULL OR MonthlyCharges = '' THEN 1 ELSE 0 END) AS missing_MonthlyCharges,
	SUM(CASE WHEN TotalCharges IS NULL OR TotalCharges = '' THEN 1 ELSE 0 END) AS missing_TotalCharges,
	SUM(CASE WHEN Churn IS NULL OR Churn = '' THEN 1 ELSE 0 END) AS missing_Churn  
FROM customers;

-- F) CHECK RANGE FOR NUMERIC VALUES

SELECT
	MIN(tenure) AS Min_tenure,
	MAX(tenure) AS Max_tenure,
	MIN(MonthlyCharges) AS Min_MonthlyCharges,
	MAX(MonthlyCharges) AS Max_MonthlyCharges,
	MIN(TotalCharges) AS Min_TotalCharges,
	MAX(TotalCharges) AS Max_TotalCharges
FROM customers;

-- G) CHECK UNIQUE CATEGORIES IN IMPORTANT COLUMNS

SELECT DISTINCT gender 
FROM customers;

SELECT DISTINCT InternetService 
FROM customers;

SELECT DISTINCT Contract 
FROM customers;

SELECT DISTINCT PaymentMethod 
FROM customers;

SELECT DISTINCT Churn 
FROM customers;

-- STEP 2: DATA CLEANING & TYPE CORRECTION
-- A) CHECK WHAT'S INSIDE SeniorCitizen (CONFIRM ISSUE)

SELECT DISTINCT SeniorCitizen 
FROM customers;

-- B) REPLACE BLANKS OR NULLS IN SeniorCitizen WITH 0 (ASSUMING MISSING MEANS "NOT A SENIOR")

UPDATE customers
SET SeniorCitizen = 0
WHERE SeniorCitizen IS NULL OR SeniorCitizen = '';

-- THEN CONVERT COLUMN TYPE INTO INTEGER:

ALTER TABLE customers
MODIFY SeniorCitizen INT;

-- C) FIX TotalCharges
-- i) FIND ROWS WITH BLANK OR NON-NUMERIC VALUES:

SELECT customerID, TotalCharges
FROM customers
WHERE TRIM(TotalCharges) = '' OR TotalCharges REGEXP'[^0-9.]';

-- ii) SET THOSE BLANKS TO NULL:

UPDATE customers
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '' OR TotalCharges REGEXP '[^0-9.]';

-- iii) CONVERT TotalCharges COLUMN TO A PROPER NUMERIC TYPE:

ALTER TABLE customers
MODIFY TotalCharges DECIMAL (10,2);

-- D)  CHECK THE MISSING TENURE ROWS

SELECT customerID, tenure, MonthlyCharges, TotalCharges
FROM customers
WHERE tenure IS NULL OR tenure = '';

-- *) FINAL CLEANING FIX 
-- a) REPLACE BLANKS IN TotalCharges WITH 0 

UPDATE customers
SET TotalCharges = 0
WHERE TRIM(TotalCharges) = '' OR TotalCharges IS NULL;

-- b) CONVERT TotalCharges TO DECIMAL

ALTER TABLE customers
MODIFY TotalCharges DECIMAL (10,2); 

-- C) VERIFY THE FIX

SELECT MIN(TotalCharges), MAX(TotalCharges)
FROM customers; 

--  STEP 3: EXPORT THE CLEANED DATA FOR EDA

SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Telco_Churn_Clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
FROM customers;


