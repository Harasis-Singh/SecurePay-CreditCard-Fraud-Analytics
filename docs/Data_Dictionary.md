# Data Dictionary

## Overview

This document describes the variables used in the SecurePay Credit Card Fraud Analytics project. The dataset consists of anonymized credit card transactions, along with engineered features created during preprocessing to support business analysis and reporting.

---

## Dataset Variables

| Column | Data Type | Description |
|---------|-----------|-------------|
| `transaction_id` | Integer | Unique identifier assigned to each transaction during preprocessing. |
| `time` | Integer | Time elapsed (in seconds) since the first transaction in the dataset. |
| `V1` – `V28` | Float | Anonymous numerical features generated using Principal Component Analysis (PCA) to protect sensitive customer and transaction information. |
| `amount` | Float | Monetary value of the transaction in Euros (€). |
| `class` | Integer | Target variable indicating transaction type (`0` = Legitimate, `1` = Fraudulent). |
| `amount_category` | Text | Engineered feature categorizing transactions into **Small**, **Medium**, **Large**, and **Very Large** based on transaction amount. |
| `log_amount` | Float | Log-transformed transaction amount created using the `log1p()` transformation to reduce skewness and improve analytical consistency. |

---

## Engineered Features

The following variables were created during the data preprocessing and feature engineering stages of the project:

| Feature | Description |
|---------|-------------|
| `transaction_id` | Sequential identifier added to uniquely reference each transaction. |
| `amount_category` | Categorizes transactions into four spending groups for comparative business analysis and dashboard reporting. |
| `log_amount` | Logarithmic transformation of the transaction amount used to reduce the impact of extreme values. |

---

## Dataset Characteristics

### Available Information

The dataset provides:

- Transaction amount
- Fraud classification
- Transaction timing
- Twenty-eight anonymized behavioral features (`V1`–`V28`)

### Unavailable Information

To preserve customer privacy, the dataset does **not** include:

- Customer ID
- Merchant information
- Geographic location
- Card type
- Merchant category
- Country
- Device information
- Payment method

---

## Notes

- The original dataset is publicly available on Kaggle and has been anonymized using PCA to protect sensitive financial information.
- Only the `Time`, `Amount`, and `Class` variables retain their original meaning.
- The engineered features (`transaction_id`, `amount_category`, and `log_amount`) were created specifically for this project to support SQL analysis, Power BI reporting, and business insights.