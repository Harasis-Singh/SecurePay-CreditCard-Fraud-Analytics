-- =====================================================
-- SecurePay Credit Card Fraud Analytics
-- File: 03_Business_Queries.sql
-- Description: Business queries for fraud analytics and
-- reporting using PostgreSQL.
-- =====================================================


-- #####################################################
-- SECTION 1 : Dataset Overview
-- #####################################################

-- =====================================================
-- Business Question 1
-- What is the total number of transactions after preprocessing?
--
-- Expected Insight:
-- Returns the total number of unique transactions available
-- for business analysis.
-- =====================================================

SELECT COUNT(*) AS total_transactions
FROM credit_card_transactions;


-- =====================================================
-- Business Question 2
-- How many legitimate and fraudulent transactions are
-- present in the dataset?
--
-- Expected Insight:
-- Returns the total number of transactions for each class,
-- helping measure the class imbalance in the dataset.
-- =====================================================

SELECT
CASE
	WHEN class = 0 THEN 'Legitimate'
    WHEN class = 1 THEN 'Fraud'
END AS transaction_type,
COUNT(*) AS total_transactions
FROM credit_card_transactions
GROUP BY class
ORDER BY class;


-- =====================================================
-- Business Question 3
-- What percentage of all transactions are fraudulent?
--
-- Expected Insight:
-- Calculates the percentage of fraudulent transactions,
-- highlighting the degree of class imbalance in the dataset.
-- =====================================================

WITH fraud_summary AS (
	SELECT
		SUM(
			CASE WHEN class = 1 THEN 1
			ELSE 0
			END
		) AS fraud_count,
		COUNT(*) AS total_transactions

		FROM credit_card_transactions		
)

SELECT fraud_count, total_transactions,
ROUND((fraud_count * 100.0) / total_transactions, 2) AS fraud_percentage
FROM fraud_summary;


-- =====================================================
-- Business Question 4
-- What is the average transaction amount for all transactions?
--
-- Expected Insight:
-- Returns the average transaction amount, providing
-- a baseline for comparing fraud and legitimate transactions.
-- =====================================================

SELECT ROUND(CAST(AVG(amount) AS numeric), 2) AS avg_transaction_amount
FROM credit_card_transactions;


-- #####################################################
-- SECTION 2 : Transaction Amount Analysis
-- #####################################################

-- =====================================================
-- Business Question 5
-- How are transactions distributed across different
-- transaction amount categories?
--
-- Expected Insight:
-- Returns the number of transactions in each transaction
-- amount category, helping identify the most common
-- transaction sizes.
-- =====================================================

SELECT amount_category, COUNT(*) AS transaction_count
FROM credit_card_transactions
GROUP BY amount_category
ORDER BY transaction_count DESC;


-- =====================================================
-- Business Question 6
-- How are fraudulent transactions distributed across
-- different transaction amount categories?
--
-- Expected Insight:
-- Identifies the transaction amount categories that are
-- most frequently associated with fraudulent activity.
-- =====================================================

SELECT amount_category, COUNT(*) AS fraud_transactions
FROM credit_card_transactions
WHERE class = 1
GROUP BY amount_category
ORDER BY fraud_transactions DESC;


-- =====================================================
-- Business Question 7
-- What is the average transaction amount for legitimate
-- and fraudulent transactions?
--
-- Expected Insight:
-- Compares the average transaction amount between
-- legitimate and fraudulent transactions to identify
-- spending pattern differences.
-- =====================================================

SELECT 
CASE
	WHEN class = 0 THEN 'Legitimate'
	WHEN class = 1 THEN 'Fraud'
END AS transaction_type,
ROUND(AVG(amount)::numeric, 2) AS avg_transaction_amount
FROM credit_card_transactions
GROUP BY transaction_type;


-- =====================================================
-- Business Question 8
-- What are the Top 10 highest-value fraudulent transactions?
--
-- Expected Insight:
-- Identifies the largest fraudulent transactions, helping
-- investigators prioritize high-value fraud cases.
-- =====================================================

SELECT transaction_id, amount, amount_category, time
FROM credit_card_transactions
WHERE class = 1
ORDER BY amount DESC
LIMIT 10;


-- #####################################################
-- SECTION 3 : Advanced Fraud Analytics
-- #####################################################

-- =====================================================
-- Business Question 9
-- Which transaction amount category has the highest
-- fraud rate?
--
-- Expected Insight:
-- Calculates the percentage of fraudulent transactions
-- within each transaction amount category to identify
-- which category is relatively more risky.
-- =====================================================

