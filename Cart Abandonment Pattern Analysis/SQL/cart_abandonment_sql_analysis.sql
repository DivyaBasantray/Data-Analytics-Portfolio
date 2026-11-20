-- ============================================================
-- Cart Abandonment Pattern Analysis
-- SQL Business Analysis
-- Database Engine: DuckDB
-- Dataset: February Cart Events
-- ============================================================
--
-- Dataset:
-- 2,656,529 cart-event rows
-- 1,660,109 unique cart sessions
--
-- Note:
-- The CSV contains cart events only.
-- Purchase outcome is represented by the "purchased" column.
--
-- ============================================================


-- ============================================================
-- Business Question 1
-- What is the overall purchase and cart abandonment rate?
-- ============================================================

SELECT
    COUNT(DISTINCT user_session) AS total_sessions,

    COUNT(DISTINCT CASE
        WHEN purchased = TRUE THEN user_session
    END) AS purchased_sessions,

    COUNT(DISTINCT CASE
        WHEN purchased = FALSE THEN user_session
    END) AS abandoned_sessions,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN purchased = TRUE THEN user_session
        END)
        / COUNT(DISTINCT user_session),
        2
    ) AS conversion_rate,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN purchased = FALSE THEN user_session
        END)
        / COUNT(DISTINCT user_session),
        2
    ) AS abandonment_rate

FROM 'february_cart_events.csv';


-- ============================================================
-- Business Question 2
-- Does the number of carted products affect purchase likelihood?
-- ============================================================

SELECT
    purchased,
    COUNT(DISTINCT user_session) AS sessions,
    ROUND(AVG(product_count), 2) AS avg_products_per_session

FROM (
    SELECT
        user_session,
        purchased,
        COUNT(DISTINCT product_id) AS product_count

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
)

GROUP BY purchased
ORDER BY purchased;


-- ============================================================
-- Business Question 3
-- How does purchase behavior change with the number
-- of distinct products in the cart?
-- ============================================================

WITH session_products AS (
    SELECT
        user_session,
        purchased,
        COUNT(DISTINCT product_id) AS product_count

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
),

product_bands AS (
    SELECT
        user_session,
        purchased,

        CASE
            WHEN product_count = 1 THEN '1 product'
            WHEN product_count = 2 THEN '2 products'
            WHEN product_count = 3 THEN '3 products'
            ELSE '4+ products'
        END AS product_count_band,

        CASE
            WHEN product_count = 1 THEN 1
            WHEN product_count = 2 THEN 2
            WHEN product_count = 3 THEN 3
            ELSE 4
        END AS band_order

    FROM session_products
)

SELECT
    product_count_band,
    COUNT(*) AS sessions,

    SUM(
        CASE
            WHEN purchased = TRUE THEN 1
            ELSE 0
        END
    ) AS purchased_sessions,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN purchased = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS purchase_rate

FROM product_bands

GROUP BY
    product_count_band,
    band_order

ORDER BY band_order;


-- ============================================================
-- Business Question 4
-- Does product price relate to purchase behavior?
-- ============================================================

WITH price_bands AS (
    SELECT
        user_session,
        purchased,

        CASE
            WHEN price <= 100 THEN '₹0-₹100'
            WHEN price <= 250 THEN '₹100-₹250'
            WHEN price <= 500 THEN '₹250-₹500'
            ELSE '₹500+'
        END AS price_band,

        CASE
            WHEN price <= 100 THEN 1
            WHEN price <= 250 THEN 2
            WHEN price <= 500 THEN 3
            ELSE 4
        END AS band_order

    FROM 'february_cart_events.csv'
)

SELECT
    price_band,

    COUNT(DISTINCT user_session) AS sessions,

    COUNT(DISTINCT CASE
        WHEN purchased = TRUE THEN user_session
    END) AS purchased_sessions,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN purchased = TRUE THEN user_session
        END)
        / COUNT(DISTINCT user_session),
        2
    ) AS purchase_rate

FROM price_bands

GROUP BY
    price_band,
    band_order

ORDER BY band_order;


-- ============================================================
-- Business Question 5
-- Does session duration relate to purchase behavior?
-- ============================================================

WITH session_duration AS (
    SELECT
        user_session,
        purchased,

        DATE_DIFF(
            'minute',
            MIN(event_time),
            MAX(event_time)
        ) AS duration_minutes

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
),

duration_bands AS (
    SELECT
        user_session,
        purchased,

        CASE
            WHEN duration_minutes = 0 THEN '0 minutes'
            WHEN duration_minutes <= 2 THEN '1-2 minutes'
            WHEN duration_minutes <= 5 THEN '3-5 minutes'
            WHEN duration_minutes <= 10 THEN '6-10 minutes'
            ELSE '10+ minutes'
        END AS duration_band,

        CASE
            WHEN duration_minutes = 0 THEN 1
            WHEN duration_minutes <= 2 THEN 2
            WHEN duration_minutes <= 5 THEN 3
            WHEN duration_minutes <= 10 THEN 4
            ELSE 5
        END AS band_order

    FROM session_duration
)

