
-- =====================================================
-- Customer Churn Analysis
-- Database: customer_churn.db
-- Table: customers
-- =====================================================


-- 32.1 Loading Cleaned Data into SQLite Database
-- Note: Data loading is performed through Python using pandas to_sql().
-- No separate SQL INSERT query is required.


-- 32.2 Verifying Data in SQLite Database
SELECT *
FROM customers
LIMIT 5;


-- 32.3 Overall Customer Churn Analysis
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers;


-- 32.4 Customer Churn Analysis by Contract Type
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;


-- 32.5 Customer Churn Analysis by Tenure Group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY Tenure_Group
ORDER BY MIN(tenure);

-- 32.6 Customer Churn Analysis by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY PaymentMethod
ORDER BY Churn_Rate_Percentage DESC, Total_Customers DESC;

-- 32.7 Customer Churn Analysis by Internet Service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY InternetService
ORDER BY Churn_Rate_Percentage DESC, Total_Customers DESC;

-- 32.8 Customer Churn Analysis by Online Security
SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY OnlineSecurity
ORDER BY Churn_Rate_Percentage DESC, Total_Customers DESC;

-- 32.9 Customer Churn Analysis by Tech Support
SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY TechSupport
ORDER BY Churn_Rate_Percentage DESC, Total_Customers DESC;

-- 32.10 Monthly Charges Analysis by Churn Status
SELECT
    CASE WHEN Churn = 1 THEN 'Churned' ELSE 'Retained' END AS Churn_Status,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,
    ROUND(MIN(MonthlyCharges), 2) AS Minimum_Monthly_Charges,
    ROUND(MAX(MonthlyCharges), 2) AS Maximum_Monthly_Charges
FROM customers
GROUP BY Churn
ORDER BY Churn DESC;

-- 32.11 Customer Churn Analysis by Senior Citizen Status
SELECT
    CASE WHEN SeniorCitizen = 1 THEN 'Senior Citizen' ELSE 'Non-Senior Citizen' END AS Senior_Citizen_Status,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY SeniorCitizen
ORDER BY SeniorCitizen;

-- 32.12 Customer Churn Analysis by Partner and Dependents
SELECT
    Partner,
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM customers
GROUP BY Partner, Dependents
ORDER BY Churn_Rate_Percentage DESC, Total_Customers DESC;

-- 32.13 High-Risk Customer Segment Analysis
SELECT
    CASE
        WHEN Contract = 'Month-to-month'
         AND tenure <= 12
         AND PaymentMethod = 'Electronic check'
        THEN 'High-Risk Segment'
        ELSE 'Other Customers'
    END AS Customer_Segment,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customers
GROUP BY Customer_Segment
ORDER BY CASE WHEN Customer_Segment = 'High-Risk Segment' THEN 0 ELSE 1 END;

-- 32.14 Customer Revenue Analysis
SELECT
    CASE WHEN Churn = 1 THEN 'Churned' ELSE 'Retained' END AS Churn_Status,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(MonthlyCharges), 2) AS Sum_of_Monthly_Charges,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,
    ROUND(SUM(TotalCharges), 2) AS Sum_of_Historical_Total_Charges
FROM customers
GROUP BY Churn
ORDER BY Churn DESC;

-- 32.15 Final SQL Business Insights
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Overall_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN Contract = 'Month-to-month' AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN Contract = 'Month-to-month' THEN 1 ELSE 0 END), 0), 2) AS Month_to_month_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN tenure <= 12 AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN tenure <= 12 THEN 1 ELSE 0 END), 0), 2) AS First_12_Months_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN PaymentMethod = 'Electronic check' AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN PaymentMethod = 'Electronic check' THEN 1 ELSE 0 END), 0), 2) AS Electronic_Check_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN InternetService = 'Fiber optic' AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN InternetService = 'Fiber optic' THEN 1 ELSE 0 END), 0), 2) AS Fiber_Optic_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN OnlineSecurity = 'No' AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN OnlineSecurity = 'No' THEN 1 ELSE 0 END), 0), 2) AS No_Online_Security_Churn_Rate_Percentage,
    ROUND(SUM(CASE WHEN TechSupport = 'No' AND Churn = 1 THEN 1.0 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN TechSupport = 'No' THEN 1 ELSE 0 END), 0), 2) AS No_Tech_Support_Churn_Rate_Percentage,
    ROUND(AVG(CASE WHEN Churn = 1 THEN MonthlyCharges END), 2) AS Churned_Average_Monthly_Charges,
    ROUND(AVG(CASE WHEN Churn = 0 THEN MonthlyCharges END), 2) AS Retained_Average_Monthly_Charges
FROM customers;