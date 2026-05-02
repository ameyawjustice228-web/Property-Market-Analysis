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

--price per square foot calculation--

SELECT 
  *,
  SAFE_DIVIDE(`SALE PRICE`, `GROSS SQUARE FEET`) AS price_per_sqft
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `GROSS SQUARE FEET` > 0
  AND `SALE PRICE` > 0;

  --Annual average price trend--
  SELECT 
  EXTRACT(YEAR FROM `SALE DATE`) AS year,
  AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY  year
ORDER BY year;

--Top 10 most expensive neighbourhoods--
SELECT 
  neighborhood,
  AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY neighborhood
ORDER BY avg_sale_price DESC
LIMIT 10;


--- Price change by borough--
WITH yearly_prices AS (
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
  LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year) AS prev_year_price,
  SAFE_DIVIDE(
    avg_price - LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year),
    LAG(avg_price) OVER (PARTITION BY COUNTY_NAME ORDER BY year)
  ) * 100 AS yoy_percent_change
FROM yearly_prices
ORDER BY COUNTY_NAME, year;

--- Building age analysis --

SELECT 
  CASE 
    WHEN `YEAR BUILT` < 1950 THEN 'pre-1950'
    WHEN `YEAR BUILT` BETWEEN 1950 AND 2000 THEN '1950-2000'
    ELSE 'post-2000'
  END AS building_era,
  COUNT(*) AS total_properties,
  AVG(`SALE PRICE`) AS avg_sale_price
FROM `ecommerce-analytics01.nyc.property_sales`
WHERE `SALE PRICE` > 0
GROUP BY building_era
ORDER BY building_era;

--Transaction volume by month --
SELECT 
  FORMAT_DATE('%Y-%m', DATE(`SALE DATE`)) AS sale_month,
  COUNT(*) AS total_transactions
FROM `ecommerce-analytics01.nyc.property_sales`
GROUP BY sale_month
ORDER BY sale_month;