SELECT
    duration_band,
    COUNT(*) AS sessions,

    SUM(
        CASE
            WHEN purchased = TRUE THEN 1
            ELSE 0
        END
    ) AS purchased_sessions,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN purchased = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS purchase_rate

FROM duration_bands

GROUP BY
    duration_band,
    band_order

ORDER BY band_order;


-- ============================================================
-- Business Question 6
-- Does the number of cart events in a session
-- relate to purchase behavior?
-- ============================================================

WITH session_events AS (
    SELECT
        user_session,
        purchased,
        COUNT(*) AS cart_events

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
),

event_bands AS (
    SELECT
        user_session,
        purchased,

        CASE
            WHEN cart_events = 1 THEN '1 event'
            WHEN cart_events = 2 THEN '2 events'
            WHEN cart_events = 3 THEN '3 events'
            ELSE '4+ events'
        END AS event_count_band,

        CASE
            WHEN cart_events = 1 THEN 1
            WHEN cart_events = 2 THEN 2
            WHEN cart_events = 3 THEN 3
            ELSE 4
        END AS band_order

    FROM session_events
)

SELECT
    event_count_band,
    COUNT(*) AS sessions,

    SUM(
        CASE
            WHEN purchased = TRUE THEN 1
            ELSE 0
        END
    ) AS purchased_sessions,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN purchased = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS purchase_rate

FROM event_bands

GROUP BY
    event_count_band,
    band_order

ORDER BY band_order;


-- ============================================================
-- Business Question 7
-- Which product categories have higher or lower
-- purchase rates?
--
-- Minimum volume: 10,000 sessions
-- ============================================================

WITH category_metrics AS (
    SELECT
        category_code,

        COUNT(DISTINCT user_session) AS sessions,

        COUNT(DISTINCT CASE
            WHEN purchased = TRUE THEN user_session
        END) AS purchased_sessions,

        ROUND(
            100.0 * COUNT(DISTINCT CASE
                WHEN purchased = TRUE THEN user_session
            END)
            / COUNT(DISTINCT user_session),
            2
        ) AS purchase_rate

    FROM 'february_cart_events.csv'

    WHERE category_code IS NOT NULL

    GROUP BY category_code
)

SELECT
    category_code,
    sessions,
    purchased_sessions,
    purchase_rate

FROM category_metrics

WHERE sessions >= 10000

ORDER BY purchase_rate DESC;


-- ============================================================
-- Business Question 8
-- Does brand relate to purchase behavior?
--
-- Minimum volume: 10,000 sessions
-- ============================================================

WITH brand_metrics AS (
    SELECT
        brand,

        COUNT(DISTINCT user_session) AS sessions,

        COUNT(DISTINCT CASE
            WHEN purchased = TRUE THEN user_session
        END) AS purchased_sessions,

        ROUND(
            100.0 * COUNT(DISTINCT CASE
                WHEN purchased = TRUE THEN user_session
            END)
            / COUNT(DISTINCT user_session),
            2
        ) AS purchase_rate

    FROM 'february_cart_events.csv'

    WHERE brand IS NOT NULL

    GROUP BY brand
)

SELECT
    brand,
    sessions,
    purchased_sessions,
    purchase_rate

FROM brand_metrics

WHERE sessions >= 10000

ORDER BY purchase_rate DESC;


-- ============================================================
-- Business Question 9
-- Does purchase behavior vary by time of day?
--
-- Session hour is based on the first cart event.
-- ============================================================

WITH session_hours AS (
    SELECT
        user_session,
        purchased,

        EXTRACT(
            HOUR FROM MIN(event_time)
        ) AS session_hour

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
)

SELECT
    session_hour,
    COUNT(*) AS sessions,

    SUM(
        CASE
            WHEN purchased = TRUE THEN 1
            ELSE 0
        END
    ) AS purchased_sessions,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN purchased = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS purchase_rate

FROM session_hours

GROUP BY session_hour

ORDER BY session_hour;


-- ============================================================
-- Business Question 10
-- Does purchase behavior vary by day of the week?
--
-- Day is based on the first cart event.
-- ============================================================

WITH session_days AS (
    SELECT
        user_session,
        purchased,

        DAYNAME(MIN(event_time)) AS day_name,
        DAYOFWEEK(MIN(event_time)) AS day_number

    FROM 'february_cart_events.csv'

    GROUP BY
        user_session,
        purchased
)

SELECT
    day_name,
    COUNT(*) AS sessions,

    SUM(
        CASE
            WHEN purchased = TRUE THEN 1
            ELSE 0
        END
    ) AS purchased_sessions,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN purchased = TRUE THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS purchase_rate

FROM session_days

GROUP BY
    day_name,
    day_number

ORDER BY day_number;


-- ============================================================
-- END OF SQL ANALYSIS
-- ============================================================
