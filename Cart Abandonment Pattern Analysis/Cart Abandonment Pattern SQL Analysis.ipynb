{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "527f4675-a109-4bb2-94d9-c81718d429ab",
   "metadata": {},
   "outputs": [],
   "source": [
    "import duckdb"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "1cc0cf25-2a6c-447c-8f95-3ea41da91b0c",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐\n",
       "│  column_name  │ column_type │  null   │   key   │ default │  extra  │\n",
       "│    varchar    │   varchar   │ varchar │ varchar │ varchar │ varchar │\n",
       "├───────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤\n",
       "│ event_time    │ TIMESTAMP   │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ event_type    │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ product_id    │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ category_id   │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ category_code │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ brand         │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ price         │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ user_session  │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "│ purchased     │ BOOLEAN     │ YES     │ NULL    │ NULL    │ NULL    │\n",
       "└───────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┘"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    DESCRIBE\n",
    "    SELECT *\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "23b79f56-f414-45f7-b23d-6af0c87a60c4",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────────┬────────────────────┬───────────────┬────────────────────┐\n",
       "│ total_sessions │ purchased_sessions │ cart_sessions │ abandoned_sessions │\n",
       "│     int64      │       int64        │     int64     │       int64        │\n",
       "├────────────────┼────────────────────┼───────────────┼────────────────────┤\n",
       "│        1660109 │                  0 │       1660109 │            1660109 │\n",
       "└────────────────┴────────────────────┴───────────────┴────────────────────┘"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        COUNT(DISTINCT user_session) AS total_sessions,\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN event_type = 'purchase' THEN user_session\n",
    "        END) AS purchased_sessions,\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN event_type = 'cart' THEN user_session\n",
    "        END) AS cart_sessions,\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN event_type = 'cart'\n",
    "             AND user_session NOT IN (\n",
    "                 SELECT DISTINCT user_session\n",
    "                 FROM 'february_cart_events.csv'\n",
    "                 WHERE event_type = 'purchase'\n",
    "             )\n",
    "            THEN user_session\n",
    "        END) AS abandoned_sessions\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "d7ef5980-b80c-4f3c-8af0-46e3ea207d40",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────┬─────────────┐\n",
       "│ event_type │ event_count │\n",
       "│  varchar   │    int64    │\n",
       "├────────────┼─────────────┤\n",
       "│ cart       │     2656529 │\n",
       "└────────────┴─────────────┘"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        event_type,\n",
    "        COUNT(*) AS event_count\n",
    "    FROM 'february_cart_events.csv'\n",
    "    GROUP BY event_type\n",
    "    ORDER BY event_count DESC\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "38b3bffc-d265-49b5-9ed9-da6f3caf8584",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬───────────┬──────────┐\n",
       "│ purchased │ row_count │ sessions │\n",
       "│  boolean  │   int64   │  int64   │\n",
       "├───────────┼───────────┼──────────┤\n",
       "│ false     │   1363052 │   960018 │\n",
       "│ true      │   1293477 │   700091 │\n",
       "└───────────┴───────────┴──────────┘"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        purchased,\n",
    "        COUNT(*) AS row_count,\n",
    "        COUNT(DISTINCT user_session) AS sessions\n",
    "    FROM 'february_cart_events.csv'\n",
    "    GROUP BY purchased\n",
    "    ORDER BY purchased\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "20caa116-c291-4913-9529-f82034381c33",
   "metadata": {},
   "source": [
    "## Business Question 1: What is the overall purchase and cart abandonment rate?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "a19683ac-e648-4208-9f54-1c445970a4a3",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────────┬────────────────────┬────────────────────┬─────────────────┬──────────────────┐\n",
       "│ total_sessions │ purchased_sessions │ abandoned_sessions │ conversion_rate │ abandonment_rate │\n",
       "│     int64      │       int64        │       int64        │     double      │      double      │\n",
       "├────────────────┼────────────────────┼────────────────────┼─────────────────┼──────────────────┤\n",
       "│        1660109 │             700091 │             960018 │           42.17 │            57.83 │\n",
       "└────────────────┴────────────────────┴────────────────────┴─────────────────┴──────────────────┘"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        COUNT(DISTINCT user_session) AS total_sessions,\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN purchased = TRUE THEN user_session\n",
    "        END) AS purchased_sessions,\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN purchased = FALSE THEN user_session\n",
    "        END) AS abandoned_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * COUNT(DISTINCT CASE\n",
    "                WHEN purchased = TRUE THEN user_session\n",
    "            END)\n",
    "            / COUNT(DISTINCT user_session),\n",
    "            2\n",
    "        ) AS conversion_rate,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * COUNT(DISTINCT CASE\n",
    "                WHEN purchased = FALSE THEN user_session\n",
    "            END)\n",
    "            / COUNT(DISTINCT user_session),\n",
    "            2\n",
    "        ) AS abandonment_rate\n",
    "\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "53a07c83-131f-47dd-ba14-a4e1456f38b3",
   "metadata": {},
   "source": [
    "## Business Question 2: Does the number of carted products affect purchase likelihood?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "26a2e387-2814-4a85-ae1a-38202143253d",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬──────────┬──────────────────────────┐\n",
       "│ purchased │ sessions │ avg_products_per_session │\n",
       "│  boolean  │  int64   │          double          │\n",
       "├───────────┼──────────┼──────────────────────────┤\n",
       "│ false     │   960018 │                     1.09 │\n",
       "│ true      │   700091 │                     1.21 │\n",
       "└───────────┴──────────┴──────────────────────────┘"
      ]
     },
     "execution_count": 10,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        purchased,\n",
    "        COUNT(DISTINCT user_session) AS sessions,\n",
    "        ROUND(AVG(product_count), 2) AS avg_products_per_session\n",
    "    FROM (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            COUNT(DISTINCT product_id) AS product_count\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    )\n",
    "    GROUP BY purchased\n",
    "    ORDER BY purchased\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4eb7aefc-1e6d-45d1-9fb3-949fd1c36c9a",
   "metadata": {},
   "source": [
    "## Business Question 3: How does purchase behavior change with the number of distinct products in the cart?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "ec67c6cd-d190-4793-a30a-b52aca52a0ee",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ product_count_band │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│      varchar       │  int64   │       int128       │    double     │\n",
       "├────────────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ 1 product          │  1484011 │             591298 │         39.84 │\n",
       "│ 2 products         │   139468 │              83927 │         60.18 │\n",
       "│ 3 products         │    25332 │              16996 │         67.09 │\n",
       "│ 4+ products        │    11299 │               7870 │         69.65 │\n",
       "└────────────────────┴──────────┴────────────────────┴───────────────┘"
      ]
     },
     "execution_count": 12,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH session_products AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            COUNT(DISTINCT product_id) AS product_count\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    ),\n",
    "\n",
    "    product_bands AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            CASE\n",
    "                WHEN product_count = 1 THEN '1 product'\n",
    "                WHEN product_count = 2 THEN '2 products'\n",
    "                WHEN product_count = 3 THEN '3 products'\n",
    "                ELSE '4+ products'\n",
    "            END AS product_count_band,\n",
    "\n",
    "            CASE\n",
    "                WHEN product_count = 1 THEN 1\n",
    "                WHEN product_count = 2 THEN 2\n",
    "                WHEN product_count = 3 THEN 3\n",
    "                ELSE 4\n",
    "            END AS band_order\n",
    "\n",
    "        FROM session_products\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        product_count_band,\n",
    "        COUNT(*) AS sessions,\n",
    "        SUM(CASE WHEN purchased = TRUE THEN 1 ELSE 0 END) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * SUM(CASE WHEN purchased = TRUE THEN 1 ELSE 0 END)\n",
    "            / COUNT(*),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM product_bands\n",
    "\n",
    "    GROUP BY\n",
    "        product_count_band,\n",
    "        band_order\n",
    "\n",
    "    ORDER BY band_order\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4415bfc9-e734-419b-bc23-cf1b56ee1b5e",
   "metadata": {},
   "source": [
    "## Business Question 4: Does product price relate to purchase behavior?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "4d276732-b5ac-431d-b225-18c010a68303",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬───────────┬──────────────┬───────────┐\n",
       "│ min_price │ avg_price │ median_price │ max_price │\n",
       "│  double   │  double   │    double    │  double   │\n",
       "├───────────┼───────────┼──────────────┼───────────┤\n",
       "│       0.0 │    291.55 │       172.44 │   2574.07 │\n",
       "└───────────┴───────────┴──────────────┴───────────┘"
      ]
     },
     "execution_count": 13,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        MIN(price) AS min_price,\n",
    "        ROUND(AVG(price), 2) AS avg_price,\n",
    "        MEDIAN(price) AS median_price,\n",
    "        MAX(price) AS max_price\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "62103b82-c6c4-4a7a-aa13-39ce938f0109",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌─────────────────┬─────────────────────┐\n",
       "│ zero_price_rows │ zero_price_sessions │\n",
       "│      int64      │        int64        │\n",
       "├─────────────────┼─────────────────────┤\n",
       "│            1547 │                1219 │\n",
       "└─────────────────┴─────────────────────┘"
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        COUNT(*) AS zero_price_rows,\n",
    "        COUNT(DISTINCT user_session) AS zero_price_sessions\n",
    "    FROM 'february_cart_events.csv'\n",
    "    WHERE price = 0\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "c74eb019-aecf-473f-a2f1-8bd64c44eb1a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ price_band │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│  varchar   │  int64   │       int64        │    double     │\n",
       "├────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ ₹0-₹100    │   542482 │             190025 │         35.03 │\n",
       "│ ₹100-₹250  │   577423 │             277311 │         48.03 │\n",
       "│ ₹250-₹500  │   294490 │             137580 │         46.72 │\n",
       "│ ₹500+      │   316126 │             145449 │         46.01 │\n",
       "└────────────┴──────────┴────────────────────┴───────────────┘"
      ]
     },
     "execution_count": 16,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH price_bands AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            CASE\n",
    "                WHEN price <= 100 THEN '₹0-₹100'\n",
    "                WHEN price <= 250 THEN '₹100-₹250'\n",
    "                WHEN price <= 500 THEN '₹250-₹500'\n",
    "                ELSE '₹500+'\n",
    "            END AS price_band,\n",
    "\n",
    "            CASE\n",
    "                WHEN price <= 100 THEN 1\n",
    "                WHEN price <= 250 THEN 2\n",
    "                WHEN price <= 500 THEN 3\n",
    "                ELSE 4\n",
    "            END AS band_order\n",
    "\n",
    "        FROM 'february_cart_events.csv'\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        price_band,\n",
    "        COUNT(DISTINCT user_session) AS sessions,\n",
    "\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN purchased = TRUE THEN user_session\n",
    "        END) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * COUNT(DISTINCT CASE\n",
    "                WHEN purchased = TRUE THEN user_session\n",
    "            END)\n",
    "            / COUNT(DISTINCT user_session),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM price_bands\n",
    "\n",
    "    GROUP BY\n",
    "        price_band,\n",
    "        band_order\n",
    "\n",
    "    ORDER BY band_order\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d4a90ed1-f484-4100-bd90-d07aad3b12a1",
   "metadata": {},
   "source": [
    "## Business Question 5: Does session duration relate to purchase behavior?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "47442aae-85e4-44ae-8591-a08477c40654",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌──────────────────────┬──────────────────────┬─────────────────────────┬──────────────────────┐\n",
       "│ min_duration_minutes │ avg_duration_minutes │ median_duration_minutes │ max_duration_minutes │\n",
       "│        int64         │        double        │         double          │        int64         │\n",
       "├──────────────────────┼──────────────────────┼─────────────────────────┼──────────────────────┤\n",
       "│                    0 │                 3.46 │                     0.0 │                38978 │\n",
       "└──────────────────────┴──────────────────────┴─────────────────────────┴──────────────────────┘"
      ]
     },
     "execution_count": 17,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        MIN(session_duration_minutes) AS min_duration_minutes,\n",
    "        ROUND(AVG(session_duration_minutes), 2) AS avg_duration_minutes,\n",
    "        MEDIAN(session_duration_minutes) AS median_duration_minutes,\n",
    "        MAX(session_duration_minutes) AS max_duration_minutes\n",
    "    FROM (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            DATE_DIFF(\n",
    "                'minute',\n",
    "                MIN(event_time),\n",
    "                MAX(event_time)\n",
    "            ) AS session_duration_minutes\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    )\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "7b113c01-64f1-49b0-b2e5-6a81c07f5099",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬──────────┬──────────────────────┬─────────────────────────┐\n",
       "│ purchased │ sessions │ avg_duration_minutes │ median_duration_minutes │\n",
       "│  boolean  │  int64   │        double        │         double          │\n",
       "├───────────┼──────────┼──────────────────────┼─────────────────────────┤\n",
       "│ false     │   960019 │                  3.8 │                     0.0 │\n",
       "│ true      │   700091 │                 2.99 │                     0.0 │\n",
       "└───────────┴──────────┴──────────────────────┴─────────────────────────┘"
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        purchased,\n",
    "        COUNT(*) AS sessions,\n",
    "        ROUND(AVG(session_duration_minutes), 2) AS avg_duration_minutes,\n",
    "        MEDIAN(session_duration_minutes) AS median_duration_minutes\n",
    "    FROM (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            DATE_DIFF(\n",
    "                'minute',\n",
    "                MIN(event_time),\n",
    "                MAX(event_time)\n",
    "            ) AS session_duration_minutes\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    )\n",
    "    GROUP BY purchased\n",
    "    ORDER BY purchased\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "5a6c0399-1d46-483f-b278-4768d2131111",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌──────────────┬──────────────────┐\n",
       "│ user_session │ purchased_values │\n",
       "│   varchar    │      int64       │\n",
       "└──────────────┴──────────────────┘\n",
       "              0 rows             "
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        user_session,\n",
    "        COUNT(DISTINCT purchased) AS purchased_values\n",
    "    FROM 'february_cart_events.csv'\n",
    "    GROUP BY user_session\n",
    "    HAVING COUNT(DISTINCT purchased) > 1\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "7e952a17-467d-44ab-8ba4-184d9dd16c3e",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ duration_band │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│    varchar    │  int64   │       int128       │    double     │\n",
       "├───────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ 0 minutes     │  1292378 │             466353 │         36.08 │\n",
       "│ 1-2 minutes   │   171672 │              99929 │         58.21 │\n",
       "│ 3-5 minutes   │    91104 │              62849 │         68.99 │\n",
       "│ 6-10 minutes  │    52204 │              36604 │         70.12 │\n",
       "│ 10+ minutes   │    52752 │              34356 │         65.13 │\n",
       "└───────────────┴──────────┴────────────────────┴───────────────┘"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH session_duration AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            DATE_DIFF(\n",
    "                'minute',\n",
    "                MIN(event_time),\n",
    "                MAX(event_time)\n",
    "            ) AS duration_minutes\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    ),\n",
    "\n",
    "    duration_bands AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "\n",
    "            CASE\n",
    "                WHEN duration_minutes = 0 THEN '0 minutes'\n",
    "                WHEN duration_minutes <= 2 THEN '1-2 minutes'\n",
    "                WHEN duration_minutes <= 5 THEN '3-5 minutes'\n",
    "                WHEN duration_minutes <= 10 THEN '6-10 minutes'\n",
    "                ELSE '10+ minutes'\n",
    "            END AS duration_band,\n",
    "\n",
    "            CASE\n",
    "                WHEN duration_minutes = 0 THEN 1\n",
    "                WHEN duration_minutes <= 2 THEN 2\n",
    "                WHEN duration_minutes <= 5 THEN 3\n",
    "                WHEN duration_minutes <= 10 THEN 4\n",
    "                ELSE 5\n",
    "            END AS band_order\n",
    "\n",
    "        FROM session_duration\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        duration_band,\n",
    "        COUNT(*) AS sessions,\n",
    "\n",
    "        SUM(\n",
    "            CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "        ) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * SUM(\n",
    "                CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "            ) / COUNT(*),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM duration_bands\n",
    "\n",
    "    GROUP BY\n",
    "        duration_band,\n",
    "        band_order\n",
    "\n",
    "    ORDER BY band_order\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "16ae9c76-68d1-45c3-98a2-1605d7ddb831",
   "metadata": {},
   "source": [
    "## Business Question 6: Does the number of cart events in a session relate to purchase behavior?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "46fe4d51-9561-4d90-922f-a6924cee3f6b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬──────────┬─────────────────┬────────────────────┐\n",
       "│ purchased │ sessions │ avg_cart_events │ median_cart_events │\n",
       "│  boolean  │  int64   │     double      │       double       │\n",
       "├───────────┼──────────┼─────────────────┼────────────────────┤\n",
       "│ false     │   960019 │            1.42 │                1.0 │\n",
       "│ true      │   700091 │            1.85 │                1.0 │\n",
       "└───────────┴──────────┴─────────────────┴────────────────────┘"
      ]
     },
     "execution_count": 21,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        purchased,\n",
    "        COUNT(*) AS sessions,\n",
    "        ROUND(AVG(cart_events), 2) AS avg_cart_events,\n",
    "        MEDIAN(cart_events) AS median_cart_events\n",
    "    FROM (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            COUNT(*) AS cart_events\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    )\n",
    "    GROUP BY purchased\n",
    "    ORDER BY purchased\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "86c49d3a-fda2-406a-92d1-511e5f62f904",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌──────────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ event_count_band │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│     varchar      │  int64   │       int128       │    double     │\n",
       "├──────────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ 1 event          │  1143622 │             404637 │         35.38 │\n",
       "│ 2 events         │   308456 │             164996 │         53.49 │\n",
       "│ 3 events         │   107012 │              65633 │         61.33 │\n",
       "│ 4+ events        │   101020 │              64825 │         64.17 │\n",
       "└──────────────────┴──────────┴────────────────────┴───────────────┘"
      ]
     },
     "execution_count": 22,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH session_events AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            COUNT(*) AS cart_events\n",
    "        FROM 'february_cart_events.csv'\n",
    "        GROUP BY user_session, purchased\n",
    "    ),\n",
    "\n",
    "    event_bands AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "\n",
    "            CASE\n",
    "                WHEN cart_events = 1 THEN '1 event'\n",
    "                WHEN cart_events = 2 THEN '2 events'\n",
    "                WHEN cart_events = 3 THEN '3 events'\n",
    "                ELSE '4+ events'\n",
    "            END AS event_count_band,\n",
    "\n",
    "            CASE\n",
    "                WHEN cart_events = 1 THEN 1\n",
    "                WHEN cart_events = 2 THEN 2\n",
    "                WHEN cart_events = 3 THEN 3\n",
    "                ELSE 4\n",
    "            END AS band_order\n",
    "\n",
    "        FROM session_events\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        event_count_band,\n",
    "        COUNT(*) AS sessions,\n",
    "\n",
    "        SUM(\n",
    "            CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "        ) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * SUM(\n",
    "                CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "            ) / COUNT(*),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM event_bands\n",
    "\n",
    "    GROUP BY\n",
    "        event_count_band,\n",
    "        band_order\n",
    "\n",
    "    ORDER BY band_order\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "62f0d990-7a76-4edc-9ac5-e44b873ebcf2",
   "metadata": {},
   "source": [
    "## Business Question 7: Which product categories have higher or lower purchase rates?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "8eaf5845-7d27-4113-a9ce-925e1b0c4baa",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────┬────────────────────┬───────────────────┐\n",
       "│ total_rows │ rows_with_category │ unique_categories │\n",
       "│   int64    │       int64        │       int64       │\n",
       "├────────────┼────────────────────┼───────────────────┤\n",
       "│    2656529 │            2452815 │               137 │\n",
       "└────────────┴────────────────────┴───────────────────┘"
      ]
     },
     "execution_count": 23,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        COUNT(*) AS total_rows,\n",
    "        COUNT(category_code) AS rows_with_category,\n",
    "        COUNT(DISTINCT category_code) AS unique_categories\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "7dabc5e9-aada-4a18-918d-09c70844d6d7",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────────────────────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│           category_code           │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│              varchar              │  int64   │       int64        │    double     │\n",
       "├───────────────────────────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ construction.tools.light          │   657112 │             344041 │         52.36 │\n",
       "│ sport.bicycle                     │   118266 │              45779 │         38.71 │\n",
       "│ electronics.clocks                │    63778 │              24832 │         38.94 │\n",
       "│ apparel.shoes                     │    56099 │              20482 │         36.51 │\n",
       "│ appliances.personal.massager      │    51696 │              23667 │         45.78 │\n",
       "│ electronics.audio.headphone       │    37961 │              16573 │         43.66 │\n",
       "│ appliances.environment.vacuum     │    31239 │              12925 │         41.37 │\n",
       "│ appliances.kitchen.refrigerators  │    28848 │              10444 │          36.2 │\n",
       "│ appliances.kitchen.washer         │    24138 │              10830 │         44.87 │\n",
       "│ computers.peripherals.printer     │    23466 │              11497 │         48.99 │\n",
       "│ apparel.shoes.sandals             │    22156 │               7845 │         35.41 │\n",
       "│ furniture.bedroom.blanket         │    16664 │               7426 │         44.56 │\n",
       "│ construction.components.faucet    │    16345 │               8895 │         54.42 │\n",
       "│ apparel.shoes.slipons             │    15763 │               6620 │          42.0 │\n",
       "│ apparel.shoes.keds                │    14697 │               5481 │         37.29 │\n",
       "│ sport.trainer                     │    14166 │               4503 │         31.79 │\n",
       "│ appliances.kitchen.coffee_grinder │    13856 │               8399 │         60.62 │\n",
       "│ kids.toys                         │    13555 │               4876 │         35.97 │\n",
       "│ apparel.scarf                     │    12375 │               2793 │         22.57 │\n",
       "│ furniture.kitchen.table           │    11538 │               4069 │         35.27 │\n",
       "└───────────────────────────────────┴──────────┴────────────────────┴───────────────┘\n",
       "  20 rows                                                                 4 columns"
      ]
     },
     "execution_count": 24,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        category_code,\n",
    "        COUNT(DISTINCT user_session) AS sessions,\n",
    "\n",
    "        COUNT(DISTINCT CASE\n",
    "            WHEN purchased = TRUE THEN user_session\n",
    "        END) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * COUNT(DISTINCT CASE\n",
    "                WHEN purchased = TRUE THEN user_session\n",
    "            END)\n",
    "            / COUNT(DISTINCT user_session),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM 'february_cart_events.csv'\n",
    "\n",
    "    WHERE category_code IS NOT NULL\n",
    "\n",
    "    GROUP BY category_code\n",
    "\n",
    "    ORDER BY sessions DESC\n",
    "\n",
    "    LIMIT 20\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "0f0c0602-9e0b-45a6-ae52-c9db319741b9",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────────────────────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│           category_code           │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│              varchar              │  int64   │       int64        │    double     │\n",
       "├───────────────────────────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ appliances.kitchen.coffee_grinder │    13856 │               8399 │         60.62 │\n",
       "│ construction.components.faucet    │    16345 │               8895 │         54.42 │\n",
       "│ construction.tools.light          │   657112 │             344041 │         52.36 │\n",
       "│ computers.peripherals.printer     │    23466 │              11497 │         48.99 │\n",
       "│ appliances.personal.massager      │    51696 │              23667 │         45.78 │\n",
       "│ appliances.kitchen.washer         │    24138 │              10830 │         44.87 │\n",
       "│ furniture.bedroom.blanket         │    16664 │               7426 │         44.56 │\n",
       "│ electronics.audio.headphone       │    37961 │              16573 │         43.66 │\n",
       "│ apparel.shoes.slipons             │    15763 │               6620 │          42.0 │\n",
       "│ appliances.environment.vacuum     │    31239 │              12925 │         41.37 │\n",
       "│ electronics.clocks                │    63778 │              24832 │         38.94 │\n",
       "│ sport.bicycle                     │   118266 │              45779 │         38.71 │\n",
       "│ apparel.shoes.keds                │    14697 │               5481 │         37.29 │\n",
       "│ apparel.shoes                     │    56099 │              20482 │         36.51 │\n",
       "│ appliances.kitchen.refrigerators  │    28848 │              10444 │          36.2 │\n",
       "│ kids.toys                         │    13555 │               4876 │         35.97 │\n",
       "│ apparel.shoes.sandals             │    22156 │               7845 │         35.41 │\n",
       "│ furniture.kitchen.table           │    11538 │               4069 │         35.27 │\n",
       "│ accessories.bag                   │    10650 │               3450 │         32.39 │\n",
       "│ sport.trainer                     │    14166 │               4503 │         31.79 │\n",
       "│ apparel.scarf                     │    12375 │               2793 │         22.57 │\n",
       "└───────────────────────────────────┴──────────┴────────────────────┴───────────────┘\n",
       "  21 rows                                                                 4 columns"
      ]
     },
     "execution_count": 25,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH category_metrics AS (\n",
    "        SELECT\n",
    "            category_code,\n",
    "            COUNT(DISTINCT user_session) AS sessions,\n",
    "\n",
    "            COUNT(DISTINCT CASE\n",
    "                WHEN purchased = TRUE THEN user_session\n",
    "            END) AS purchased_sessions,\n",
    "\n",
    "            ROUND(\n",
    "                100.0 * COUNT(DISTINCT CASE\n",
    "                    WHEN purchased = TRUE THEN user_session\n",
    "                END)\n",
    "                / COUNT(DISTINCT user_session),\n",
    "                2\n",
    "            ) AS purchase_rate\n",
    "\n",
    "        FROM 'february_cart_events.csv'\n",
    "\n",
    "        WHERE category_code IS NOT NULL\n",
    "\n",
    "        GROUP BY category_code\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        category_code,\n",
    "        sessions,\n",
    "        purchased_sessions,\n",
    "        purchase_rate\n",
    "    FROM category_metrics\n",
    "    WHERE sessions >= 10000\n",
    "    ORDER BY purchase_rate DESC\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "469495e7-0624-41dd-bb55-11e0acaa1cd9",
   "metadata": {},
   "source": [
    "## Business Question 8: Does brand relate to purchase behavior?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "a98f5e19-01e5-46d6-9a4d-ef43f82a6764",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌────────────┬─────────────────┬───────────────┐\n",
       "│ total_rows │ rows_with_brand │ unique_brands │\n",
       "│   int64    │      int64      │     int64     │\n",
       "├────────────┼─────────────────┼───────────────┤\n",
       "│    2656529 │         2399890 │          3383 │\n",
       "└────────────┴─────────────────┴───────────────┘"
      ]
     },
     "execution_count": 26,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    SELECT\n",
    "        COUNT(*) AS total_rows,\n",
    "        COUNT(brand) AS rows_with_brand,\n",
    "        COUNT(DISTINCT brand) AS unique_brands\n",
    "    FROM 'february_cart_events.csv'\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "1ed399e5-a3b2-4d65-947f-2196fd48df5b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌──────────┬──────────┬────────────────────┬───────────────┐\n",
       "│  brand   │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│ varchar  │  int64   │       int64        │    double     │\n",
       "├──────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ apple    │   353624 │             159422 │         45.08 │\n",
       "│ samsung  │   305404 │             167146 │         54.73 │\n",
       "│ xiaomi   │   154307 │              69134 │          44.8 │\n",
       "│ huawei   │    47575 │              25761 │         54.15 │\n",
       "│ lucente  │    25535 │              14528 │         56.89 │\n",
       "│ oppo     │    19502 │              11546 │          59.2 │\n",
       "│ lg       │    19366 │               8535 │         44.07 │\n",
       "│ sony     │    18576 │               7246 │         39.01 │\n",
       "│ acer     │    15373 │               7847 │         51.04 │\n",
       "│ bosch    │    13825 │               5195 │         37.58 │\n",
       "│ artel    │    13650 │               6450 │         47.25 │\n",
       "│ lenovo   │    11023 │               5257 │         47.69 │\n",
       "│ vitek    │    10888 │               4276 │         39.27 │\n",
       "│ dauscher │    10209 │               4207 │         41.21 │\n",
       "│ defacto  │    10058 │               4003 │          39.8 │\n",
       "│ philips  │    10032 │               3591 │          35.8 │\n",
       "└──────────┴──────────┴────────────────────┴───────────────┘\n",
       "  16 rows                                        4 columns"
      ]
     },
     "execution_count": 27,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH brand_metrics AS (\n",
    "        SELECT\n",
    "            brand,\n",
    "            COUNT(DISTINCT user_session) AS sessions,\n",
    "\n",
    "            COUNT(DISTINCT CASE\n",
    "                WHEN purchased = TRUE THEN user_session\n",
    "            END) AS purchased_sessions,\n",
    "\n",
    "            ROUND(\n",
    "                100.0 * COUNT(DISTINCT CASE\n",
    "                    WHEN purchased = TRUE THEN user_session\n",
    "                END)\n",
    "                / COUNT(DISTINCT user_session),\n",
    "                2\n",
    "            ) AS purchase_rate\n",
    "\n",
    "        FROM 'february_cart_events.csv'\n",
    "\n",
    "        WHERE brand IS NOT NULL\n",
    "\n",
    "        GROUP BY brand\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        brand,\n",
    "        sessions,\n",
    "        purchased_sessions,\n",
    "        purchase_rate\n",
    "\n",
    "    FROM brand_metrics\n",
    "\n",
    "    WHERE sessions >= 10000\n",
    "\n",
    "    ORDER BY sessions DESC\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "581c9e66-4244-4e65-bb81-da0f0963b45e",
   "metadata": {},
   "source": [
    "## Business Question 9: Does purchase behavior vary by time of day?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "41e06aa4-1dfa-41af-9d68-d9165fe5466d",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌──────────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ session_hour │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│    int64     │  int64   │       int128       │    double     │\n",
       "├──────────────┼──────────┼────────────────────┼───────────────┤\n",
       "│            0 │     8057 │               3007 │         37.32 │\n",
       "│            1 │    14387 │               4838 │         33.63 │\n",
       "│            2 │    29803 │              11139 │         37.38 │\n",
       "│            3 │    57061 │              24084 │         42.21 │\n",
       "│            4 │    82589 │              36137 │         43.76 │\n",
       "│            5 │    98948 │              43359 │         43.82 │\n",
       "│            6 │   109235 │              47954 │          43.9 │\n",
       "│            7 │   113811 │              50059 │         43.98 │\n",
       "│            8 │   116802 │              51541 │         44.13 │\n",
       "│            9 │   115198 │              50742 │         44.05 │\n",
       "│            · │      ·   │                ·   │           ·   │\n",
       "│            · │      ·   │                ·   │           ·   │\n",
       "│            · │      ·   │                ·   │           ·   │\n",
       "│           14 │    91593 │              37237 │         40.65 │\n",
       "│           15 │    90923 │              35321 │         38.85 │\n",
       "│           16 │    83749 │              32343 │         38.62 │\n",
       "│           17 │    75151 │              28773 │         38.29 │\n",
       "│           18 │    62827 │              24893 │         39.62 │\n",
       "│           19 │    42973 │              17673 │         41.13 │\n",
       "│           20 │    25669 │              10828 │         42.18 │\n",
       "│           21 │    15332 │               6644 │         43.33 │\n",
       "│           22 │     9236 │               4234 │         45.84 │\n",
       "│           23 │     6865 │               3018 │         43.96 │\n",
       "└──────────────┴──────────┴────────────────────┴───────────────┘\n",
       "  24 rows (20 shown)                                 4 columns"
      ]
     },
     "execution_count": 28,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH session_hours AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            EXTRACT(\n",
    "                HOUR FROM MIN(event_time)\n",
    "            ) AS session_hour\n",
    "\n",
    "        FROM 'february_cart_events.csv'\n",
    "\n",
    "        GROUP BY\n",
    "            user_session,\n",
    "            purchased\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        session_hour,\n",
    "        COUNT(*) AS sessions,\n",
    "\n",
    "        SUM(\n",
    "            CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "        ) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * SUM(\n",
    "                CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "            ) / COUNT(*),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM session_hours\n",
    "\n",
    "    GROUP BY session_hour\n",
    "\n",
    "    ORDER BY session_hour\n",
    "\"\"\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e4e71eb6-654a-4f1f-ab40-9af66afb3d73",
   "metadata": {},
   "source": [
    "## Business Question 10: Does purchase behavior vary by day of the week?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "87108521-b1fd-4a0e-a057-9f0e41c52ee6",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "┌───────────┬──────────┬────────────────────┬───────────────┐\n",
       "│ day_name  │ sessions │ purchased_sessions │ purchase_rate │\n",
       "│  varchar  │  int64   │       int128       │    double     │\n",
       "├───────────┼──────────┼────────────────────┼───────────────┤\n",
       "│ Sunday    │   258210 │             108314 │         41.95 │\n",
       "│ Monday    │   229450 │              95396 │         41.58 │\n",
       "│ Tuesday   │   223421 │              96403 │         43.15 │\n",
       "│ Wednesday │   254275 │             114549 │         45.05 │\n",
       "│ Thursday  │   194258 │              84632 │         43.57 │\n",
       "│ Friday    │   201478 │              88138 │         43.75 │\n",
       "│ Saturday  │   299018 │             112659 │         37.68 │\n",
       "└───────────┴──────────┴────────────────────┴───────────────┘"
      ]
     },
     "execution_count": 29,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "duckdb.sql(\"\"\"\n",
    "    WITH session_days AS (\n",
    "        SELECT\n",
    "            user_session,\n",
    "            purchased,\n",
    "            DAYNAME(MIN(event_time)) AS day_name,\n",
    "            DAYOFWEEK(MIN(event_time)) AS day_number\n",
    "\n",
    "        FROM 'february_cart_events.csv'\n",
    "\n",
    "        GROUP BY\n",
    "            user_session,\n",
    "            purchased\n",
    "    )\n",
    "\n",
    "    SELECT\n",
    "        day_name,\n",
    "        COUNT(*) AS sessions,\n",
    "\n",
    "        SUM(\n",
    "            CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "        ) AS purchased_sessions,\n",
    "\n",
    "        ROUND(\n",
    "            100.0 * SUM(\n",
    "                CASE WHEN purchased = TRUE THEN 1 ELSE 0 END\n",
    "            ) / COUNT(*),\n",
    "            2\n",
    "        ) AS purchase_rate\n",
    "\n",
    "    FROM session_days\n",
    "\n",
    "    GROUP BY\n",
    "        day_name,\n",
    "        day_number\n",
    "\n",
    "    ORDER BY day_number\n",
    "\"\"\")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.13.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
