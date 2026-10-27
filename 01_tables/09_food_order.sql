CREATE TABLE Food_Order (
order_no         VARCHAR(5)    NOT NULL    PRIMARY KEY,
order_date       DATE          NOT NULL,
cust_no          VARCHAR(5)    NOT NULL,
staff_id         VARCHAR(5)    NOT NULL,
service_option   VARCHAR(2)    NOT NULL,
table_no         INT,
no_pax           INT,
total_item       INT           NOT NULL,
discount_id      VARCHAR(5),
total_price      DECIMAL(8,2)  NOT NULL,
platform         VARCHAR(14),
FOREIGN KEY (cust_no) REFERENCES Customer(cust_no),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
FOREIGN KEY (discount_id) REFERENCES Discount(discount_id),
CHECK (service_option IN ('DI','TA'))
);
