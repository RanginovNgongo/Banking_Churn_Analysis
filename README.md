# Bank Customer Churn Analysis & Prediction

📊 Project Overview
This project addresses a critical business challenge: Customer Attrition. By analyzing 10,000 customer records, I built a predictive model to identify "High-Risk" individuals before they leave and visualized the findings in a professional Power BI Dashboard.

Key Insights Discovered:
- The Product Cliff: Customers with 3 or 4 products have a nearly 100% churn rate, suggesting a failure in multi-product cross-selling strategy.
- Regional Risk: Germany shows significantly higher churn rates (32%) compared to France and Spain, despite having similar balance distributions.
- Demographic Sweet Spot: Customers aged 45–60 (Mid-Career/Senior) are the most likely to exit, representing a high-value segment at risk.

🛠️ Tech Stack
- SQL: Data cleaning and feature engineering (Age Grouping, Gender Labeling).
- Python (Scikit-Learn): Random Forest Classifier for churn prediction.
- Power BI: Interactive dashboarding and DAX measures for KPI tracking.
- Pandas/Seaborn: Exploratory Data Analysis (EDA).

📈 Dashboard Features
The interactive Power BI dashboard provides:
- Liquidity Distribution: Visualizing the $132M total balance across regions.
- Churn Probability (AI): A predictive score for every customer.
- Loyalty Benchmarking: Comparing Tenure vs. Exit rates.
- Actionable "Hit List": A filtered view of high-value customers with >70% risk scores.

💡 Business Recommendations
- Review Multi-Product Strategy: Investigate why customers with 3+ products are exiting. Is it fee-fatigue or poor service integration?
- Targeted German Retention: Launch a loyalty program specifically for the German market to stabilize the high exit rate.
- Concierge Service for Seniors: Implement a high-touch service model for customers aged 50+ to protect high-balance accounts.

📸 PowerBI Visualization

<img width="582" height="334" alt="image" src="https://github.com/user-attachments/assets/a92d8442-1efe-4fac-bd30-ca38954eed64" />

🗂️ Project Directory Structure
- Raw_data/
Bank Customer Churn Prediction.csv: The original dataset containing 10,000 customer records.
- SQL_Analysis/
Banking_Churn_Analysis.sql: Scripts used for data cleaning, feature engineering, and creating customer segments.
- Python_analysis/
churn_analysis.ipynb: Jupyter Notebook containing Exploratory Data Analysis (EDA), Data Scaling, and the Random Forest Machine Learning model.
- PowerBI_Dashboard/
Banking_Churn_Data_Visualization.pbix: The final interactive dashboard file used for executive reporting and data visualization.
