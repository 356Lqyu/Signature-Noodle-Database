-- Total amount of customer cancelled orders
-- Original Oracle SQL*Plus query/report.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
PROMPT
PROMPT .                                       TOTAL NUMBER OF CUSTOMER ORDER CANCELLATION
PROMPT .                                      -----------------------------------------------
SET LINESIZE 120
SET PAGESIZE 300
ACCEPT input_year CHAR FORMAT '9999' PROMPT 'Enter the year: '
TTITLE CENTER 'Total Number of Customer Order Cancellation in &input_year' SKIP 2
COLUMN cust_no FORMAT A35 HEADING 'Customer ID'
COLUMN name FORMAT A40 HEADING 'Customer Name'
COLUMN total_cancelled_orders FORMAT 9999999 HEADING 'Total Cancelled Orders'
COLUMN refund_amount FORMAT 999,999,999.99 HEADING 'Total Refund Amount'
SELECT
c.cust_no,
c.name,
COUNT(cn.cancel_id) AS total_cancelled_orders,
NVL(SUM(r.refund_amount), 0) AS refund_amount
FROM
Customer c
LEFT JOIN
Food_Order fo ON c.cust_no = fo.cust_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
LEFT JOIN
Refund r ON cn.cancel_id = r.cancel_id
WHERE
TO_CHAR(cn.cancel_date, 'YYYY') = '&input_year'
GROUP BY
c.cust_no, c.name
ORDER BY
c.cust_no;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
