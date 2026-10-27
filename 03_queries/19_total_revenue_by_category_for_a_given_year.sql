-- Total Revenue by Category For A Given Year
-- Original Oracle SQL*Plus query/report.
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-Mon-YYYY';
ACCEPT input_year CHAR PROMPT 'Enter Year: '
SET LINESIZE 120
SET PAGESIZE 300
TTITLE CENTER 'Total Revenue by Category for Year &input_year' SKIP 2
COLUMN category_id HEADING 'Category ID' FORMAT A15
COLUMN category_description HEADING 'Description' FORMAT A50
COLUMN total_order HEADING 'Total Order' FORMAT 9999
COLUMN total_quantity HEADING 'Quantity' FORMAT 9999
COLUMN total_revenue HEADING 'Total Revenue (RM)' FORMAT 999,999,999.99
SELECT c.cat_id AS category_id,
c.description AS category_description,
COUNT(ol.order_no) AS total_order,
SUM(ol.quantity) AS total_quantity,
SUM(ol.price) AS total_revenue
FROM Order_List ol
JOIN Food_Order fo ON ol.order_no = fo.order_no
JOIN (
SELECT ala_meal_id AS menu_id, cat_id FROM Ala_Carte_Menu
UNION ALL
SELECT set_menu_id AS menu_id, cat_id FROM Set_Menu
UNION ALL
SELECT drinks_id AS menu_id, cat_id FROM Drinks_Menu
) m ON ol.ala_meal_id = m.menu_id
LEFT JOIN Category c ON m.cat_id = c.cat_id
LEFT JOIN Cancellation cn ON ol.order_no = cn.order_no
WHERE TO_CHAR(fo.order_date, 'YYYY') = '&input_year'
AND cn.cancel_id IS NULL
GROUP BY c.cat_id, c.description
ORDER BY category_id;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
