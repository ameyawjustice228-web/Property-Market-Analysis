SELECT * FROM `ecommerce-analytics01.nyc.property_sales`;

---average sale price by Borough--
SELECT
  COUNTY_NAME,
  AVG(`SALE PRICE`) AS avg_sale_price,
  APPROX_QUANTILES(`SALE PRICE`, 100)[OFFSET(50)] AS median_sale_price
FROM `ecommerce-analytics01.propert_market.property`
WHERE `SALE PRICE` > 0
GROUP BY COUNTY_NAME
ORDER BY avg_sale_price DESC;

-- price per square foot calculation--

SELECT *, SAFE_DIVIDE(`SALE PRICE`, `GROSS SQUARE FEET`) AS price_per_sqft
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `GROSS SQUARE FEET` > 0 AND `SALE PRICE` > 0;

-- Annual average price trend--
SELECT
  EXTRACT(YEAR FROM `SALE DATE`) AS year, AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY year
ORDER BY year;

-- Top 10 most expensive neighbourhoods--
SELECT neighborhood, AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY neighborhood
ORDER BY avg_sale_price DESC
LIMIT 10;

--- Price change by borough--
WITH
  yearly_prices AS (
    SELECT
      COUNTY_NAME,
      EXTRACT(YEAR FROM `SALE DATE`) AS year,
      AVG(`SALE PRICE`) AS avg_price
    FROM `ecommerce-analytics01.nyc.property_sales`
    WHERE `SALE PRICE` > 0
    GROUP BY COUNTY_NAME, year
  )
SELECT
  COUNTY_NAME,
  year,
  avg_price,
  LAG(avg_price)
    OVER (PARTITION BY COUNTY_NAME ORDER BY year) AS prev_year_price,
  SAFE_DIVIDE(
    avg_price - LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year),
    LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year))
    * 100 AS yoy_percent_change
FROM yearly_prices
ORDER BY COUNTY_NAME, year;

--- Building age analysis --

SELECT
  CASE
    WHEN `YEAR BUILT` < 1950 THEN 'pre-1950'
    WHEN `YEAR BUILT` BETWEEN 1950 AND 2000 THEN '1950-2000'
    ELSE 'post-2000'
    END
    AS building_era,
  COUNT(*) AS total_properties,
  AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY building_era
ORDER BY building_era;

-- Transaction volume by month --
SELECT
  FORMAT_DATE('%Y-%m', DATE(`SALE DATE`)) AS sale_month,
  COUNT(*) AS total_transactions
FROM `ecommerce-analytics01.nyc.property_sales`
GROUP BY sale_month
ORDER BY sale_month;

--CTE: properties priced significantly above borough average --

SELECT *
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 2 * (
  SELECT AVG(`SALE PRICE`)
  FROM `ecommerce-analytics01.nyc.property_sales` p2
  WHERE p2.BOROUGH = `ecommerce-analytics01.nyc.property_sales`.BOROUGH
);


WITH quarterly_prices AS (
  SELECT 
    COUNTY_NAME,
    EXTRACT(YEAR FROM DATE(`SALE DATE`)) AS year,
    EXTRACT(QUARTER FROM DATE(`SALE DATE`)) AS quarter,
    AVG(`SALE PRICE`) AS avg_price
  FROM `ecommerce-analytics01.nyc.property_sales`
  WHERE `SALE PRICE` > 0
    AND COUNTY_NAME = 'Bronx'
  GROUP BY COUNTY_NAME, year, quarter
),

qoq_growth AS (
  SELECT 
    year,
    quarter,
    avg_price,
    LAG(avg_price) OVER (ORDER BY year, quarter) AS prev_price,
    SAFE_DIVIDE(
      avg_price - LAG(avg_price) OVER (ORDER BY year, quarter),
      LAG(avg_price) OVER (ORDER BY year, quarter)
    ) * 100 AS qoq_growth_pct
  FROM quarterly_prices
)

SELECT 
  AVG(qoq_growth_pct) AS avg_qoq_growth_pct,
  STDDEV(qoq_growth_pct) AS volatility_stddev
FROM qoq_growth
WHERE qoq_growth_pct IS NOT NULL;

--highest price per foot--
SELECT 
  BOROUGH,
  NEIGHBORHOOD,
  ADDRESS,
  `SALE PRICE`,
  `GROSS SQUARE FEET`,
  SAFE_DIVIDE(`SALE PRICE`, `GROSS SQUARE FEET`) AS PRICE_PER_SQFT
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` >= 10000
  AND `GROSS SQUARE FEET` > 0
ORDER BY PRICE_PER_SQFT DESC
LIMIT 1;

---Strongest Year-over-Year Growth--

WITH yearly_prices AS (
  SELECT 
    COUNTY_NAME,
    EXTRACT(YEAR FROM DATE(`SALE DATE`)) AS year,
    AVG(`SALE PRICE`) AS avg_price
  FROM `ecommerce-analytics01.nyc.property_sales`
  WHERE `SALE PRICE` > 0
  GROUP BY COUNTY_NAME, year
),

yoy_growth AS (
  SELECT 
    COUNTY_NAME,
    year,
    avg_price,
    LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year) AS prev_year_price,
    SAFE_DIVIDE(
      avg_price - LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year),
      LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year)
    ) * 100 AS yoy_growth_pct
  FROM yearly_prices
)

SELECT *
FROM yoy_growth
WHERE year = 2017
ORDER BY yoy_growth_pct DESC;



--with quarterly
WITH quarterly_prices AS (
  SELECT 
    COUNTY_NAME,
    EXTRACT(YEAR FROM DATE(`SALE DATE`)) AS year,
    EXTRACT(QUARTER FROM DATE(`SALE DATE`)) AS quarter,
    AVG(`SALE PRICE`) AS avg_price
  FROM `ecommerce-analytics01.nyc.property_sales`
  WHERE `SALE PRICE` > 0
  GROUP BY county_name, year, quarter
),

qoq_growth AS (
  SELECT 
    COUNTY_NAME,
    year,
    quarter,
    avg_price,
    LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year, quarter) AS prev_price,
    SAFE_DIVIDE(
      avg_price - LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year, quarter),
      LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year, quarter)
    ) * 100 AS qoq_growth_pct
  FROM quarterly_prices
),

summary AS (
  SELECT 
    COUNTY_NAME,
    AVG(qoq_growth_pct) AS avg_qoq_growth_pct,
    STDDEV(qoq_growth_pct) AS volatility_stddev
  FROM qoq_growth
  WHERE qoq_growth_pct IS NOT NULL
  GROUP BY COUNTY_NAME
)

SELECT *
FROM summary
ORDER BY avg_qoq_growth_pct DESC;