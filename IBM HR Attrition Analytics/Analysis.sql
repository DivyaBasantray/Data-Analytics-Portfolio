-- UNDERSTANDING AND ANALYZING THE DATASET

USE ibm_hr_attrition;

SELECT *
FROM ibm_hr_attrition
LIMIT 10;

-- CREATING A DUPLICATE TABLE 

CREATE TABLE attrition_staging2
LIKE ibm_hr_attrition;

INSERT attrition_staging2
SELECT *
FROM ibm_hr_attrition;

SELECT *
FROM attrition_staging2;

DESCRIBE attrition_staging2;

-- REMOVE IRRELEVANT COLUMNS
 
ALTER TABLE attrition_staging2
DROP COLUMN Over18,
DROP COLUMN StandardHours,
DROP COLUMN EmployeeCount;

-- CHANGE COLUMN NAME 

ALTER TABLE attrition_staging2
CHANGE COLUMN ï»¿Age Age INT;

-- HANDLE MISSING VALUES 

SELECT COUNT(*)
FROM attrition_staging2
WHERE JobSatisfaction IS NULL;

-- CHECK ROW AND COLUMN COUNT 
-- 1

SELECT COUNT(*)
FROM attrition_staging2 AS total_rows;

-- 2

DESCRIBE attrition_staging2;

-- CHECK FOR NULL VALUES
 
SELECT 
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_nulls,
	SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition_nulls,
	SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department_nulls,
	SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS EmployeeNumber_nulls,
	SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS JobRole_nulls
FROM attrition_staging2;

-- CHECK FOR BLANK VALUES

SELECT 
	SUM(CASE WHEN Department = '' THEN 1 ELSE 0 END) AS Age_blanks,
	SUM(CASE WHEN BusinessTravel = '' THEN 1 ELSE 0 END) AS BusinessTravel_blanks,
	SUM(CASE WHEN Gender = '' THEN 1 ELSE 0 END) AS Gender_blanks,
	SUM(CASE WHEN EducationField = '' THEN 1 ELSE 0 END) AS EducationField_blanks,
	SUM(CASE WHEN JobRole = '' THEN 1 ELSE 0 END) AS JobRole_blanks
FROM attrition_staging2;

-- CHECK FOR DUPLICATES

SELECT
	Age, Gender, Department, JobRole, MonthlyIncome, Attrition, 
    COUNT(*) AS dup_count
FROM attrition_staging2
GROUP BY Age, Gender, Department, JobRole, MonthlyIncome, Attrition
HAVING dup_count > 1;

-- CHECK UNIQUE VALUES PER CATEGORICAL COLUMNS 
 
SELECT COUNT(DISTINCT Gender) AS unique_gender
FROM attrition_staging2;

SELECT COUNT(DISTINCT Department) AS unique_Department
FROM attrition_staging2;

SELECT COUNT(DISTINCT JobRole) AS unique_JobRole
FROM attrition_staging2;

SELECT COUNT(DISTINCT EducationField) AS unique_EducationField
FROM attrition_staging2;

-- to be 100% sure, in order to catch small spelling/ case issues, still run a quick DISTINCT once per coulmn 

SELECT DISTINCT Gender
FROM attrition_staging2; 

SELECT DISTINCT Department
FROM attrition_staging2;

SELECT DISTINCT JobRole
FROM attrition_staging2;

SELECT DISTINCT EducationField
FROM attrition_staging2;

-- STANDARDIZE TEXT COLUMNS 
-- SINCE ALL THE COLUMNS WITH THEIR ELEMENTS ARE PERFECTLY STANDARDIZED, HENCE I'LL BE STANDARDIZING ONLY  BUSINESS TRAVEL COLUMN
-- NON-TRAVEL  IS ALREADY STANDARDIZED

UPDATE attrition_staging2
SET BusinessTravel = 'Travel Rarely'
WHERE UPPER(TRIM(BusinessTravel)) IN ('TRAVEL_RARELY', 'TRAVEL RARELY');

UPDATE attrition_staging2
SET BusinessTravel = 'Travel Frequently'
WHERE UPPER(TRIM(BusinessTravel)) IN ('TRAVEL_FREQUENTLY', 'TRAVEL FREQUENTLY');


SELECT DISTINCT BusinessTravel
FROM attrition_staging2;

-- CHECK NUMERIC COLUMNS
-- DEMOGRAPHICS
-- 1. AGE

SELECT 
	MIN(Age) AS Min_Age,
	MAX(Age) AS Max_Age,
	AVG(Age) AS Avg_Age
