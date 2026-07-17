# Business Insights

## Project Objective

The objective of this analysis is to identify meaningful fraud patterns in credit card transactions using SQL-based business analysis. The insights generated from these queries support fraud detection, transaction monitoring, and risk assessment.

---

## Insight 1: Overall Transaction Distribution

**Business Question**

How many legitimate and fraudulent transactions are present in the dataset?

**Findings**

- Total Legitimate Transactions: **283,253**
- Total Fraudulent Transactions: **473**

**Business Insight**

The dataset is highly imbalanced, with fraudulent transactions representing only a very small fraction of all transactions. This highlights the importance of fraud detection systems that can accurately identify rare fraudulent events without generating excessive false positives.

> **Key Takeaway:** Fraudulent transactions represent only a tiny fraction of all transactions, making fraud detection a highly imbalanced classification problem.

---

## Insight 2: Overall Fraud Rate

**Business Question**

What percentage of all transactions are fraudulent?

**Findings**

- Fraud Rate: **0.17%**

**Business Insight**

Only 0.17% of all transactions are fraudulent, confirming that fraud is a rare event. Traditional accuracy-based models may therefore be misleading, making precision, recall, and fraud-focused metrics more appropriate for evaluation.

> **Key Takeaway:** A fraud rate of just 0.17% highlights the need for specialized fraud detection techniques rather than relying solely on overall accuracy.

---

## Insight 3: Average Transaction Amount

**Business Question**

What is the average transaction amount?

**Findings**

- Average Transaction Amount: **€88.47**

**Business Insight**

The average transaction value provides a useful benchmark for comparing legitimate and fraudulent transaction behaviour.

> **Key Takeaway:** The average transaction amount serves as a baseline for comparing normal customer behaviour against suspicious activity.

---

## Insight 4: Transaction Distribution by Amount Category

**Business Question**

How are transactions distributed across different amount categories?

**Findings**

| Amount Category | Transaction Count |
|-----------------|------------------:|
| Small | 99,821 |
| Medium | 90,327 |
| Very Large | 56,399 |
| Large | 37,179 |

**Business Insight**

Small transactions represent the largest share of all transactions, followed closely by Medium transactions. Very Large transactions occur much less frequently, while Large transactions are the least common. This distribution indicates that most customer activity consists of lower-value transactions, making them an important area for fraud monitoring.

> **Key Takeaway:** Most customer activity consists of low-value transactions, making these categories operationally important despite their smaller transaction amounts.

---

## Insight 5: Most Common Transaction Amount Category

**Business Question**

Which transaction amount category occurs most frequently?

**Findings**

- Most Common Category: **Small**
- Total Transactions: **99,821**

**Business Insight**

Small-value transactions dominate the dataset. Since fraudsters often attempt to avoid detection by performing low-value transactions, monitoring this category is essential despite the relatively small transaction amounts.

> **Key Takeaway:** The dominance of small transactions suggests that continuous monitoring of low-value payments is essential.

---

## Insight 6: Fraud Rate by Amount Category

**Business Question**

Which transaction amount category has the highest fraud rate?

**Findings**

| Amount Category | Fraud Rate |
|-----------------|-----------:|
| Small | 0.24% |
| Very Large | 0.22% |
| Large | 0.15% |
| Medium | 0.06% |

**Business Insight**

Small transactions exhibit the highest fraud rate, closely followed by Very Large transactions. This suggests that fraudulent behaviour is concentrated at both extremes—low-value transactions that may avoid attention and high-value transactions that can yield greater financial gain.

> **Key Takeaway:** Fraud is concentrated at both ends of the transaction spectrum, indicating multiple fraud strategies.

---

## Insight 7: Average Transaction Amount by Transaction Type

**Business Question**

How does the average transaction amount differ between legitimate and fraudulent transactions?

**Findings**

- Legitimate Transactions: **€88.41**
- Fraudulent Transactions: **€123.87**

**Business Insight**

Fraudulent transactions have a noticeably higher average amount than legitimate transactions. Although fraud is rare, fraudulent activity tends to involve larger transaction values, increasing the potential financial impact of each incident.

> **Key Takeaway:** Fraudulent transactions tend to involve higher monetary values than legitimate transactions, increasing their financial impact.

---

## Insight 8: Highest-Value Fraudulent Transactions

**Business Question**

What are the highest-value fraudulent transactions?

**Findings**

The highest fraudulent transaction recorded in the dataset is **€2,125.87**. Several other fraudulent transactions also exceed **€1,000**, indicating that fraud can involve substantial financial values.

**Business Insight**

Although fraudulent transactions are relatively rare, individual fraud incidents can involve significant monetary amounts. Monitoring unusually high-value transactions can therefore help reduce potential financial losses.

> **Key Takeaway:** High-value fraudulent transactions can result in significant financial losses and should receive immediate investigative priority.

---

## Insight 9: Fraud Distribution Across Spending Quartiles

**Business Question**

How are fraudulent transactions distributed across spending quartiles?

**Findings**

| Spending Quartile | Fraud Transactions | Fraud Rate |
|-------------------|------------------:|-----------:|
| 1 | 213 | 0.30% |
| 2 | 47 | 0.07% |
| 3 | 45 | 0.06% |
| 4 | 168 | 0.24% |

**Business Insight**

Fraud is concentrated in the lowest and highest spending quartiles. This suggests two distinct fraud patterns: low-value transactions that may attempt to avoid detection and high-value transactions that maximize financial gain.

> **Key Takeaway:** Spending Quartiles 1 and 4 require closer monitoring due to their elevated fraud rates.

---

## Insight 10: Fraudulent Transaction Ranking

**Business Question**

How can fraudulent transactions be prioritized for investigation?

**Findings**

Fraudulent transactions were ranked using the `DENSE_RANK()` window function based on transaction amount in descending order.

**Business Insight**

Ranking fraudulent transactions enables investigators to prioritize the highest-value fraud cases, allowing resources to focus on incidents with the greatest potential financial impact.

> **Key Takeaway:** Ranking fraudulent transactions enables investigators to prioritize cases based on potential financial risk.

---

## Insight 11: Executive Summary Metrics

**Business Question**

What are the key performance indicators for overall fraud monitoring?

**Findings**

| Metric | Value |
|--------|------:|
| Total Transactions | 283,726 |
| Fraudulent Transactions | 473 |
| Fraud Rate | 0.17% |
| Average Transaction Amount | €88.47 |
| Average Fraud Amount | €123.87 |

**Business Insight**

These KPIs provide a concise overview of transaction activity and fraud prevalence. Together, they form the foundation of the executive dashboard, enabling stakeholders to quickly assess transaction volume, fraud occurrence, and financial impact.

> **Key Takeaway:** Executive KPIs provide a concise overview of transaction volume, fraud prevalence, and overall financial exposure.

---