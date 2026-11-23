-- Creating database 

CREATE DATABASE patient_readmission;

USE patient_readmission;

-- Preview the data

SELECT COUNT(*) FROM diabetic_data;

SELECT *
FROM diabetic_data
LIMIT 10;

-- Understand the columns

DESCRIBE diabetic_data;

-- Check the readmission categories
 
SELECT readmitted, count(*) AS patient_count
FROM diabetic_data
GROUP BY readmitted
ORDER BY patient_count DESC;

-- Calculate readmission percentages
 
SELECT 
	readmitted, 
    count(*) AS encounter_count,
    round(count(*) * 100.0 / sum(count(*)) OVER(), 2) AS percentage
FROM diabetic_data
GROUP BY readmitted
ORDER BY encounter_count DESC;

-- Check missing values

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN age IS NULL OR age = '?'
        THEN 1 ELSE 0
    END) AS missing_age,

    SUM(CASE
        WHEN gender IS NULL OR gender = 'Unknown/Invalid'
        THEN 1 ELSE 0
    END) AS unknown_gender,

    SUM(CASE
        WHEN weight IS NULL OR weight = '?'
        THEN 1 ELSE 0
    END) AS missing_weight,

    SUM(CASE
        WHEN medical_specialty IS NULL
             OR medical_specialty = '?'
        THEN 1 ELSE 0
    END) AS missing_medical_specialty,

    SUM(CASE
        WHEN payer_code IS NULL OR payer_code = '?'
        THEN 1 ELSE 0
    END) AS missing_payer_code

FROM diabetic_data;

-- Check whether key analysis columns are reliable

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN readmitted IS NULL OR readmitted = '?'
        THEN 1 ELSE 0
    END) AS missing_readmitted,

    SUM(CASE
        WHEN time_in_hospital IS NULL
        THEN 1 ELSE 0
    END) AS missing_hospital_stay,

    SUM(CASE
        WHEN number_inpatient IS NULL
        THEN 1 ELSE 0
    END) AS missing_inpatient_visits,

    SUM(CASE
        WHEN number_emergency IS NULL
        THEN 1 ELSE 0
    END) AS missing_emergency_visits,

    SUM(CASE
        WHEN number_outpatient IS NULL
        THEN 1 ELSE 0
    END) AS missing_outpatient_visits,

    SUM(CASE
        WHEN num_medications IS NULL
        THEN 1 ELSE 0
    END) AS missing_medications,

    SUM(CASE
        WHEN diag_1 IS NULL OR diag_1 = '?'
        THEN 1 ELSE 0
    END) AS missing_primary_diagnosis

FROM diabetic_data;

-- Check for duplicate records 

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT encounter_id) AS unique_encounters,
    COUNT(*) - COUNT(DISTINCT encounter_id) AS duplicate_encounter_ids
FROM diabetic_data;

-- readmission by age group
 
SELECT
    age,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS readmitted_within_30_days,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY age
ORDER BY early_readmission_rate DESC;

-- Analysing previous inpatient visits

SELECT
    number_inpatient,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY number_inpatient
ORDER BY number_inpatient;

-- Analysing previous emergency visits

SELECT
    number_emergency,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY number_emergency
ORDER BY number_emergency;

-- Analysing previous outpatient visits

SELECT
    number_outpatient,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY number_outpatient
ORDER BY number_outpatient;

-- Analysing readmission by length of hospital stay

SELECT
    time_in_hospital,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY time_in_hospital
ORDER BY time_in_hospital;

-- Analysing readmission by number of medications

SELECT
    num_medications,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY num_medications
ORDER BY num_medications;

-- Analysing readmission by primary diagnosis

SELECT
    diag_1,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
WHERE diag_1 IS NOT NULL
  AND diag_1 <> '?'
GROUP BY diag_1
HAVING COUNT(*) >= 100
ORDER BY early_readmission_rate DESC
LIMIT 15;

-- Analysing readmission by HbA1c test results 

SELECT
    A1Cresult,
    COUNT(*) AS total_encounters,

    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,

    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate

FROM diabetic_data
GROUP BY A1Cresult
ORDER BY early_readmission_rate DESC;

-- Does diabetes medication change relate to early readmission? 

