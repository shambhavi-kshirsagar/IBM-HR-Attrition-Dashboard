SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_data;

SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_data
GROUP BY department
ORDER BY attrition_rate_pct DESC;

SELECT 
    CASE 
        WHEN age < 25 THEN '<25'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_data
GROUP BY age_group
ORDER BY attrition_rate_pct DESC;

SELECT 
    CASE 
        WHEN yearsatcompany < 1 THEN '0-1 yrs'
        WHEN yearsatcompany < 2 THEN '1-2 yrs'
        WHEN yearsatcompany < 5 THEN '2-5 yrs'
        WHEN yearsatcompany < 10 THEN '5-10 yrs'
        ELSE '10+ yrs'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_data
GROUP BY tenure_group
ORDER BY attrition_rate_pct DESC;

SELECT 
    attrition,
    ROUND(AVG(monthlyincome), 2) AS avg_monthly_income,
    ROUND(MIN(monthlyincome), 2) AS min_income,
    ROUND(MAX(monthlyincome), 2) AS max_income
FROM hr_data
GROUP BY attrition;

SELECT 
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_data
GROUP BY overtime
ORDER BY attrition_rate_pct DESC;