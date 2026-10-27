CREATE TABLE Order_List (
order_no     VARCHAR(5)    NOT NULL,
ala_meal_id  VARCHAR(3),
set_menu_id  VARCHAR(3),
drinks_id    VARCHAR(2),
quantity     INT           NOT NULL,
price        DECIMAL(8,2)  NOT NULL,
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no),
FOREIGN KEY (ala_meal_id) REFERENCES Ala_Carte_Menu(ala_meal_id),
FOREIGN KEY (set_menu_id) REFERENCES Set_Menu(set_menu_id),
FOREIGN KEY (drinks_id) REFERENCES Drinks_Menu(drinks_id)
);