SELECT
    `change`,
    COUNT(*) AS total_encounters,
    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,
    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY `change`
ORDER BY early_readmission_rate DESC;

-- Does diabetes medication status relate to early readmission?

SELECT
    diabetesMed,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY diabetesMed
ORDER BY early_readmission_rate DESC;

-- Which discharge destinations have higher early readmission rates?

SELECT
    discharge_disposition_id,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY discharge_disposition_id
HAVING COUNT(*) >= 100
ORDER BY early_readmission_rate DESC;

-- analysing admission type

SELECT
    admission_type_id,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY admission_type_id
ORDER BY early_readmission_rate DESC;

-- Analysing discharge disposition codes properly 

SELECT
    discharge_disposition_id,
    COUNT(*) AS total_encounters
FROM diabetic_data
GROUP BY discharge_disposition_id
ORDER BY total_encounters DESC;

-- Decoding the discharge destination IDs

SELECT
    discharge_disposition_id,
    COUNT(*) AS total_encounters,
    SUM(CASE
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END) AS early_readmissions,
    ROUND(
        SUM(CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY discharge_disposition_id
HAVING COUNT(*) >= 1000
ORDER BY early_readmission_rate DESC;

-- Early readmission by admission source 

SELECT
    admission_source_id,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY admission_source_id
HAVING COUNT(*) >= 100
ORDER BY early_readmission_rate DESC;

-- Analysing the number of diagnoses

SELECT
    number_diagnoses,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY number_diagnoses
ORDER BY number_diagnoses;

-- Analysing the number of lab procedures

SELECT
    num_lab_procedures,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY num_lab_procedures
ORDER BY num_lab_procedures;

-- Group lab procedures into ranges

SELECT
    CASE
        WHEN num_lab_procedures BETWEEN 0 AND 20 THEN '0-20'
        WHEN num_lab_procedures BETWEEN 21 AND 40 THEN '21-40'
        WHEN num_lab_procedures BETWEEN 41 AND 60 THEN '41-60'
        WHEN num_lab_procedures BETWEEN 61 AND 80 THEN '61-80'
        ELSE '81+'
    END AS lab_procedure_band,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY lab_procedure_band
ORDER BY MIN(num_lab_procedures);

-- Analysing the number of procedures performed

SELECT
    num_procedures,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY num_procedures
ORDER BY num_procedures;

-- patient's race

SELECT
    race,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY race
ORDER BY early_readmission_rate DESC;

-- Analysing early readmission by gender

SELECT
    gender,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY gender
ORDER BY early_readmission_rate DESC;

-- Analysing early readmission by age group

SELECT
    race,
    age,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
WHERE race <> '?'
GROUP BY race, age
HAVING COUNT(*) >= 100
ORDER BY early_readmission_rate DESC;

-- Analysing race and gender together

SELECT
    race,
    gender,
    COUNT(*) AS total_encounters,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS early_readmissions,
    ROUND(
        SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
WHERE race <> '?'
  AND gender IN ('Male', 'Female')
GROUP BY race, gender
HAVING COUNT(*) >= 100
ORDER BY early_readmission_rate DESC;

-- Checking the overall readmission picture

SELECT
    readmitted,
    COUNT(*) AS total_encounters,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM diabetic_data),
        2
    ) AS percentage_of_encounters
FROM diabetic_data
GROUP BY readmitted
ORDER BY total_encounters DESC;

-- Data cleaning: Step 1 of validation
-- Goal: Check whether important columns contain unexpected values.
-- We'll start with readmitted, gender, and age. 
-- These are important because they describe our target outcome and patient demographics. 

SELECT
    'readmitted' AS column_name,
    readmitted AS column_value,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY readmitted

UNION ALL

SELECT
    'gender' AS column_name,
    gender AS column_value,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY gender

UNION ALL

SELECT
    'age' AS column_name,
    age AS column_value,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY age

ORDER BY column_name, column_value;

-- Step 2: Checking numerical values

SELECT
    'time_in_hospital' AS column_name,
    MIN(time_in_hospital) AS minimum_value,
    MAX(time_in_hospital) AS maximum_value,
    SUM(time_in_hospital IS NULL) AS null_count,
    SUM(time_in_hospital < 0) AS negative_count
FROM diabetic_data

UNION ALL

SELECT
    'number_inpatient',
    MIN(number_inpatient),
    MAX(number_inpatient),
    SUM(number_inpatient IS NULL),
    SUM(number_inpatient < 0)
FROM diabetic_data

UNION ALL

SELECT
    'number_emergency',
    MIN(number_emergency),
    MAX(number_emergency),
    SUM(number_emergency IS NULL),
    SUM(number_emergency < 0)
FROM diabetic_data

UNION ALL

SELECT
    'number_outpatient',
    MIN(number_outpatient),
    MAX(number_outpatient),
    SUM(number_outpatient IS NULL),
    SUM(number_outpatient < 0)
FROM diabetic_data

UNION ALL

SELECT
    'num_medications',
    MIN(num_medications),
    MAX(num_medications),
    SUM(num_medications IS NULL),
    SUM(num_medications < 0)
FROM diabetic_data;

-- Step 3: Validating the remaining key numerical columns 

SELECT
    'number_diagnoses' AS column_name,
    MIN(number_diagnoses) AS minimum_value,
    MAX(number_diagnoses) AS maximum_value,
    SUM(number_diagnoses IS NULL) AS null_count,
    SUM(number_diagnoses <= 0) AS zero_or_negative_count
FROM diabetic_data

UNION ALL

SELECT
    'num_lab_procedures',
    MIN(num_lab_procedures),
    MAX(num_lab_procedures),
    SUM(num_lab_procedures IS NULL),
    SUM(num_lab_procedures < 0)
FROM diabetic_data

UNION ALL

SELECT
    'num_procedures',
    MIN(num_procedures),
    MAX(num_procedures),
    SUM(num_procedures IS NULL),
    SUM(num_procedures < 0)
FROM diabetic_data;

-- Step 4: Checking categorical fields for missing or unexpected values

SELECT
    'race' AS column_name,
    race AS column_value,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY race

UNION ALL

SELECT
    'A1Cresult',
    A1Cresult,
    COUNT(*)
FROM diabetic_data
GROUP BY A1Cresult

UNION ALL

SELECT
    'change',
    `change`,
    COUNT(*)
FROM diabetic_data
GROUP BY `change`

UNION ALL

SELECT
    'diabetesMed',
    diabetesMed,
    COUNT(*)
FROM diabetic_data
GROUP BY diabetesMed

ORDER BY column_name, column_value;

-- Step 5: Checking for missing markers across the other important columns

SELECT
    SUM(race = '?') AS missing_race,
    SUM(gender = 'Unknown/Invalid') AS invalid_gender,
    SUM(weight = '?') AS missing_weight,
    SUM(medical_specialty = '?') AS missing_medical_specialty,
    SUM(payer_code = '?') AS missing_payer_code,
    SUM(diag_1 = '?') AS missing_diag_1,
    SUM(diag_2 = '?') AS missing_diag_2,
    SUM(diag_3 = '?') AS missing_diag_3
FROM diabetic_data;

-- Step 6: Checking whether the table contains duplicate records

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT_WS(
        '|',
        encounter_id,
        patient_nbr,
        race,
        gender,
        age,
        time_in_hospital,
        num_lab_procedures,
        num_procedures,
        num_medications,
        number_outpatient,
        number_emergency,
        number_inpatient,
        readmitted
    )) AS distinct_combinations
