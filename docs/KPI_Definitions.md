# KPI Definitions

## Overview

Key Performance Indicators (KPIs) provide a concise summary of fraud activity and transaction behaviour. These metrics are used throughout the SQL analysis, Power BI dashboard, and executive reporting to support fraud monitoring and business decision-making.

---

## 1. Total Transactions

**Definition**

The total number of credit card transactions available in the dataset.

**Calculation**

```
COUNT(*)
```

**Business Value**

Represents the overall transaction volume and provides the baseline for calculating other fraud-related metrics.

---

## 2. Fraud Transactions

**Definition**

The total number of transactions classified as fraudulent.

**Calculation**

```
COUNT(*) WHERE Class = 1
```

**Business Value**

Measures the volume of fraudulent activity and supports fraud trend analysis.

---

## 3. Fraud Rate (%)

**Definition**

The percentage of all transactions that are classified as fraudulent.

**Calculation**

```
(Fraud Transactions / Total Transactions) × 100
```

**Business Value**

Measures the prevalence of fraud within the dataset and serves as one of the most important fraud monitoring KPIs.

---

## 4. Average Transaction Amount

**Definition**

The average monetary value of all credit card transactions.

**Calculation**

```
AVG(Amount)
```

**Business Value**

Provides a benchmark for normal transaction behaviour and supports comparisons with fraudulent transactions.

---

## 5. Average Fraud Amount

**Definition**

The average monetary value of fraudulent transactions only.

**Calculation**

```
AVG(Amount) WHERE Class = 1
```

**Business Value**

Measures the average financial impact of fraudulent transactions and helps estimate potential losses.

---

## 6. Fraud Rate by Amount Category

**Definition**

The percentage of fraudulent transactions within each transaction amount category.

**Calculation**

```
(Fraud Transactions in Category / Total Transactions in Category) × 100
```

**Business Value**

Identifies which transaction sizes present the highest fraud risk and supports targeted fraud monitoring.

---

## 7. Spending Quartile

**Definition**

A segmentation of transactions into four equally sized groups based on transaction amount.

**Calculation**

```
NTILE(4) OVER (ORDER BY Amount)
```

**Business Value**

Enables comparison of fraud behaviour across different spending levels and helps identify high-risk customer segments.

---

## 8. Fraud Rank

**Definition**

A ranking assigned to fraudulent transactions based on transaction amount in descending order.

**Calculation**

```
DENSE_RANK() OVER (ORDER BY Amount DESC)
```

**Business Value**

Helps investigators prioritize high-value fraud cases for review and resource allocation.

---

## Summary

These KPIs provide the analytical foundation for the SecurePay Fraud Analytics Dashboard. Together, they enable stakeholders to monitor transaction activity, assess fraud prevalence, identify high-risk segments, and support data-driven fraud management.