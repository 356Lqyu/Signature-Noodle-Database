-- Customer Loyalty Analysis
-- Original Oracle SQL*Plus query/report.
SET LINESIZE 120
SET PAGESIZE 300
PROMPT .                           CUSTOMER LOYALTY ANALYSIS
PROMPT .                         -----------------------------
ACCEPT visit_year CHAR FORMAT '9999' PROMPT 'Enter the year: '
TTITLE CENTER 'Customer Loyalty Analysis &visit_year' SKIP 2
COLUMN total_visits HEADING 'Total Visits' FORMAT 9999
COLUMN customer_id HEADING 'Customer ID' FORMAT A20
COLUMN customer_name HEADING 'Customer Name' FORMAT A30
COLUMN customer_gender HEADING 'Gender' FORMAT A15
SELECT
c.cust_no AS customer_id,
c.name AS customer_name,
c.gender AS customer_gender,
COUNT(CASE WHEN cn.order_no IS NULL THEN fo.cust_no END) AS total_visits
FROM
Food_Order fo
JOIN
Customer c ON fo.cust_no = c.cust_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') = '&visit_year'
GROUP BY
c.cust_no , c.name , c.gender
ORDER BY
total_visits DESC;