FROM diabetic_data;

-- Step 7: Final validation of the target column

SELECT
    COUNT(*) AS total_rows,
    SUM(readmitted IS NULL) AS null_readmitted,
    SUM(readmitted NOT IN ('NO', '<30', '>30')) AS unexpected_labels
FROM diabetic_data;

-- Completing the remaining data-cleaning checks

SELECT
    'diag_1' AS column_name,
    COUNT(*) AS total_rows,
    SUM(`diag_1` IS NULL) AS null_count,
    SUM(`diag_1` = '?') AS unknown_count
FROM diabetic_data

UNION ALL

SELECT
    'diag_2',
    COUNT(*),
    SUM(`diag_2` IS NULL),
    SUM(`diag_2` = '?')
FROM diabetic_data

UNION ALL

SELECT
    'diag_3',
    COUNT(*),
    SUM(`diag_3` IS NULL),
    SUM(`diag_3` = '?')
FROM diabetic_data;

-- Validating categorical values

SELECT
    metformin,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY metformin
ORDER BY record_count DESC;

-- Checking all medication columns together

SELECT
    SUM(
        CASE WHEN metformin NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR metformin IS NULL THEN 1 ELSE 0 END
    ) AS metformin_unexpected,
    SUM(
        CASE WHEN repaglinide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR repaglinide IS NULL THEN 1 ELSE 0 END
    ) AS repaglinide_unexpected,
    SUM(
        CASE WHEN nateglinide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR nateglinide IS NULL THEN 1 ELSE 0 END
    ) AS nateglinide_unexpected,
    SUM(
        CASE WHEN chlorpropamide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR chlorpropamide IS NULL THEN 1 ELSE 0 END
    ) AS chlorpropamide_unexpected,
    SUM(
        CASE WHEN glimepiride NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR glimepiride IS NULL THEN 1 ELSE 0 END
    ) AS glimepiride_unexpected,
    SUM(
        CASE WHEN acetohexamide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR acetohexamide IS NULL THEN 1 ELSE 0 END
    ) AS acetohexamide_unexpected,
    SUM(
        CASE WHEN glipizide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR glipizide IS NULL THEN 1 ELSE 0 END
    ) AS glipizide_unexpected,
    SUM(
        CASE WHEN glyburide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR glyburide IS NULL THEN 1 ELSE 0 END
    ) AS glyburide_unexpected,
    SUM(
        CASE WHEN tolbutamide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR tolbutamide IS NULL THEN 1 ELSE 0 END
    ) AS tolbutamide_unexpected,
    SUM(
        CASE WHEN pioglitazone NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR pioglitazone IS NULL THEN 1 ELSE 0 END
    ) AS pioglitazone_unexpected,
    SUM(
        CASE WHEN rosiglitazone NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR rosiglitazone IS NULL THEN 1 ELSE 0 END
    ) AS rosiglitazone_unexpected,
    SUM(
        CASE WHEN acarbose NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR acarbose IS NULL THEN 1 ELSE 0 END
    ) AS acarbose_unexpected,
    SUM(
        CASE WHEN miglitol NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR miglitol IS NULL THEN 1 ELSE 0 END
    ) AS miglitol_unexpected,
    SUM(
        CASE WHEN troglitazone NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR troglitazone IS NULL THEN 1 ELSE 0 END
    ) AS troglitazone_unexpected,
    SUM(
        CASE WHEN tolazamide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR tolazamide IS NULL THEN 1 ELSE 0 END
    ) AS tolazamide_unexpected,
    SUM(
        CASE WHEN examide NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR examide IS NULL THEN 1 ELSE 0 END
    ) AS examide_unexpected,
    SUM(
        CASE WHEN citoglipton NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR citoglipton IS NULL THEN 1 ELSE 0 END
    ) AS citoglipton_unexpected,
    SUM(
        CASE WHEN insulin NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR insulin IS NULL THEN 1 ELSE 0 END
    ) AS insulin_unexpected,
    SUM(
        CASE WHEN `glyburide-metformin` NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR `glyburide-metformin` IS NULL THEN 1 ELSE 0 END
    ) AS glyburide_metformin_unexpected,
    SUM(
        CASE WHEN `glipizide-metformin` NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR `glipizide-metformin` IS NULL THEN 1 ELSE 0 END
    ) AS glipizide_metformin_unexpected,
    SUM(
        CASE WHEN `glimepiride-pioglitazone` NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR `glimepiride-pioglitazone` IS NULL THEN 1 ELSE 0 END
    ) AS glimepiride_pioglitazone_unexpected,
    SUM(
        CASE WHEN `metformin-rosiglitazone` NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR `metformin-rosiglitazone` IS NULL THEN 1 ELSE 0 END
    ) AS metformin_rosiglitazone_unexpected,
    SUM(
        CASE WHEN `metformin-pioglitazone` NOT IN ('No', 'Steady', 'Up', 'Down')
                  OR `metformin-pioglitazone` IS NULL THEN 1 ELSE 0 END
    ) AS metformin_pioglitazone_unexpected
