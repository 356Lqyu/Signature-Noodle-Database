-- Percentage of Total Revenue contributed by Each Category
-- Original Oracle SQL*Plus query/report.
SET linesize 120
SET pagesize 235
PROMPT
PROMPT
PROMPT .                                       PERCENTAGE OF TOTAL REVENUE BY CATEGORY
PROMPT
ACCEPT year_input CHAR PROMPT 'Enter the year: ' FORMAT A30
TTITLE CENTER 'Percentage of Total Revenue by Category in &year_input' SKIP 2
COLUMN category_id FORMAT A20 HEADING 'Category ID'
COLUMN category_description FORMAT A55 HEADING Category
COLUMN total_revenue HEADING 'Total Revenue (RM)' FORMAT 999999.99
COLUMN revenue_percentage HEADING 'Percentage (%)' FORMAT 999999.99
SELECT
c.cat_id AS category_id,
c.description AS category_description,
SUM(COALESCE(set_menu_revenue.total_revenue, 0) + COALESCE(ala_carte_revenue.total_revenue, 0) + COALESCE(drinks_revenue.total_revenue, 0)) AS total_revenue,
ROUND(SUM(COALESCE(set_menu_revenue.total_revenue, 0) + COALESCE(ala_carte_revenue.total_revenue, 0) + COALESCE(drinks_revenue.total_revenue, 0)) / total.total_revenue * 100, 2) AS revenue_percentage
FROM
Category c
LEFT JOIN (
SELECT
sm.cat_id,
SUM(ol.price) AS total_revenue
FROM
Order_List ol
JOIN
Set_Menu sm ON ol.set_menu_id = sm.set_menu_id
JOIN
Food_Order fo ON ol.order_no = fo.order_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') = '&year_input'
AND cn.cancel_id IS NULL
GROUP BY
sm.cat_id
) set_menu_revenue ON c.cat_id = set_menu_revenue.cat_id
LEFT JOIN (
SELECT
ac.cat_id,
SUM(ol.price) AS total_revenue
FROM
Order_List ol
JOIN
Ala_Carte_Menu ac ON ol.ala_meal_id = ac.ala_meal_id
JOIN
Food_Order fo ON ol.order_no = fo.order_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') = '&year_input'
AND cn.cancel_id IS NULL
GROUP BY
ac.cat_id
) ala_carte_revenue ON c.cat_id = ala_carte_revenue.cat_id
LEFT JOIN (
SELECT
dm.cat_id,
SUM(ol.price) AS total_revenue
FROM
Order_List ol
JOIN
Drinks_Menu dm ON ol.drinks_id = dm.drinks_id
JOIN
Food_Order fo ON ol.order_no = fo.order_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') = '&year_input'
AND cn.cancel_id IS NULL
GROUP BY
dm.cat_id
) drinks_revenue ON c.cat_id = drinks_revenue.cat_id
CROSS JOIN (
SELECT
SUM(ol.price) AS total_revenue
FROM
Order_List ol
JOIN
Food_Order fo ON ol.order_no = fo.order_no
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
WHERE
TO_CHAR(fo.order_date, 'YYYY') = '&year_input'
AND cn.cancel_id IS NULL
) total
GROUP BY
c.cat_id, c.description, total.total_revenue
ORDER BY
c.cat_id, c.description;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
