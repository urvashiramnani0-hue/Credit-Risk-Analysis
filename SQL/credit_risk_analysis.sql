

SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM [dbo].[credit_risk_cleaned]
GROUP BY loan_grade
ORDER BY loan_grade;
-- Q3. Default Rate by Loan Intent

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM [dbo].[credit_risk_cleaned]
GROUP BY loan_intent
ORDER BY default_rate DESC;

/* =========================================================
   Q4. Default Rate by Income Group
   ========================================================= */

SELECT
    income_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk_cleaned
GROUP BY income_group
ORDER BY
    CASE income_group
        WHEN 'Below 30K' THEN 1
        WHEN '30K–50K' THEN 2
        WHEN '50K–75K' THEN 3
        WHEN '75K–100K' THEN 4
        WHEN '100K+' THEN 5
    END;


/* =========================================================
   Q5. Default Rate by Loan Burden Group
   ========================================================= */

SELECT
    loan_burden_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk_cleaned
GROUP BY loan_burden_group
ORDER BY
    CASE loan_burden_group
        WHEN '0–10%' THEN 1
        WHEN '10–20%' THEN 2
        WHEN '20–30%' THEN 3
        WHEN '30–40%' THEN 4
        WHEN '40%+' THEN 5
    END;


/* =========================================================
   Q6. Default Rate by Home Ownership
   ========================================================= */

SELECT
    person_home_ownership,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk_cleaned
GROUP BY person_home_ownership
ORDER BY default_rate DESC;


/* =========================================================
   Q7. Average Income, Loan Amount & Interest Rate by Grade
   ========================================================= */

SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    ROUND(AVG(CAST(person_income AS FLOAT)), 2) AS avg_income,
    ROUND(AVG(CAST(loan_amnt AS FLOAT)), 2) AS avg_loan_amount,
    ROUND(AVG(CAST(loan_int_rate AS FLOAT)), 2) AS avg_interest_rate
FROM credit_risk_cleaned
GROUP BY loan_grade
ORDER BY loan_grade;


/* =========================================================
   Q8. Default Rate by Credit History Length
   ========================================================= */

SELECT
    cb_person_cred_hist_length,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk_cleaned
GROUP BY cb_person_cred_hist_length
HAVING COUNT(*) >= 100
ORDER BY cb_person_cred_hist_length;


/* =========================================================
   Q9. High-Burden Loans by Income Group
   ========================================================= */

SELECT
    income_group,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_burden_group IN ('30–40%', '40%+')
            THEN 1
            ELSE 0
        END
    ) AS high_burden_loans,
    ROUND(
        SUM(
            CASE
                WHEN loan_burden_group IN ('30–40%', '40%+')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS high_burden_percentage
FROM credit_risk_cleaned
GROUP BY income_group
ORDER BY high_burden_percentage DESC;


/* =========================================================
   Q10. Low-Income + High-Burden Segment
   ========================================================= */

SELECT
    income_group,
    loan_burden_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        SUM(CASE WHEN loan_status = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS default_rate
FROM credit_risk_cleaned
WHERE income_group IN ('Below 30K', '30K–50K')
  AND loan_burden_group IN ('30–40%', '40%+')
GROUP BY
    income_group,
    loan_burden_group
ORDER BY default_rate DESC;