FROM diabetic_data;

-- Validating the remaining categorical fields

SELECT
    max_glu_serum,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY max_glu_serum
ORDER BY record_count DESC;

-- Checking medication summary fields

SELECT
    'admission_type_id' AS column_name,
    MIN(admission_type_id) AS minimum_value,
    MAX(admission_type_id) AS maximum_value,
    SUM(admission_type_id IS NULL) AS null_count
FROM diabetic_data

UNION ALL

SELECT
    'discharge_disposition_id',
    MIN(discharge_disposition_id),
    MAX(discharge_disposition_id),
    SUM(discharge_disposition_id IS NULL)
FROM diabetic_data

UNION ALL

SELECT
    'admission_source_id',
    MIN(admission_source_id),
    MAX(admission_source_id),
    SUM(admission_source_id IS NULL)
FROM diabetic_data;

-- Checking which codes actually exist

SELECT
    'admission_type_id' AS column_name,
    admission_type_id AS code,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY admission_type_id

UNION ALL

SELECT
    'discharge_disposition_id',
    discharge_disposition_id,
    COUNT(*)
FROM diabetic_data
GROUP BY discharge_disposition_id

UNION ALL

SELECT
    'admission_source_id',
    admission_source_id,
    COUNT(*)
FROM diabetic_data
GROUP BY admission_source_id

