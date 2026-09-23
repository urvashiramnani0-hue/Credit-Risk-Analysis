# Credit Risk Analysis

## Project Overview

An end-to-end credit risk analysis project focused on understanding loan default patterns and identifying borrower segments associated with higher credit risk.

The project uses Python for data cleaning and exploratory data analysis, SQL Server for business analysis, and Power BI for interactive dashboard development.

## Business Objective

The objective is to analyze borrower and loan characteristics to understand:

- Overall loan default rate
- Default patterns across loan grades
- Relationship between borrower income and default risk
- Impact of loan burden on default rates
- Default patterns across loan purposes
- Differences in risk across home ownership categories
- Interest rate patterns across loan grades
- Risk concentration across different borrower segments

## Tools & Technologies

- **Python** – Pandas, NumPy, Matplotlib, Seaborn
- **Jupyter Notebook** – Data cleaning and exploratory data analysis
- **SQL Server / SSMS** – Business analysis and SQL queries
- **Power BI** – Interactive dashboard and data visualization
- **GitHub** – Project documentation and version control

## Dataset

The project uses a loan/credit risk dataset containing borrower information, loan details, credit history and loan repayment status.

Key fields include:

- Person age
- Person income
- Home ownership
- Employment length
- Loan intent
- Loan grade
- Loan amount
- Loan interest rate
- Loan status
- Loan-to-income percentage
- Previous default history
- Credit history length

The dataset contains **32,581 records** before cleaning.

## Data Cleaning

Data cleaning was performed using Python and Pandas.

Key steps included:

- Removed duplicate records
- Removed unrealistic age values
- Handled invalid employment length values
- Imputed missing employment length values using the median
- Imputed missing interest rates using the median interest rate within each loan grade
- Verified missing values and duplicates after cleaning
- Created income groups for risk analysis
- Created loan burden groups based on loan-to-income percentage

Final cleaned dataset:

**32,409 records**

## Exploratory Data Analysis

The analysis examined default patterns across several borrower and loan characteristics.

Key areas analyzed:

- Default rate by loan grade
- Default rate by loan intent
- Default rate by income group
- Default rate by loan burden
- Default rate by home ownership
- Interest rate by loan grade
- Income and loan burden relationship
- Loan grade and loan burden relationship

## Key Insights

- Overall default rate in the cleaned dataset is approximately **21.87%**.
- Default rates increase substantially across higher-risk loan grades.
- Borrowers with lower income levels show higher default rates than higher-income groups.
- Default rates increase significantly as loan burden increases.
- Renters show higher default rates than homeowners in this dataset.
- Higher-risk loan grades are associated with higher average interest rates.
- The combination of borrower income and loan burden provides additional context for identifying higher-risk segments.

> These findings describe patterns in the dataset and should not be interpreted as causal relationships.

## Power BI Dashboard

The Power BI dashboard contains three analytical pages:

### 1. Credit Risk Overview

Provides an overall portfolio view including:

- Total loans
- Total defaults
- Default rate
- Average loan amount
- Default rate by loan grade
- Default rate by loan intent
- Loan status distribution
- Interactive filters

### 2. Borrower Risk Analysis

Focuses on borrower characteristics and financial burden:

- Default rate by income group
- Default rate by loan burden
- Default rate by home ownership
- Income × loan burden risk matrix
- Average interest rate by loan grade

### 3. Risk Segmentation

Explores risk concentration across borrower and loan segments:

- Loan grade × loan burden matrix
- Default rate by loan intent
- Total defaults by loan intent
- Interactive loan burden filtering

## Project Workflow

```text
Raw Dataset
     ↓
Python / Pandas
     ↓
Data Cleaning & EDA
     ↓
Cleaned Dataset
     ↓
SQL Server
     ↓
Business Analysis
     ↓
Power BI
     ↓
Interactive Dashboard
     ↓
Risk Insights & Recommendations

PROJECT STUCTURE
Credit-Risk-Analysis/
│
├── DATA/
│ ├── credit_risk_dataset.csv
│ └── credit_risk_cleaned.csv
│
├── NOTEBOOKS/
│ └── Credit_Risk_Analysis.ipynb
│
├── POWER BI/
│ ├── creditriskanalysis.pbix
│ └── credit risk analysis dashboard.pdf
│
├── SQL/
│ └── credit_risk_analysis.sql
│
└── README.md
Conclusion

This project demonstrates an end-to-end data analytics workflow, from raw data cleaning and exploratory analysis to SQL-based business analysis and interactive Power BI reporting.

The analysis highlights how borrower characteristics, loan attributes and financial burden can be examined together to understand credit risk patterns.

Author

Urvashi Ramnani

Aspiring Data Analyst

Skills: Python | SQL | Excel | Power BI | Data Analytics


Interactive Dashboard
     ↓
Risk Insights & Recommendations
