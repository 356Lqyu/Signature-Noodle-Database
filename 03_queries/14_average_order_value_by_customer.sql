-- Average Order Value by Customer
-- Original Oracle SQL*Plus query/report.
SET linesize 120
SET pagesize 235
PROMPT .                               AVERAGE CUSTOMER ORDER VALUE
PROMPT .                              -------------------------------
ACCEPT average_order_year CHAR PROMPT 'Enter the year: ' FORMAT 9999
TTITLE CENTER 'Average Customer Order Value in &average_order_year' SKIP 2
COLUMN average_order HEADING 'Average Order Value (RM)' FORMAT 999,999.99
COLUMN cust_no HEADING 'Customer ID' FORMAT A30
COLUMN cust_name HEADING 'Customer Name' FORMAT A35
SELECT
c.cust_no,
c.name,
AVG(fo.total_price) AS average_order
FROM
Food_Order fo
JOIN
Customer c ON fo.cust_no = c.cust_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(order_date, 'YYYY') = '&average_order_year'
AND cn.cancel_id IS NULL
GROUP BY
c.cust_no , c.name
ORDER BY
c.cust_no;
