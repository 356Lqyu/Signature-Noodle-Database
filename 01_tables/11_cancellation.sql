CREATE TABLE Cancellation (
cancel_id     VARCHAR(4)   NOT NULL   PRIMARY KEY,
order_no      VARCHAR(5)   NOT NULL,
cancel_date   DATE         NOT NULL,
reason        VARCHAR(40),
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no)
);
