Create TABLE Ord_Set_Menu(
order_no           VARCHAR(5)    NOT NULL,
set_menu_id        VARCHAR(3)    NOT NULL,
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no),
FOREIGN KEY (set_menu_id) REFERENCES Set_Menu(set_menu_id)
);
