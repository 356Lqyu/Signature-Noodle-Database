-- Total Discount Amount For Each Customer
-- Original Oracle SQL*Plus query/report.
SET linesize 300
SET pagesize 235
TTITLE LEFT '                                         TOTAL DISCOUNT AMOUNT OFFERED TO CUSTOMER' SKIP 2
COLUMN customer_id HEADING 'Customer ID' FORMAT A15
COLUMN customer_name HEADING 'Customer Name' FORMAT A40
COLUMN quantity_of_bread_purchase HEADING 'Quantity of Bread Purchased' FORMAT 9999
COLUMN total_discount_amount HEADING 'Total Discount Amount' FORMAT 999,999.99
COLUMN total_price HEADING 'Total Price' FORMAT 999,999,999.99
SELECT
fo.cust_no AS customer_id,
c.name AS customer_name,
SUM(CASE WHEN ol.ala_meal_id IN ('BB1', 'BB2') THEN ol.quantity ELSE 0 END) AS quantity_of_bread_purchase,
SUM(d.bread_amount - d.cost_after_discount) AS total_discount_amount,
SUM(d.cost_after_discount) AS total_price
FROM
Food_Order fo
JOIN
Order_List ol ON fo.order_no = ol.order_no
JOIN
Discount d ON fo.discount_id = d.discount_id
LEFT JOIN
Cancellation cn ON fo.order_no = cn.order_no
LEFT JOIN
Customer c ON fo.cust_no = c.cust_no
WHERE
cn.order_no IS NULL
AND (ol.ala_meal_id IN ('BB1', 'BB2')) -- Only consider orders with ala_meal_id BB1 or BB2
GROUP BY
fo.cust_no, c.name;
CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF
