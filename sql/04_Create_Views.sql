-- =====================================================
-- SecurePay Credit Card Fraud Analytics
-- File: 04_Create_Views.sql
-- Description: Creates reusable SQL views for business
-- reporting and Power BI dashboard integration.
-- =====================================================


-- =====================================================
-- Executive Summary View
-- Description: Creates a reusable SQL view containing
-- key fraud analytics KPIs for reporting and Power BI
-- dashboard integration.
-- =====================================================

CREATE VIEW vw_executive_summary AS

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


-- =====================================================
-- Amount Category Summary View
-- Description: Creates a reusable SQL view summarizing
-- transaction volume, fraud counts, and fraud rates
-- across transaction amount categories.
-- =====================================================

CREATE VIEW vw_amount_category_summary AS

WITH amount_summary AS (
SELECT
	amount_category,
	COUNT(*) AS total_transactions,
	SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
	ROUND(AVG(amount)::numeric, 2) AS avg_transaction_amount
FROM credit_card_transactions
GROUP BY amount_category
)

SELECT *,
ROUND((fraud_transactions * 100.0) / total_transactions, 2) AS fraud_percentage
FROM amount_summary
ORDER BY fraud_percentage DESC;


-- =====================================================
-- Fraud Ranking View
-- Description: Creates a reusable SQL view ranking
-- fraudulent transactions by transaction amount for
-- investigative reporting.
-- =====================================================

CREATE VIEW vw_fraud_ranking AS

SELECT
	transaction_id,
	amount,
	amount_category,
	DENSE_RANK() OVER(ORDER BY amount DESC) AS fraud_rank
FROM credit_card_transactions
WHERE class = 1
ORDER BY amount DESC;


-- =====================================================
-- Spending Quartiles View
-- Description: Creates a reusable SQL view summarizing
-- fraud distribution across transaction amount
-- quartiles.
-- =====================================================

CREATE VIEW vw_spending_quartiles AS

WITH quartiles AS (
    SELECT
        amount,
        class,
        NTILE(4) OVER (ORDER BY amount) AS spending_quartile
    FROM credit_card_transactions
),

quartile_summary AS (
    SELECT
        spending_quartile,
        COUNT(*) AS total_transactions,
        SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_transactions
    FROM quartiles
    GROUP BY spending_quartile
)

SELECT
    spending_quartile,
    total_transactions,
    fraud_transactions,
    ROUND((fraud_transactions * 100.0) / total_transactions, 2) AS fraud_percentage
FROM quartile_summary
ORDER BY spending_quartile;


-- =====================================================
-- Verify Created Views
-- Description: Displays the contents of all created
-- reporting views to verify successful creation.
-- =====================================================

SELECT * FROM vw_executive_summary;

SELECT * FROM vw_amount_category_summary;

SELECT * FROM vw_fraud_ranking;

SELECT * FROM vw_spending_quartiles;