ORDER BY column_name, code;

-- Validating the remaining clinical result categories

SELECT
    SUM(race <> TRIM(race)) AS race_with_extra_spaces,
    SUM(gender <> TRIM(gender)) AS gender_with_extra_spaces,
    SUM(age <> TRIM(age)) AS age_with_extra_spaces,
    SUM(readmitted <> TRIM(readmitted)) AS readmitted_with_extra_spaces,
    SUM(diag_1 <> TRIM(diag_1)) AS diag_1_with_extra_spaces,
    SUM(diag_2 <> TRIM(diag_2)) AS diag_2_with_extra_spaces,
    SUM(diag_3 <> TRIM(diag_3)) AS diag_3_with_extra_spaces
FROM diabetic_data;

-- Checking exact duplicate rows across weight column

SELECT
    weight,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY weight
ORDER BY record_count DESC;

-- Validating medical_specialty

SELECT
    medical_specialty,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY medical_specialty
ORDER BY record_count DESC
LIMIT 20;

-- Validating payer_code

SELECT
    payer_code,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY payer_code
ORDER BY record_count DESC;

-- Final check for invalid patient identifiers

SELECT
    COUNT(*) AS total_rows,
    SUM(encounter_id IS NULL) AS null_encounter_ids,
    SUM(encounter_id = 0) AS zero_encounter_ids,
    SUM(patient_nbr IS NULL) AS null_patient_numbers,
    SUM(patient_nbr = 0) AS zero_patient_numbers,
    COUNT(DISTINCT encounter_id) AS distinct_encounter_ids
FROM diabetic_data;

-- Checking repeated patients

SELECT
    COUNT(DISTINCT patient_nbr) AS unique_patients,
    COUNT(*) AS total_encounters,
    COUNT(*) - COUNT(DISTINCT patient_nbr) AS encounters_beyond_one_per_patient
FROM diabetic_data;

-- Checking how often patients appear

SELECT
    patient_encounters,
    COUNT(*) AS number_of_patients
FROM (
    SELECT
        patient_nbr,
        COUNT(*) AS patient_encounters
    FROM diabetic_data
    GROUP BY patient_nbr
) AS patient_counts
GROUP BY patient_encounters
ORDER BY patient_encounters;

-- Check exact duplicate rows in MySQL

SELECT
    COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'patient_readmission'
  AND TABLE_NAME = 'diabetic_data';

-- Generating a full-row duplicate-check query

SET SESSION group_concat_max_len = 100000;

SELECT CONCAT(
    'SELECT COUNT(*) AS duplicate_groups, ',
    'COALESCE(SUM(row_count - 1), 0) AS extra_duplicate_rows ',
    'FROM (SELECT COUNT(*) AS row_count FROM diabetic_data GROUP BY ',
    GROUP_CONCAT(
        CONCAT('`', COLUMN_NAME, '`')
        ORDER BY ORDINAL_POSITION
        SEPARATOR ', '
    ),
    ' HAVING COUNT(*) > 1) AS duplicates'
)
INTO @duplicate_check_sql
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'patient_readmission'
  AND TABLE_NAME = 'diabetic_data';

