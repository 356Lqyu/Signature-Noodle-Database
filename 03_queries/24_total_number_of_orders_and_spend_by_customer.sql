-- Total Number of Orders and Spend by Customer
-- Original Oracle SQL*Plus query/report.
SET LINESIZE 120
SET PAGESIZE 300
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
COLUMN cust_no HEADING 'Customer ID' FORMAT A20
COLUMN name HEADING 'Customer Name' FORMAT A35
COLUMN total_orders HEADING 'Total Orders' FORMAT 999999
COLUMN total_spend HEADING 'Total Spend (RM)' FORMAT 9999,999.99
ACCEPT entered_year PROMPT 'Enter the year: ' FORMAT 9999
TTITLE LEFT '                      Total Customer Orders and Spending for &entered_year' SKIP 2
SELECT fo.cust_no,
c.name,
COUNT(*) AS total_orders,
SUM(fo.total_price) AS total_spend
FROM Food_order fo
JOIN Customer c ON fo.cust_no = c.cust_no
WHERE EXTRACT(YEAR FROM fo.order_date) = '&entered_year'
AND order_no NOT IN (SELECT order_no FROM Cancellation)
GROUP BY fo.cust_no, c.name
ORDER BY fo.cust_no;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
