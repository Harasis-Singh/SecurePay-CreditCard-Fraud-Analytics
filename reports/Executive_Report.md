# Executive Report

## Executive Summary

This project analyzes European credit card transaction data to identify fraud patterns using Python, PostgreSQL, and Power BI. Through data preprocessing, SQL-based business analysis, and interactive dashboard development, the project uncovers key fraud trends and provides actionable insights for transaction monitoring and risk assessment.

---

## Project Objective

The primary objective of this project was to analyze historical credit card transactions to:

- Understand the overall distribution of fraudulent transactions.
- Identify fraud patterns across different transaction sizes.
- Measure fraud prevalence using key performance indicators (KPIs).
- Develop an executive dashboard to support fraud monitoring and business decision-making.

---

## Dataset Overview

| Metric | Value |
|--------|------:|
| Total Transactions | 283,726 |
| Fraudulent Transactions | 473 |
| Fraud Rate | 0.17% |
| Average Transaction Amount | €88.47 |
| Average Fraud Amount | €123.87 |

The dataset is highly imbalanced, with fraudulent transactions representing only a very small proportion of total transactions.

---

## Key Findings

### 1. Fraud is Extremely Rare

Fraudulent transactions account for only **0.17%** of all transactions, making fraud detection a highly imbalanced analytical problem.

---

### 2. Small Transactions Show the Highest Fraud Rate

Small-value transactions recorded the highest fraud rate (**0.24%**), indicating that fraudsters frequently exploit lower-value payments that may attract less scrutiny.

---

### 3. Fraud Also Occurs in High-Value Transactions

Although less frequent, very large transactions demonstrate a relatively high fraud rate (**0.22%**) and contribute substantially to potential financial losses.

---

### 4. Fraudulent Transactions Have Higher Average Values

The average fraudulent transaction (**€123.87**) exceeds the average legitimate transaction (**€88.41**), indicating greater financial exposure per fraud incident.

---

### 5. Spending Quartiles Reveal Distinct Fraud Patterns

Fraud activity is concentrated within the lowest and highest spending quartiles, suggesting multiple fraud strategies rather than a single behavioural pattern.

---

## Business Recommendations

Based on the analysis, the following recommendations are proposed:

- Increase monitoring of both low-value and high-value transactions.
- Prioritize investigation of high-value fraudulent transactions to reduce financial losses.
- Incorporate transaction amount categories into fraud detection models.
- Use fraud-focused evaluation metrics such as Precision, Recall, and F1-score when developing predictive models.
- Continuously monitor fraud KPIs through interactive business intelligence dashboards.

---

## Conclusion

The analysis demonstrates that meaningful fraud intelligence can be extracted from transactional data using a combination of Python, SQL, and Power BI. Despite the highly imbalanced nature of the dataset, clear fraud patterns were identified across transaction amounts and spending quartiles. The resulting dashboard and business reports provide decision-makers with an accessible overview of fraud activity while supporting future fraud detection initiatives.