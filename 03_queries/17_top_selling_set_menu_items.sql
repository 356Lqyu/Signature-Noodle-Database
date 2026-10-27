-- Top Selling Set Menu Items
-- Original Oracle SQL*Plus query/report.
SET LINESIZE 150
SET PAGESIZE 300
PROMPT
PROMPT .                                                   Top Selling Set Meal Menu
PROMPT .                                                 -----------------------------
ACCEPT s_firstyear CHAR FORMAT '9999' PROMPT 'Enter the start year: '
ACCEPT s_lastyear CHAR FORMAT '9999' PROMPT 'Enter the end year  : '
TTITLE LEFT '                                           Top Selling Set Meal Menu From &s_firstyear to &s_lastyear' SKIP 2
COLUMN menu_id HEADING 'Set Menu ID' FORMAT A30
COLUMN set_meal_description HEADING 'Description' FORMAT A50
COLUMN total_orders HEADING 'Total Orders' FORMAT 99999
COLUMN total_quantity HEADING 'Total Quantity' FORMAT 99999
COLUMN total_revenue HEADING 'Total Revenue (RM)' FORMAT 999,999,999.99
SELECT
set_menu_id AS menu_id,
set_meal_description,
total_orders,
total_quantity,
total_revenue
FROM (
SELECT
sm.set_menu_id,
sm.description AS set_meal_description,
COUNT(ol.order_no) AS total_orders,
SUM(ol.quantity) AS total_quantity,
SUM(ol.price) AS total_revenue
FROM
(SELECT DISTINCT set_menu_id, description FROM Set_Menu) sm
JOIN
Order_List ol ON sm.set_menu_id = ol.set_menu_id
JOIN
Food_Order fo ON ol.order_no = fo.order_no
LEFT JOIN
Cancellation cn ON ol.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') BETWEEN '&s_firstyear' AND '&s_lastyear'
AND cn.cancel_id IS NULL
GROUP BY
sm.set_menu_id, sm.description
)
ORDER BY
total_revenue DESC;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
