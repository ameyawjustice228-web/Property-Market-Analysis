

# **NYC Property Market Analysis Report**

**Advanced Data Science & Analytics · Group 17**

---

## **1. Executive Summary**

This project presents a comprehensive analysis of residential property sales in New York City, covering **24,668 transactions** from **September 2016 to August 2017**.

The objective is to uncover key market trends, evaluate borough-level performance, and identify high-value investment opportunities. The analysis reveals strong price growth, significant disparities across boroughs, and a highly skewed price distribution driven by luxury properties.

---

## **2. Introduction**

The real estate market in New York City is one of the most dynamic and complex in the world. Understanding property price behaviour across boroughs and neighbourhoods is critical for investors, policymakers, and stakeholders.

This project analyses cleaned data derived from **84,548 raw records**, focusing on residential property categories to ensure consistency and relevance.

---

## **3. Objectives**

The main objectives of this project are to:

* Analyse property price trends across NYC boroughs
* Identify the most expensive and high-growth areas
* Evaluate the impact of location, time, and building characteristics on pricing
* Provide data-driven recommendations for real estate investment

---

## **4. Dataset Overview**

* **Source:** NYC Rolling Sales Dataset (2016–2017)
* **Raw Data:** 84,548 records
* **Cleaned Data:** 24,668 records
* **Time Period:** September 2016 – August 2017

### **Key Metrics**

* Total Transactions: 24,668
* Average Sale Price: $757,000
* Median Price: $590,000
* Average Price per Sq Ft: $399
* Luxury Properties: 1,166

---

## **5. Methodology**

The project followed a structured data analytics workflow:

### **Data Cleaning**

* Removed missing and inconsistent values
* Filtered relevant residential categories
* Standardised formats for analysis

### **Data Analysis**

* Exploratory Data Analysis (EDA)
* Aggregation by borough and neighbourhood
* Time-series analysis for trends

### **Visualization**

* Built interactive dashboards using Power BI
* Created KPIs and comparative visuals

---

## **6. Borough Analysis**

A clear hierarchy exists among the five boroughs:

| Borough       | Average Price |
| ------------- | ------------- |
| Manhattan     | $6,574,102    |
| Brooklyn      | $994,340      |
| Queens        | $671,744      |
| Staten Island | $516,382      |
| Bronx         | $482,205      |

### **Key Insights**

* Manhattan dominates the market with prices **6.6 times higher than Brooklyn**
* Price per square foot is highest in Manhattan at **$1,531**
* The Bronx remains the most affordable borough

---

## **7. Market Trends Analysis**

### **Price Growth**

* Average price increased from **$715K (2016) to $780K (2017)**
* Overall growth: **+9.2% YoY**
* Manhattan recorded the highest growth: **+28.87%**

### **Seasonality**

* Peak transactions: **June 2017 (2,354 sales)**
* Lowest transactions: **August 2017 (1,601 sales)**

This indicates clear seasonal patterns in the market.

---

## **8. Neighbourhood Analysis**

The most expensive neighbourhoods are concentrated in Manhattan.

### **Top Neighborhood**

* SoHo

  * Average Price: $17.85 million

### **Other High-Value Areas**

* Greenwich Village (Central & West)
* Upper East Side
* Upper West Side
* Chelsea

### **Insight**

Luxury real estate is heavily concentrated in a few prime neighbourhoods, driving overall market averages.

---

## **9. Building Characteristics Analysis**

### **Price by Building Age**

* Pre-1900: $1.49 million
* Post-1980: $644,996

### **Distribution**

* 63.6% of properties were built before 1950

### **Insight**

Older buildings command higher prices due to:

* Prime locations
* Historical significance
* Architectural value

---

## **10. Statistical Analysis**

### **Skewness**

* Value: **16.17 (Highly right-skewed)**

### **Interpretation**

* A small number of high-value properties significantly increase the average price
* The mean ($757K) is much higher than the median ($590K)

### **Implication**

Median price is a more reliable indicator of the typical market value.

---

## **11. Key Findings**

1. Strong overall price growth across all boroughs
2. Manhattan dominates both price and growth
3. Luxury properties heavily influence the market
4. Older buildings command higher prices
5. Clear seasonal patterns in transaction volume

---

## **12. Business Recommendations**

Based on the analysis:

* Investors seeking high returns should focus on **Manhattan luxury properties**
* Mid-level investors should consider **Brooklyn and Queens**
* Historic properties offer better long-term value
* Market entry should align with **seasonal peaks** for maximum returns

---

## **13. Tools and Technologies**

* **SQL:** Data extraction and querying
* **Python:** Data cleaning and exploratory analysis
* **Power BI:** Dashboard visualization and reporting

---

## **14. Limitations**

* Data covers only one year (2016–2017)
* External factors (interest rates, policy changes) were not included
* Rental market data was not analysed

---

## **15. Future Improvements**

* Incorporate multi-year data for trend forecasting
* Build predictive models for price estimation
* Integrate rental and commercial property data
* Develop real-time dashboards

---

## **16. Conclusion**

This project demonstrates how data analytics can provide deep insights into complex real estate markets. By analysing property sales across New York City, we identified key trends, investment opportunities, and market dynamics.

The findings highlight the importance of location, market timing, and property characteristics in determining real estate value.
