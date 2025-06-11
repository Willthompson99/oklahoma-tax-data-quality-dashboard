-- 1. Returns with negative refund amounts
SELECT * FROM tax_returns
WHERE Refund_Amount < 0;

-- 2. Returns where Payment_Date is before Filing_Date
SELECT * FROM tax_returns
WHERE Payment_Date < Filing_Date;

-- 3. Returns with missing Paid_Amount or Return_Amount
SELECT * FROM tax_returns
WHERE Paid_Amount IS NULL OR Return_Amount IS NULL;

-- 4. Basic summary stats
SELECT 
    MIN(Return_Amount) AS Min_Return,
    MAX(Return_Amount) AS Max_Return,
    AVG(Return_Amount) AS Avg_Return,
    COUNT(*) AS Total_Records
FROM tax_returns;

-- 5. Returns with excessive deductions (e.g., over 50% of paid amount)
SELECT * FROM tax_returns
WHERE Deductions_Claimed > (Paid_Amount * 0.5);