PREPARE duplicate_check FROM @duplicate_check_sql;
EXECUTE duplicate_check;
DEALLOCATE PREPARE duplicate_check;

-- Validating max_glu_serum and A1Cresult against expected categories

SELECT
    'change' AS column_name,
    `change` AS category,
    COUNT(*) AS record_count
FROM diabetic_data
GROUP BY `change`

UNION ALL

SELECT
    'diabetesMed',
    diabetesMed,
    COUNT(*)
FROM diabetic_data
GROUP BY diabetesMed

ORDER BY column_name, category;

-- Checking the remaining text fields for unknown values

SELECT
    SUM(admission_type_id IS NULL) AS missing_admission_type,
    SUM(discharge_disposition_id IS NULL) AS missing_discharge_disposition,
    SUM(admission_source_id IS NULL) AS missing_admission_source,
    SUM(`change` IS NULL) AS missing_change,
    SUM(diabetesMed IS NULL) AS missing_diabetesMed,
    SUM(max_glu_serum IS NULL) AS missing_max_glu_serum,
    SUM(A1Cresult IS NULL) AS missing_A1Cresult
FROM diabetic_data;

-- EDA

SELECT
    number_inpatient,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted,
    SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) AS readmitted_after_30_days,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_within_30_days,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY number_inpatient
ORDER BY number_inpatient;

-- Comparing all three outcomes by length of hospital stay

SELECT
    time_in_hospital,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted,
    SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) AS readmitted_after_30_days,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_within_30_days,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY time_in_hospital
ORDER BY time_in_hospital;

-- Number of diagnoses vs. readmission

SELECT
    number_diagnoses,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted,
    SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) AS readmitted_after_30_days,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_within_30_days,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY number_diagnoses
ORDER BY number_diagnoses;

-- Number of medications vs. readmission

SELECT
    num_medications,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted,
    SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) AS readmitted_after_30_days,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_within_30_days,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY num_medications
ORDER BY num_medications;

-- Grouping medication counts into ranges

SELECT
    CASE
        WHEN num_medications BETWEEN 1 AND 10 THEN '1-10'
        WHEN num_medications BETWEEN 11 AND 20 THEN '11-20'
        WHEN num_medications BETWEEN 21 AND 30 THEN '21-30'
        WHEN num_medications BETWEEN 31 AND 40 THEN '31-40'
        WHEN num_medications BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+'
    END AS medication_group,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS early_readmissions,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY medication_group
ORDER BY MIN(num_medications);

-- Grouping previous inpatient visits

SELECT
    CASE
        WHEN number_inpatient = 0 THEN '0'
        WHEN number_inpatient BETWEEN 1 AND 2 THEN '1-2'
        WHEN number_inpatient BETWEEN 3 AND 4 THEN '3-4'
        WHEN number_inpatient BETWEEN 5 AND 7 THEN '5-7'
        ELSE '8+'
    END AS inpatient_visit_group,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        AS early_readmissions,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY inpatient_visit_group
ORDER BY MIN(number_inpatient);

-- EDA: Previous emergency visits vs. early readmission

SELECT
    CASE
        WHEN number_emergency = 0 THEN '0'
        WHEN number_emergency = 1 THEN '1'
        WHEN number_emergency BETWEEN 2 AND 3 THEN '2-3'
        ELSE '4+'
    END AS emergency_visit_group,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        AS early_readmissions,
    ROUND(
        SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS early_readmission_rate
FROM diabetic_data
GROUP BY emergency_visit_group
ORDER BY MIN(number_emergency);

-- Verify the readmission outcome totals

SELECT
    readmitted,
    COUNT(*) AS total_encounters,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetic_data),
        2
    ) AS percentage
FROM diabetic_data
GROUP BY readmitted
ORDER BY
    CASE readmitted
        WHEN 'NO' THEN 1
        WHEN '>30' THEN 2
        WHEN '<30' THEN 3
        ELSE 4
    END;

-- Checking unknown-value markers

