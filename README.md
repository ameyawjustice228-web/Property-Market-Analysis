
# **Project 9 — Team 1 — Property Market Analysis**

**Organisation:** data-analytics-internship-2026
**Domain:** Real Estate
**Difficulty:** Intermediate
**Competition:** Project 9 — Team 2 (Head-to-Head)

---

## **Crown Metric Answer**

### **Question**

Which NYC borough has had the strongest property price growth rate over the available data?

---

### **Final Answer (Data-Supported)**

Manhattan has the strongest property price growth rate, with a **+28.87% year-over-year increase**, outperforming all other boroughs.

---

### **Supporting Evidence**

* Overall market growth: **+9.2% YoY**
* Manhattan growth: **+28.87% (highest)**
* All boroughs recorded positive growth, but none matched Manhattan

---

### **Why Manhattan Leads**

* Highest demand and strong global investment interest
* High concentration of luxury properties, which drives price increases
* Strong appreciation in high-end neighbourhoods such as SoHo

---

### **Conclusion**

Based on year-over-year analysis, Manhattan clearly demonstrates the strongest price growth, making it the top-performing borough and the correct answer to the crown metric question.

---

## **Group Members**

| Name | Role               | Track |
| ---- | ------------------ | ----- |
| TBC  | Project Manager    | —     |
| TBC  | Technical Deputy   | —     |
| TBC  | Data/Python Member | Data  |
| TBC  | SQL Member         | Data  |
| TBC  | BI Member          | BI    |

---

## **Repository Structure**

```
project-9-team-1/
├── notebooks/
├── sql/
├── src/
├── reports/
├── slides/
├── dashboard_link.md
├── known_issues.md
└── README.md
```

---

## **Deliverables Tracker**

| Deliverable                    | Owner              | Status      | Due    |
| ------------------------------ | ------------------ | ----------- | ------ |
| EDA Notebook                   | Data/Python Member | In Progress | Week 6 |
| SQL Query Library (8+ queries) | SQL Member         | In Progress | Week 6 |
| Dashboard                      | BI Member          | Not Started | Week 6 |
| Written Report                 | All Members        | In Progress | Week 7 |
| Slide Deck                     | All Members        | Not Started | Week 7 |

---

## **Tool Decision**

**Selected Tool:** Power BI

### **Reason**

* Strong interactive visualisation capabilities
* Effective KPI dashboards and storytelling
* Advanced DAX support for metrics such as:

  * Year-over-Year Growth
  * Most Expensive Borough
* Suitable for both academic and industry use

---

## **BigQuery Configuration**

| Setting        | Value                                                 |
| -------------- | ----------------------------------------------------- |
| GCP Project ID | TBC                                                   |
| Dataset        | bigquery-public-data.new_york.nys_real_property_sales |
| Billing Alert  | Yes                                                   |
| Tool Connected | Yes                                                   |

---

## **Week 1 Checklist**

* BigQuery dataset accessed and previewed
* Billing alert configured
* Colab notebook created and tested
* Dashboard tool selected and connected
* GitHub repository shared with all members
* Project guide reviewed and EDA questions defined
* Team roles assigned and meetings scheduled

---

## **EDA Insights**

* Strong price growth across all boroughs
* Manhattan dominates both price and growth
* The market is highly skewed due to luxury properties
* Older buildings command higher prices
* Seasonal patterns influence transaction volume

---

## **Known Issues (Summary)**

### **Data Quality**

* Dataset reduced from 84,548 to 24,668 records
* Missing values and outliers present
* High skewness (16.17) due to luxury properties

### **Analytical Decisions**

* Used median alongside mean for better representation
* Focused only on residential categories
* Defined luxury properties as those above two times the average price

---

## **SQL API Contract**


-- Always start queries with this filter to control scan cost
SELECT *
FROM `ecommerce-analytics01.nyc.property_sales`;

---

## **Query Run Log**

| Query File                    | Purpose               | Date   | Result                         |
| ----------------------------- | --------------------- | ------ | ------------------------------ |
| sql/01_overview.sql           | Dataset summary       | Week 1 | Data validated                 |
| sql/02_borough_growth.sql     | YoY growth by borough | Week 2 | Manhattan highest              |
| sql/03_price_distribution.sql | Skewness analysis     | Week 2 | Highly skewed                  |
| sql/04_neighborhood_rank.sql  | Top neighborhoods     | Week 3 | SoHo highest                   |
| sql/05_time_trends.sql        | Monthly trends        | Week 3 | Seasonal pattern identified    |
| sql/06_building_age.sql       | Age vs price          | Week 4 | Older buildings more expensive |
| sql/07_price_per_sqft.sql     | Efficiency metric     | Week 4 | Manhattan leads                |
| sql/08_luxury_analysis.sql    | Luxury segmentation   | Week 5 | Concentrated in Manhattan      |

---

## **Final Project Positioning**

This project delivers a data-driven analysis of the New York City real estate market, combining statistical analysis, SQL querying, and interactive dashboards to generate actionable insights.

The conclusion is strongly supported by data:

**Manhattan is the top-performing borough in terms of property price growth.**

---

## **Competitive Advantage**

* Clear year-over-year growth metric (28.87%)
* Strong statistical backing, including skewness and median vs mean comparison
* Multi-level analysis across borough, neighbourhood, and time dimensions
* Clean data pipeline and structured analytical methodology

