-- =============================================
-- SecurePay Credit Card Fraud Analytics
-- File: 01_Create_Schema.sql
-- Description: Creates the database table for storing
--              engineered credit card transaction data.
-- =============================================

CREATE TABLE credit_card_transactions(
    transaction_id SERIAL PRIMARY KEY,
    time INTEGER,
    v1 DOUBLE PRECISION,
    v2 DOUBLE PRECISION,
    v3 DOUBLE PRECISION,
    v4 DOUBLE PRECISION,
    v5 DOUBLE PRECISION,
    v6 DOUBLE PRECISION,
    v7 DOUBLE PRECISION,
    v8 DOUBLE PRECISION,
    v9 DOUBLE PRECISION,
    v10 DOUBLE PRECISION,
    v11 DOUBLE PRECISION,
    v12 DOUBLE PRECISION,
    v13 DOUBLE PRECISION,
    v14 DOUBLE PRECISION,
    v15 DOUBLE PRECISION,
    v16 DOUBLE PRECISION,
    v17 DOUBLE PRECISION,
    v18 DOUBLE PRECISION,
    v19 DOUBLE PRECISION,
    v20 DOUBLE PRECISION,
    v21 DOUBLE PRECISION,
    v22 DOUBLE PRECISION,
    v23 DOUBLE PRECISION,
    v24 DOUBLE PRECISION,
    v25 DOUBLE PRECISION,
    v26 DOUBLE PRECISION,
    v27 DOUBLE PRECISION,
    v28 DOUBLE PRECISION,
    amount DOUBLE PRECISION CHECK(amount >= 0),
    amount_category VARCHAR(20),
    log_amount DOUBLE PRECISION,
    class SMALLINT CHECK (class IN (0,1))
);