SELECT
    SUM(CASE WHEN race = '?' THEN 1 ELSE 0 END)
        AS unknown_race,
    SUM(CASE WHEN weight = '?' THEN 1 ELSE 0 END)
        AS unknown_weight,
    SUM(CASE WHEN payer_code = '?' THEN 1 ELSE 0 END)
        AS unknown_payer_code,
    SUM(CASE WHEN medical_specialty = '?' THEN 1 ELSE 0 END)
        AS unknown_medical_specialty,
    SUM(CASE WHEN diag_1 = '?' THEN 1 ELSE 0 END)
        AS unknown_diag_1,
    SUM(CASE WHEN diag_2 = '?' THEN 1 ELSE 0 END)
        AS unknown_diag_2,
    SUM(CASE WHEN diag_3 = '?' THEN 1 ELSE 0 END)
        AS unknown_diag_3
FROM diabetic_data;

-- Check other categorical fields for unexpected values

SELECT
    'readmitted' AS column_name,
    readmitted AS category,
    COUNT(*) AS total
FROM diabetic_data
GROUP BY readmitted

UNION ALL

SELECT
    'change',
    `change`,
    COUNT(*)
FROM diabetic_data
GROUP BY `change`

UNION ALL

SELECT
    'diabetesMed',
    diabetesMed,
    COUNT(*)
FROM diabetic_data
GROUP BY diabetesMed

ORDER BY column_name, category;

-- Checking for remaining SQL NULL values

SELECT
    SUM(CASE WHEN time_in_hospital IS NULL THEN 1 ELSE 0 END)
        AS missing_time_in_hospital,
    SUM(CASE WHEN num_lab_procedures IS NULL THEN 1 ELSE 0 END)
        AS missing_num_lab_procedures,
    SUM(CASE WHEN num_procedures IS NULL THEN 1 ELSE 0 END)
        AS missing_num_procedures,
    SUM(CASE WHEN num_medications IS NULL THEN 1 ELSE 0 END)
        AS missing_num_medications,
    SUM(CASE WHEN number_outpatient IS NULL THEN 1 ELSE 0 END)
        AS missing_number_outpatient,
    SUM(CASE WHEN number_emergency IS NULL THEN 1 ELSE 0 END)
        AS missing_number_emergency,
    SUM(CASE WHEN number_inpatient IS NULL THEN 1 ELSE 0 END)
        AS missing_number_inpatient,
    SUM(CASE WHEN number_diagnoses IS NULL THEN 1 ELSE 0 END)
        AS missing_number_diagnoses
FROM diabetic_data;

-- Creating a cleaned SQL view

SHOW FULL TABLES
WHERE Tables_in_patient_readmission = 'diabetic_data_clean';

SHOW COLUMNS FROM diabetic_data;

CREATE VIEW diabetic_data_clean AS
SELECT
    encounter_id,
    patient_nbr,
    CASE WHEN race = '?' THEN NULL ELSE race END AS race,
    gender,
    age,
    CASE WHEN weight = '?' THEN NULL ELSE weight END AS weight,
    admission_type_id,
    discharge_disposition_id,
    admission_source_id,
    time_in_hospital,
    CASE WHEN payer_code = '?' THEN NULL
         ELSE payer_code END AS payer_code,
    CASE WHEN medical_specialty = '?' THEN NULL
         ELSE medical_specialty END AS medical_specialty,
    num_lab_procedures,
    num_procedures,
    num_medications,
    number_outpatient,
    number_emergency,
    number_inpatient,
    CASE WHEN diag_1 = '?' THEN NULL ELSE diag_1 END AS diag_1,
    CASE WHEN diag_2 = '?' THEN NULL ELSE diag_2 END AS diag_2,
    CASE WHEN diag_3 = '?' THEN NULL ELSE diag_3 END AS diag_3,
    number_diagnoses,
    max_glu_serum,
    A1Cresult,
    metformin,
    repaglinide,
    nateglinide,
    chlorpropamide,
    glimepiride,
    acetohexamide,
    glipizide,
    glyburide,
    tolbutamide,
    pioglitazone,
    rosiglitazone,
    acarbose,
    miglitol,
    troglitazone,
    tolazamide,
    examide,
    citoglipton,
    insulin,
    `glyburide-metformin`,
    `glipizide-metformin`,
    `glimepiride-pioglitazone`,
    `metformin-rosiglitazone`,
    `metformin-pioglitazone`,
    `change`,
    diabetesMed,
    readmitted
