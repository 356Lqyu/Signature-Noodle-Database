CREATE TABLE Receipts (
receipts_id      VARCHAR(5)    NOT NULL   PRIMARY KEY,
order_no         VARCHAR(5)     NOT NULL,
printer          VARCHAR(10)    NOT NULL,
total_price      DECIMAL(8,2)   NOT NULL,
payment_method   VARCHAR(15)    NOT NULL,
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no)
);
