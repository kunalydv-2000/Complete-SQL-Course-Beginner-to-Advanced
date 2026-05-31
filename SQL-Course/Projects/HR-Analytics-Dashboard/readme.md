# 👨‍💼 HR Analytics Dashboard

> An end-to-end HR Analytics project built using SQL and Power BI to analyze employee demographics, workforce trends, attrition patterns, job satisfaction, and performance metrics. This dashboard helps HR teams and business leaders make data-driven workforce decisions.

---

# 📌 Project Overview

Employee attrition and workforce management are critical challenges for organizations. This project analyzes HR data to uncover insights related to:

- Employee Attrition
- Workforce Demographics
- Department Performance
- Job Satisfaction
- Salary Distribution
- Employee Tenure
- Recruitment Trends

The goal is to transform raw HR data into actionable business insights through SQL analysis and interactive Power BI dashboards.

---

# 🎯 Business Objectives

The dashboard answers the following questions:

### Workforce Overview

- How many employees are currently working?
- What is the overall attrition rate?
- What is the average employee age?
- What is the average monthly income?

### Attrition Analysis

- Which departments have the highest attrition?
- Which age groups are leaving most frequently?
- Which job roles experience the highest turnover?
- Does salary impact attrition?

### Employee Demographics

- Gender distribution
- Marital status distribution
- Education field analysis
- Department-wise employee count

### Performance & Satisfaction

- Job satisfaction by department
- Work-life balance analysis
- Performance rating distribution
- Relationship between satisfaction and attrition

---

# 🏢 Business Problem

Employee turnover results in:

- Increased recruitment costs
- Productivity loss
- Knowledge loss
- Reduced team performance

This dashboard helps HR managers identify:

✅ High-risk employee groups

✅ Attrition drivers

✅ Workforce trends

✅ Employee engagement issues

---

# 🛠️ Tech Stack

| Tool | Purpose |
|--------|---------|
| SQL Server | Data Cleaning & Analysis |
| Power BI | Dashboard Development |
| Excel | Initial Data Exploration |
| GitHub | Project Documentation |
| DAX | KPI Calculations |

---

# 📂 Repository Structure

```text
HR-Analytics-Dashboard/
│
├── datasets/
│   └── hr_data.csv
│
├── sql/
│   ├── schema.sql
│   ├── data_cleaning.sql
│   ├── exploratory_analysis.sql
│   ├── kpi_queries.sql
│   └── advanced_analysis.sql
│
├── powerbi/
│   └── HR_Analytics.pbix
│
├── screenshots/
│   ├── dashboard_overview.png
│   ├── attrition_analysis.png
│   ├── demographics.png
│   └── performance_analysis.png
│
├── documentation/
│   ├── data_dictionary.md
│   ├── business_requirements.md
│   └── insights.md
│
└── README.md
```

---

# 📊 Dataset Information

### Dataset Name

HR Employee Attrition Dataset

### Number of Records

```text
1470 Employees
```

### Number of Columns

```text
35 Columns
```

---

# Key Columns

| Column | Description |
|----------|-------------|
| EmployeeNumber | Unique Employee ID |
| Age | Employee Age |
| Gender | Male/Female |
| Department | Employee Department |
| JobRole | Employee Role |
| MonthlyIncome | Monthly Salary |
| Attrition | Yes/No |
| JobSatisfaction | Satisfaction Score |
| WorkLifeBalance | Work-Life Rating |
| YearsAtCompany | Employee Tenure |

---

# 📈 KPIs

The dashboard tracks the following KPIs:

### Workforce KPIs

```text
Total Employees
Active Employees
Attrition Count
Attrition Rate
Average Age
Average Salary
Average Tenure
```

---

### Satisfaction KPIs

```text
Average Job Satisfaction
Average Work-Life Balance
Performance Rating
Environment Satisfaction
```

---

# 🧹 Data Cleaning Process

The following data preparation steps were performed:

### 1. Missing Value Analysis

```sql
SELECT *
FROM Employees
WHERE ColumnName IS NULL;
```

