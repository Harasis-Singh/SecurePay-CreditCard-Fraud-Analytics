# Project Architecture

## Overview

The SecurePay Credit Card Fraud Analytics project follows an end-to-end analytics workflow that transforms raw transaction data into actionable business insights. The solution combines Python for data preparation, PostgreSQL for data storage and business analysis, and Power BI for interactive visualization and reporting.

---

## System Architecture

```mermaid
flowchart TD

    A[Raw Credit Card Dataset<br/>creditcard.csv]

    B[Python - Jupyter Notebook]

    B1[Data Quality Assessment]
    B2[Business Understanding]
    B3[Data Preprocessing]
    B4[Exploratory Data Analysis]
    B5[Feature Engineering]

    C[Processed Dataset]

    D[PostgreSQL Database]

    D1[Table Creation]
    D2[Data Import]
    D3[SQL Business Queries]
    D4[SQL Reporting Views]

    E[Power BI Dashboard]

    E1[Executive KPI Cards]
    E2[Interactive Charts]
    E3[Business Insights]
    E4[Slicers & Filters]

    F[Project Documentation]

    F1[Business Insights Report]
    F2[Executive Report]
    F3[README]
    F4[Methodology]

    A --> B

    B --> B1
    B --> B2
    B --> B3
    B --> B4
    B --> B5

    B --> C

    C --> D

    D --> D1
    D --> D2
    D --> D3
    D --> D4

    D4 --> E

    E --> E1
    E --> E2
    E --> E3
    E --> E4

    E --> F

    F --> F1
    F --> F2
    F --> F3
    F --> F4
```

---

## Technology Stack

| Layer | Technology |
|--------|------------|
| Programming Language | Python |
| Data Analysis | Pandas, NumPy |
| Data Visualization | Matplotlib, Seaborn |
| Development Environment | Jupyter Notebook |
| Database | PostgreSQL |
| Query Language | SQL |
| Business Intelligence | Power BI |
| Version Control | Git & GitHub |

---

## Workflow Components

### 1. Data Preparation

The raw credit card transaction dataset was examined for data quality issues before being cleaned and transformed into a structured analytical dataset.

---

### 2. Feature Engineering

New analytical features—including **Amount Category**, **Spending Quartile**, and **Log Amount**—were created to improve business reporting and fraud analysis.

---

### 3. Database Layer

The processed dataset was imported into PostgreSQL, where SQL queries and reporting views were developed to generate business insights efficiently.

---

### 4. Visualization Layer

Power BI connects directly to SQL reporting views to present fraud KPIs, transaction distributions, and interactive business dashboards.

---

### 5. Reporting Layer

The analytical findings are communicated through business reports, executive summaries, and technical documentation, making the project accessible to both technical and non-technical stakeholders.

---

## Project Deliverables

The project produces the following deliverables:

- Cleaned and processed analytical dataset
- PostgreSQL database and reporting views
- SQL-based business analysis
- Interactive Power BI dashboard
- Business Insights report
- Executive Report
- Technical documentation
- GitHub portfolio repository