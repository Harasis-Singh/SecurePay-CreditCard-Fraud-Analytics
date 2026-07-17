# Methodology

## Overview

This project follows a structured data analytics workflow to analyze credit card transactions and identify meaningful fraud patterns. The process begins with understanding the business problem, followed by data preparation, exploratory analysis, feature engineering, SQL-based business analysis, and interactive dashboard development.

---

## 1. Business Understanding

The primary objective of this project is to analyze historical credit card transactions to identify fraud patterns and generate actionable business insights.

Key goals include:

- Understanding the distribution of fraudulent transactions.
- Measuring fraud prevalence using key performance indicators (KPIs).
- Identifying high-risk transaction categories.
- Supporting fraud monitoring through an interactive dashboard.

---

## 2. Dataset Understanding

The dataset contains anonymized European credit card transactions, including both legitimate and fraudulent activities.

Key characteristics:

- Total Transactions: **283,726**
- Fraudulent Transactions: **473**
- Legitimate Transactions: **283,253**

The dataset is highly imbalanced, with fraudulent transactions representing only **0.17%** of all observations.

---

## 3. Data Quality Assessment

A comprehensive data quality assessment was performed before analysis.

The following checks were conducted:

- Missing value detection
- Duplicate record identification
- Data type validation
- Statistical summary of numerical columns
- Distribution analysis of transaction amounts
- Class imbalance assessment

These checks ensured that the dataset was suitable for downstream analysis.

---

## 4. Data Preprocessing

The dataset was prepared for analysis through several preprocessing steps.

Activities included:

- Renaming columns for improved readability
- Creating business-friendly column names
- Applying logarithmic transformation to transaction amounts
- Preparing a cleaned dataset for SQL and Power BI

The preprocessing stage improved data consistency while preserving the integrity of the original dataset.

---

## 5. Exploratory Data Analysis (EDA)

Exploratory Data Analysis was conducted to better understand transaction behaviour and fraud distribution.

The analysis included:

- Class distribution visualization
- Transaction amount analysis
- Statistical summaries
- Fraud percentage calculations
- Distribution plots
- Business-oriented visualizations

EDA helped uncover important trends that guided the subsequent SQL analysis.

---

## 6. Feature Engineering

Additional analytical features were created to support business reporting.

Engineered features include:

- Amount Category
- Spending Quartile
- Log Amount

These derived attributes enabled deeper segmentation and simplified business reporting.

---

## 7. PostgreSQL Database Design

The processed dataset was imported into PostgreSQL for structured querying.

The database implementation included:

- Database creation
- Table schema design
- CSV data import
- Data validation
- SQL views for reporting

This provided a scalable foundation for business analysis.

---

## 8. SQL Business Analysis

SQL queries were developed to answer key business questions related to fraud detection.

The analysis covered:

- Transaction distribution
- Fraud rate calculation
- Average transaction values
- Amount category analysis
- Spending quartile analysis
- High-value fraud detection
- Fraud ranking using window functions
- Executive KPI generation

Reporting views were also created to simplify dashboard development.

---

## 9. Power BI Dashboard Development

An interactive Power BI dashboard was developed using SQL reporting views.

The dashboard includes:

- Executive KPI cards
- Fraud distribution visualizations
- Amount category analysis
- Spending quartile insights
- Fraud transaction table
- Interactive filtering
- Business insight panel

The dashboard enables users to monitor fraud activity through an intuitive visual interface.

---

## 10. Project Outcomes

The project successfully demonstrates an end-to-end data analytics workflow using Python, PostgreSQL, and Power BI.

Key outcomes include:

- Clean and well-structured analytical dataset
- SQL-driven business insights
- Interactive executive dashboard
- Professional project documentation
- Reproducible analytics workflow suitable for portfolio presentation

The resulting solution provides valuable insights into transaction behaviour and supports data-driven fraud monitoring and business decision-making.