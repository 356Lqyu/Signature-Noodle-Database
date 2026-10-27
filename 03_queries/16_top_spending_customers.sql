-- Top Spending Customers
-- Original Oracle SQL*Plus query/report.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
SET LINESIZE 120
SET PAGESIZE 300
PROMPT .                                   TOP SPENDING CUSTOMER
PROMPT .                              -----------------------------
ACCEPT top_n_customers PROMPT 'Enter the number of top customers to display: '
TTITLE LEFT '                                  Top &top_n_customers Spending Customers' SKIP 2
COLUMN customer_id HEADING 'Customer ID' FORMAT A15
COLUMN customer_name HEADING 'Customer Name' FORMAT A30
COLUMN customer_gender HEADING 'Gender' FORMAT A10
COLUMN customer_age HEADING 'Age' FORMAT 99999
COLUMN total_orders HEADING 'Total Orders' FORMAT 99999
COLUMN total_spend HEADING 'Total Spend (RM)' FORMAT 999,999,999.99
SELECT * FROM (
SELECT
c.cust_no AS customer_id,
c.name AS customer_name,
c.gender AS customer_gender,
TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date) / 12) AS customer_age,
COUNT(fo.order_no) AS total_orders,
SUM(fo.total_price) AS total_spend
FROM
Food_Order fo
JOIN
Customer c ON fo.cust_no = c.cust_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
cn.order_no IS NULL
GROUP BY
c.cust_no, c.name, c.gender, c.birth_date
ORDER BY
total_spend DESC
) WHERE ROWNUM <= &top_n_customers;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
