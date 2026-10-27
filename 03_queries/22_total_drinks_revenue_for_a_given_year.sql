-- Total Drinks Revenue For A Given Year
-- Original Oracle SQL*Plus query/report.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
SET LINESIZE 120
SET PAGESIZE 300
ACCEPT start_year PROMPT 'Enter Start Year: ' FORMAT 9999
ACCEPT end_year PROMPT 'Enter End Year  : ' FORMAT 9999
COLUMN order_year HEADING 'Year' FORMAT 99999999
COLUMN total_drinks HEADING 'Total Drinks Ordered' FORMAT 999999
COLUMN total_revenue HEADING 'Total Revenue (RM)' FORMAT 999,999,999.99
TTITLE LEFT '       Total Drinks Revenue From &start_year to &end_year' SKIP 2
SELECT EXTRACT(YEAR FROM fo.order_date) AS order_year,
SUM(CASE WHEN ca.order_no IS NULL THEN ol.quantity ELSE 0 END) AS total_drinks,
SUM(CASE WHEN ca.order_no IS NULL THEN ol.price ELSE 0 END) AS total_revenue
FROM Order_List ol
JOIN Food_Order fo ON ol.order_no = fo.order_no
JOIN Drinks_Menu dm ON ol.drinks_id = dm.drinks_id
LEFT JOIN Cancellation ca ON fo.order_no = ca.order_no
WHERE ol.drinks_id IS NOT NULL
AND EXTRACT(YEAR FROM fo.order_date) BETWEEN '&start_year' AND '&end_year'
GROUP BY EXTRACT(YEAR FROM fo.order_date)
ORDER BY order_year;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
