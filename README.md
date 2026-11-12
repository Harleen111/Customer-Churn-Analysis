# Customer Churn Analysis

An end-to-end Customer Churn Analysis project that uses Python, SQL, Machine Learning, and Power BI to understand customer behaviour, identify churn patterns, and generate insights that can support customer retention strategies.

## Project Overview

Customer churn occurs when customers stop using a company's products or services. Understanding why customers leave helps businesses improve customer satisfaction and develop effective retention strategies.

This project analyzes customer data to identify churn patterns, explore factors influencing customer churn, and present meaningful insights through an interactive Power BI dashboard.

## Objectives

- Analyze customer data and identify churn patterns.
- Understand the relationship between customer characteristics and churn.
- Perform data cleaning and exploratory data analysis.
- Use SQL queries to analyze customer information.
- Develop a machine learning model for churn analysis.
- Build an interactive Power BI dashboard to communicate business insights.

## Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data analysis and preprocessing |
| Pandas | Data manipulation |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Scikit-learn | Machine learning |
| SQL / SQLite | Database management and querying |
| Power BI | Interactive dashboard development |
| Jupyter Notebook | Exploratory analysis and experimentation |
| Git & GitHub | Version control and project hosting |

## Dataset

The project uses a customer churn dataset containing **7,043 customer records**.

The dataset includes customer information such as:

- Demographics
- Contract details
- Tenure
- Internet services
- Payment methods
- Monthly charges
- Churn status

## Project Workflow

### 1. Data Understanding and Preprocessing
- Loaded and explored the dataset.
- Examined data types and missing values.
- Performed data cleaning and preprocessing.
- Prepared the data for further analysis.

### 2. Exploratory Data Analysis
- Analyzed customer churn distribution.
- Examined churn across contract types.
- Compared churn across tenure groups.
- Studied payment methods and internet services.
- Identified customer characteristics associated with churn.

### 3. SQL Analysis
Used SQL queries to perform customer-level analysis and extract useful business insights.

### 4. Machine Learning
Developed and saved a machine learning model for customer churn analysis. The trained model is stored in the `models` directory.

### 5. Power BI Dashboard

Created a three-page Power BI dashboard.

**Page 1 – Executive Overview**
- Total Customers
- Churned Customers
- Retained Customers
- Churn Rate
- Customer Churn Distribution
- Key Business Insights

**Page 2 – Customer & Services Analysis**
- Churn Rate by Internet Service
- Churn Rate by Online Security
- Churn Rate by Tech Support
- Churn Rate by Senior Citizen Status

**Page 3 – Churn Drivers Analysis**
- Churn Rate by Contract
- Churn Rate by Tenure Group
- Churn Rate by Payment Method
- Average Monthly Charges by Churn Status

The dashboard uses a consistent purple-themed design with interactive page navigation.

## Key Business Insights

- Overall customer churn rate is approximately **26.54%**.
- Out of 7,043 customers, 1,869 customers have churned.
- Approximately 73.46% of customers have been retained.
- Month-to-month contracts have the highest churn rate (42.7%).
- Fiber optic customers show a high churn rate (41.9%).
- Customers without online security show a high churn rate (41.8%).
- Electronic check users have the highest churn rate (45.3%).
- Customers with shorter tenure are more likely to churn.

## Project Structure

```text
Customer-Churn-Analysis/
│
├── notebooks/
│   └── 01_Data_Understanding.ipynb
│
├── sql/
│   └── customer_churn_analysis.sql
│
├── models/
│   └── customer_churn_model.pkl
│
├── visualizations/
│   └── [Generated analysis charts]
│
├── dashboard/
│   └── Customer_Churn_Dashboard.pbix
│
└── README.md
```

## How to Explore the Project

1. Clone or download this repository.
2. Open the Jupyter notebook in the `notebooks` directory to explore the data analysis.
3. Run the SQL queries from the `sql` directory using SQLite.
4. Explore the generated charts in the `visualizations` directory.
5. Open `Customer_Churn_Dashboard.pbix` using Power BI Desktop to interact with the dashboard.

## Future Improvements

- Develop a customer churn prediction interface.
- Improve model evaluation and compare multiple algorithms.
- Add more interactive dashboard filters.
- Develop customer retention recommendations.
- Deploy the prediction model as a web application.

## Conclusion

This project demonstrates an end-to-end approach to customer churn analysis by combining data preprocessing, exploratory data analysis, SQL, machine learning, and business intelligence.

It highlights how data-driven insights can help businesses understand customer behaviour, identify churn risks, and make informed customer retention decisions.