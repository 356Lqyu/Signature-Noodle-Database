CREATE TABLE Ord_Drinks_Menu (
order_no     VARCHAR(5)   NOT NULL,
drinks_id    VARCHAR(2)   NOT NULL,
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no),
FOREIGN KEY (drinks_id) REFERENCES Drinks_Menu(drinks_id)
);