---

### 2. Duplicate Detection

```sql
SELECT EmployeeNumber,
       COUNT(*)
FROM Employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;
```

---

### 3. Data Type Validation

- Age → Integer
- Income → Numeric
- Attrition → Categorical

---

### 4. Data Standardization

Examples:

```text
Male
male
MALE
```

converted into:

```text
Male
```

---

# 🔍 SQL Analysis

### Attrition Rate

```sql
SELECT

COUNT(
CASE
WHEN Attrition = 'Yes'
THEN 1
END
) * 100.0

/

COUNT(*) AS AttritionRate

FROM Employees;
```

---

### Department-wise Attrition

```sql
SELECT Department,

COUNT(
CASE
WHEN Attrition='Yes'
THEN 1
END
) AS AttritionCount

FROM Employees

GROUP BY Department;
```

---

### Average Salary by Department

```sql
SELECT Department,

AVG(MonthlyIncome) AS AvgSalary

FROM Employees

GROUP BY Department;
```

---

# 📊 Dashboard Pages

---

## Page 1: Executive Summary

### KPIs

- Total Employees
- Attrition Rate
- Average Salary
- Average Age

### Visuals

- KPI Cards
- Department Distribution
- Gender Breakdown

---

## Page 2: Attrition Analysis

### Visuals

- Attrition by Department
- Attrition by Job Role
- Attrition by Age Group
- Attrition by Salary Band

### Key Goal

Identify employee turnover patterns.

---

## Page 3: Employee Demographics

### Visuals

- Gender Distribution
- Marital Status
- Education Field
- Department Breakdown

---

## Page 4: Performance & Satisfaction

### Visuals

- Job Satisfaction Analysis
- Work-Life Balance
- Performance Ratings
- Satisfaction vs Attrition

---

# 💡 Key Insights

Example findings:

### Insight 1

```text
Sales Department shows the highest attrition rate.
```

---

### Insight 2

```text
Employees earning below average salary are more likely to leave.
```

---

### Insight 3

```text
Employees with low job satisfaction have significantly higher attrition.
```

---

### Insight 4

```text
Most employee exits occur within the first 3 years.
```

---

# 📸 Dashboard Preview

## Executive Dashboard

```text
Insert Screenshot Here
```

---

## Attrition Analysis

```text
Insert Screenshot Here
```

---

## Employee Demographics

```text
Insert Screenshot Here
```

---

## Performance Dashboard

```text
Insert Screenshot Here
```

---

# 🚀 How to Run This Project

### Step 1

Clone repository

```bash
git clone https://github.com/yourusername/hr-analytics-dashboard.git
```

---

### Step 2

Import dataset into SQL Server

---

### Step 3

Execute:

```sql
schema.sql
data_cleaning.sql
exploratory_analysis.sql
```

---

### Step 4

Open:

```text
HR_Analytics.pbix
```

in Power BI Desktop.

---

### Step 5

Refresh data connections.

---

# 📚 Skills Demonstrated

### SQL

- SELECT
- WHERE
- GROUP BY
- HAVING
- JOINS
- CASE Statements
- CTEs
- Window Functions

---

### Power BI

- Data Modeling
- DAX Measures
- Interactive Dashboards
- KPI Cards
- Drill-through Reports

---

### Business Analysis

- Attrition Analysis
- Workforce Analytics
- HR KPIs
- Employee Segmentation

---

# 🎓 Learning Outcomes

Through this project, I learned:

- HR Analytics Fundamentals
- Workforce KPI Design
- Data Cleaning Techniques
- Dashboard Storytelling
- Business Insight Generation
- SQL-to-Power BI Workflow

---

# 👤 Author

**Kunal Yadav**

Aspiring Data Analyst

### Connect

- GitHub: `https://github.com/kunalydv-2000`
- LinkedIn: Add Your LinkedIn Profile

---

# ⭐ Project Status

```text
Completed
```

Future Enhancements:

- Predictive Attrition Modeling
- Employee Churn Forecasting
- Machine Learning Integration
- Department Benchmarking