FROM diabetic_data;

SHOW COLUMNS FROM diabetic_data;

-- Validating the cleaned view

SELECT
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT encounter_id) AS unique_encounters,
    SUM(CASE WHEN race IS NULL THEN 1 ELSE 0 END)
        AS missing_race,
    SUM(CASE WHEN weight IS NULL THEN 1 ELSE 0 END)
        AS missing_weight,
    SUM(CASE WHEN payer_code IS NULL THEN 1 ELSE 0 END)
        AS missing_payer_code,
    SUM(CASE WHEN medical_specialty IS NULL THEN 1 ELSE 0 END)
        AS missing_medical_specialty,
    SUM(CASE WHEN diag_1 IS NULL THEN 1 ELSE 0 END)
        AS missing_diag_1,
    SUM(CASE WHEN diag_2 IS NULL THEN 1 ELSE 0 END)
        AS missing_diag_2,
    SUM(CASE WHEN diag_3 IS NULL THEN 1 ELSE 0 END)
        AS missing_diag_3
FROM diabetic_data_clean;

-- Verifying the readmission outcome in the cleaned view

SELECT
    readmitted,
    COUNT(*) AS total_encounters,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM diabetic_data_clean), 2)
        AS percentage
FROM diabetic_data_clean
GROUP BY readmitted
ORDER BY
    CASE readmitted
        WHEN 'NO' THEN 1
        WHEN '>30' THEN 2
        WHEN '<30' THEN 3
        ELSE 4
    END;

-- Checking whether weight should be retained

SELECT
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN weight IS NOT NULL THEN 1 ELSE 0 END)
        AS known_weight_encounters,
    ROUND(
        SUM(CASE WHEN weight IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS known_weight_percentage
FROM diabetic_data_clean;

-- Assessing the other fields with high missingness

SELECT
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN payer_code IS NOT NULL THEN 1 ELSE 0 END)
        AS known_payer_codes,
    ROUND(
        SUM(CASE WHEN payer_code IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS known_payer_percentage,
    SUM(CASE WHEN medical_specialty IS NOT NULL THEN 1 ELSE 0 END)
        AS known_medical_specialties,
    ROUND(
        SUM(CASE WHEN medical_specialty IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS known_specialty_percentage
FROM diabetic_data_clean;

-- Checking the remaining diagnosis unknowns

SELECT
    COUNT(*) AS total_encounters,

    SUM(CASE WHEN diag_1 IS NOT NULL THEN 1 ELSE 0 END)
        AS known_diag_1,
    ROUND(
        SUM(CASE WHEN diag_1 IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS diag_1_known_percentage,

    SUM(CASE WHEN diag_2 IS NOT NULL THEN 1 ELSE 0 END)
        AS known_diag_2,
    ROUND(
        SUM(CASE WHEN diag_2 IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS diag_2_known_percentage,

    SUM(CASE WHEN diag_3 IS NOT NULL THEN 1 ELSE 0 END)
        AS known_diag_3,
    ROUND(
        SUM(CASE WHEN diag_3 IS NOT NULL THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS diag_3_known_percentage

FROM diabetic_data_clean;

-- Glucose-test fields

SELECT
    'max_glu_serum' AS column_name,
    max_glu_serum AS category,
    COUNT(*) AS total
FROM diabetic_data_clean
GROUP BY max_glu_serum

UNION ALL

SELECT
    'A1Cresult',
    A1Cresult,
    COUNT(*)
FROM diabetic_data_clean
GROUP BY A1Cresult

ORDER BY column_name, category;

-- Medication validation

SELECT
    medication,
    category,
    COUNT(*) AS total
FROM (
    SELECT 'metformin' AS medication, metformin AS category
    FROM diabetic_data_clean

    UNION ALL
    SELECT 'repaglinide', repaglinide FROM diabetic_data_clean

    UNION ALL
    SELECT 'nateglinide', nateglinide FROM diabetic_data_clean

    UNION ALL
    SELECT 'insulin', insulin FROM diabetic_data_clean

    UNION ALL
    SELECT 'glyburide-metformin', `glyburide-metformin`
    FROM diabetic_data_clean
) AS medication_values
GROUP BY medication, category
ORDER BY medication, category;