-- The Total Number of Orders and Revenue by Staff
-- Original Oracle SQL*Plus query/report.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
SET LINESIZE 120
SET PAGESIZE 300
PROMPT .                   TOTAL NO OF ORDER AND REVENUE OF STAFF
PROMPT .                  ------------------------------------------
ACCEPT input_year CHAR FORMAT '9999' PROMPT 'Enter the year: '
COLUMN staff_id HEADING 'Staff ID' FORMAT A20
COLUMN staff_name HEADING 'Staff Name' FORMAT A30
COLUMN total_orders HEADING 'Total Order' FORMAT 9999
COLUMN total_price HEADING 'Total Revenue (RM)' FORMAT 999,999,999.99
TTITLE LEFT '             Total Number of Order and Revenue by Staff in &input_year' SKIP 2
SELECT
s.staff_id AS staff_id,
s.name AS staff_name,
COUNT(fo.order_no) AS total_orders,
NVL(SUM(fo.total_price), 0) AS total_price
FROM
Staff s
LEFT JOIN
Food_Order fo ON s.staff_id = fo.staff_id
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
EXTRACT(YEAR FROM fo.order_date) = '&input_year'
AND cn.order_no IS NULL
GROUP BY
s.staff_id, s.name
ORDER BY
s.staff_id;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
