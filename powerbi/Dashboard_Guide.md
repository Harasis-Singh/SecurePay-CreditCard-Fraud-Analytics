# Dashboard Guide

![SecurePay Fraud Analytics Dashboard](../images/dashboard_overview.png)

---

## Overview

The SecurePay Fraud Analytics Dashboard provides an executive overview of credit card fraud patterns using interactive visualizations and key performance indicators (KPIs). Built in Power BI using PostgreSQL reporting views, the dashboard enables users to analyze fraud trends, identify high-risk transaction segments, and monitor key fraud metrics.

---

## Dashboard Components

### 1. Executive KPI Cards

The dashboard presents five high-level KPIs that summarize the dataset.

| KPI | Description |
|------|-------------|
| Total Transactions | Total number of transactions in the dataset |
| Fraud Transactions | Total number of fraudulent transactions |
| Fraud Rate (%) | Percentage of fraudulent transactions |
| Average Transaction Amount | Average value of all transactions |
| Average Fraud Amount | Average value of fraudulent transactions |

These KPIs provide an immediate snapshot of overall transaction activity and fraud prevalence.

---

### 2. Fraud Rate by Amount Category

**Visual:** Horizontal Bar Chart

This chart compares the fraud rate across different transaction amount categories.

Displayed Categories:

- Small
- Medium
- Large
- Very Large

**Purpose**

- Compare fraud risk across transaction amount categories.
- Identify which transaction sizes experience the highest fraud rates.
- Support targeted fraud monitoring strategies.

---

### 3. Fraud Distribution by Spending Quartile

**Visual:** Vertical Bar Chart

This chart displays the fraud rate across customer spending quartiles.

**Purpose**

- Compare fraud prevalence across spending levels.
- Identify customer segments with elevated fraud risk.
- Highlight fraud concentration among low and high spending groups.

---

### 4. Filter Category Charts

**Visual:** Slicer

The slicer filters the visuals related to transaction amount categories.

Available Categories:

- Small
- Medium
- Large
- Very Large

**Purpose**

- Focus category-based visuals on a selected transaction segment.
- Simplify comparison between different amount categories.

> **Note:** Due to the dashboard being built from independent SQL reporting views, this slicer filters only the relevant category-based visuals rather than the entire dashboard.

---

### 5. Fraud Transaction Details

**Visual:** Table

The table displays detailed information about fraudulent transactions.

Displayed Fields:

- Fraud Rank
- Transaction ID
- Amount
- Amount Category

**Purpose**

- Review high-value fraud cases.
- Support transaction-level investigation.
- Prioritize fraud analysis using transaction rankings.

---

### 6. Number of Fraud Transactions by Amount Category

**Visual:** Donut Chart

The donut chart illustrates how fraudulent transactions are distributed across transaction amount categories.

Displayed Categories:

- Small
- Very Large
- Large
- Medium

**Purpose**

- Compare the proportion of fraud cases across amount categories.
- Identify which category contributes the largest share of fraudulent transactions.
- Complement the fraud rate analysis with transaction counts.

---

### 7. Key Insights Panel

The dashboard includes a dedicated insights panel summarizing the most important findings from the analysis.

Current insights include:

- Highest fraud rate occurs in the **Small** amount category.
- Fraud activity is concentrated in **Spending Quartiles 1 and 4**.
- Largest fraudulent transaction recorded: **€2,125.87**.
- Overall fraud rate: **0.17%**.

This section enables users to quickly understand the major business findings without interpreting each visualization individually.

---

## Dashboard Navigation

A typical workflow for using the dashboard is:

1. Review the executive KPI cards.
2. Analyze fraud rates by transaction amount category.
3. Examine fraud patterns across spending quartiles.
4. Filter category-specific visuals using the slicer.
5. Investigate individual fraudulent transactions in the details table.
6. Review the Key Insights panel for a summary of major findings.

---

## Intended Users

The dashboard is designed for:

- Fraud Analysts
- Business Analysts
- Risk Management Teams
- Operations Managers
- Data Analytics Professionals

---

## Key Benefits

- Executive-level fraud monitoring
- Interactive category-based analysis
- SQL-driven reporting views
- Business-friendly visualizations
- Simplified fraud investigation
- Data-driven decision support