FROM attrition_staging2;

-- 2. DISTANCEFROMHOME 

SELECT 
	MIN(DistanceFromHome) AS Min_DistanceFromHome,
	MAX(DistanceFromHome) AS Max_DistanceFromHome,
	AVG(DistanceFromHome) AS Avg_DistanceFromHome
FROM attrition_staging2;

-- SALARY & FINANCIALS
-- 3. MONTHLYINCOME  

SELECT 
	MIN(MonthlyIncome) AS Min_MonthlyIncome,
	MAX(MonthlyIncome) AS Max_MonthlyIncome,
	AVG(MonthlyIncome) AS Avg_MonthlyIncome
FROM attrition_staging2;

-- CAREER PROGRESSION
-- 4. TOTALWORKINGYEARS

SELECT 
	MIN(TotalWorkingYears) AS Min_TotalWorkingYears,
	MAX(TotalWorkingYears) AS Max_TotalWorkingYears,
	AVG(TotalWorkingYears) AS Avg_TotalWorkingYears
FROM attrition_staging2;
   
-- 5. YEARSATCOMPANY 

SELECT 
	MIN(YearsAtCompany) AS Min_YearsAtCompany,
	MAX(YearsAtCompany) AS Max_YearsAtCompany,
	AVG(YearsAtCompany) AS Avg_YearsAtCompany
FROM attrition_staging2;

-- 6. YEARSSINCELASTPROMOTION

SELECT 
	MIN(YearsSinceLastPromotion) AS Min_YearsSinceLastPromotion,
	MAX(YearsSinceLastPromotion) AS Max_YearsSinceLastPromotion,
	AVG(YearsSinceLastPromotion) AS Avg_YearsSinceLastPromotion
FROM attrition_staging2;


-- 7. YEARSWITHCURRMANAGER

SELECT 
	MIN(YearsWithCurrManager) AS Min_YearsWithCurrManager,
	MAX(YearsWithCurrManager) AS Max_YearsWithCurrManager,
	AVG(YearsWithCurrManager) AS Avg_YearsWithCurrManager
FROM attrition_staging2;


-- 8. YEARSINCURRENTROLE 

SELECT 
	MIN(YearsInCurrentRole) AS Min_YearsInCurrentRole,
	MAX(YearsInCurrentRole) AS Max_YearsInCurrentRole,
	AVG(YearsInCurrentRole) AS Avg_YearsInCurrentRole
FROM attrition_staging2;

-- CAREER STABILITY
-- 9. NUMCOMPANIESWORKED 

SELECT 
	MIN(NumCompaniesWorked) AS Min_NumCompaniesWorked,
	MAX(NumCompaniesWorked) AS Max_NumCompaniesWorked,
	AVG(NumCompaniesWorked) AS Avg_NumCompaniesWorked
FROM attrition_staging2;

-- SATISFACTION AND ENGAGEMENT
-- 10. JOBSATISFACTION

SELECT 
	MIN(JobSatisfaction) AS Min_JobSatisfaction,
	MAX(JobSatisfaction) AS Max_JobSatisfaction,
	AVG(JobSatisfaction) AS Avg_JobSatisfaction
FROM attrition_staging2;

-- 11. WORKLIFEBALANCE

SELECT 
	MIN(WorkLifeBalance) AS Min_WorkLifeBalance,
	MAX(WorkLifeBalance) AS Max_WorkLifeBalance,
	AVG(WorkLifeBalance) AS Avg_WorkLifeBalance
FROM attrition_staging2;

-- 12. ENVIRONMENTSATISFACTION

SELECT 
	MIN(EnvironmentSatisfaction) AS Min_EnvironmentSatisfaction,
	MAX(EnvironmentSatisfaction) AS Max_EnvironmentSatisfaction,
	AVG(EnvironmentSatisfaction) AS Avg_EnvironmentSatisfaction
FROM attrition_staging2;

-- 13. RELATIONSHIPSATISFACTION

SELECT 
	MIN(RelationshipSatisfaction) AS Min_RelationshipSatisfaction,
	MAX(RelationshipSatisfaction) AS Max_RelationshipSatisfaction,
	AVG(RelationshipSatisfaction) AS Avg_RelationshipSatisfaction
FROM attrition_staging2;

-- 14. PERFORMANCERATING 

SELECT 
	MIN(PerformanceRating) AS Min_PerformanceRating,
	MAX(PerformanceRating) AS Max_PerformanceRating,
	AVG(PerformanceRating) AS Avg_PerformanceRating
FROM attrition_staging2;