WITH fraud_summary AS (
	SELECT
		amount_category,
	
		SUM(
			CASE WHEN class = 1 THEN 1
			ELSE 0
			END
		) AS fraud_count,
		COUNT(*) AS total_transactions

		FROM credit_card_transactions
		GROUP BY amount_category
)

SELECT amount_category, fraud_count, total_transactions,
ROUND((fraud_count * 100.0) / total_transactions, 2) AS fraud_percentage
FROM fraud_summary
ORDER BY fraud_percentage DESC;


-- =====================================================
-- Business Question 10
-- Rank fraudulent transactions based on transaction
-- amount to identify the highest-value fraud cases.
--
-- Expected Insight:
-- Assigns a rank to each fraudulent transaction based
-- on transaction amount, helping prioritize
-- high-value fraud investigations.
-- =====================================================

SELECT transaction_id, amount, amount_category,
	   DENSE_RANK() OVER(ORDER BY amount DESC) AS fraud_rank
FROM credit_card_transactions
WHERE class = 1;


-- =====================================================
-- Business Question 11
-- How many transactions have a transaction amount of zero,
-- and what proportion of them are fraudulent?
--
-- Expected Insight:
-- Evaluates whether zero-value transactions exhibit
-- unusual fraud characteristics.
-- =====================================================

WITH amount_0 AS (
	SELECT
	    SUM(
	        CASE
	            WHEN class = 1 THEN 1
	            ELSE 0
	        END
	    ) AS fraud_transactions,
	
	    COUNT(*) AS total_transactions
	
	FROM credit_card_transactions
	
	WHERE amount = 0
)

SELECT fraud_transactions, total_transactions,
	   ROUND((fraud_transactions * 100.0) / total_transactions, 2) AS fraud_percentage
FROM amount_0;


-- =====================================================
-- Business Question 12
-- How are fraudulent transactions distributed across
-- transaction amount quartiles?
--
-- Expected Insight:
-- Groups transactions into four equally sized spending
-- quartiles and compares the number of fraudulent
-- transactions in each quartile.
-- =====================================================

WITH quartiles AS (
    SELECT
        amount,
        class,
        NTILE(4) OVER (ORDER BY amount) AS spending_quartile
    FROM credit_card_transactions
)

SELECT
    spending_quartile,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
FROM quartiles
GROUP BY spending_quartile
ORDER BY spending_quartile;


-- =====================================================
-- Business Question 13
-- Identify fraudulent transactions whose transaction
-- amount is higher than the average fraudulent
-- transaction amount.
--
-- Expected Insight:
-- Identifies unusually large fraudulent transactions
-- relative to the average fraud amount, helping
-- prioritize high-value investigations.
-- =====================================================

WITH avg_fraud AS (
	SELECT ROUND(AVG(amount)::numeric, 2) AS avg_fraud_amount
	FROM credit_card_transactions
	WHERE class = 1
)

SELECT
	transaction_id,
	amount AS fraud_amount,
	amount_category,
	avg_fraud_amount
FROM credit_card_transactions
CROSS JOIN avg_fraud
WHERE class = 1 AND amount > avg_fraud_amount
ORDER BY amount DESC;


-- =====================================================
-- Business Question 14
-- Assign a unique rank to fraudulent transactions
-- based on transaction amount.
--
-- Expected Insight:
-- Generates a unique ranking for each fraudulent
-- transaction, even when multiple transactions have
-- identical amounts.
-- =====================================================

SELECT
	transaction_id,
	amount,
	amount_category,
	ROW_NUMBER() OVER(ORDER BY amount DESC) AS transaction_rank
FROM credit_card_transactions
WHERE class = 1;


-- =====================================================
-- Business Question 15
-- Create an executive summary of key fraud analytics
-- metrics for dashboard reporting.
--
-- Expected Insight:
-- Returns a consolidated summary of the most important
-- fraud analytics KPIs for executive reporting.
-- =====================================================

WITH overall_summary AS (
	SELECT
		COUNT(*) AS total_transactions,
		SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
		ROUND(AVG(amount)::numeric, 2) AS avg_transaction_amount
	FROM credit_card_transactions
),

fraud_summary AS (
	SELECT ROUND(AVG(amount)::numeric, 2) AS avg_fraud_amount
	FROM credit_card_transactions
	WHERE class = 1
)

SELECT 
	total_transactions,
	fraud_transactions,
	ROUND((fraud_transactions * 100.0) / total_transactions, 2) AS fraud_percentage,
	avg_transaction_amount,
	avg_fraud_amount
FROM overall_summary
CROSS JOIN fraud_summary;	