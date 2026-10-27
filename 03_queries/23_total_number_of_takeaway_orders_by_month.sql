-- Total Number of Takeaway Orders by Month
-- Original Oracle SQL*Plus query/report.
SET LINESIZE 120
SET PAGESIZE 300
COLUMN year FORMAT A10 HEADING 'Year'
COLUMN month FORMAT A10 HEADING 'Month'
COLUMN total_takeaway_orders HEADING 'Total Orders' FORMAT 9999999
COLUMN total_cancellation HEADING 'Total Cancellation' FORMAT 9999999
COLUMN total_takeaway_revenue HEADING 'Total Revenue (RM)' FORMAT 999,999,999.99
TTITLE LEFT '                    Total Monthly Takeaway Orders' SKIP 2
SELECT TO_CHAR(fo.order_date, 'YYYY') AS year,
TO_CHAR(fo.order_date, 'MM') AS month,
COUNT(*) AS total_takeaway_orders,
SUM(CASE WHEN ca.order_no IS NOT NULL THEN 1 ELSE 0 END) AS total_cancellation,
SUM(CASE WHEN ca.order_no IS NULL THEN fo.total_price ELSE 0 END) AS total_takeaway_revenue
FROM Food_Order fo
LEFT JOIN Cancellation ca ON fo.order_no = ca.order_no
WHERE fo.service_option = 'TA'
GROUP BY TO_CHAR(fo.order_date, 'YYYY'), TO_CHAR(fo.order_date, 'MM')
ORDER BY TO_CHAR(fo.order_date, 'YYYY'), TO_CHAR(fo.order_date, 'MM');
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
