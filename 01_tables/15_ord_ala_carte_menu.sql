CREATE TABLE Ord_Ala_Carte_Menu (
order_no      VARCHAR(5)    NOT NULL,
ala_meal_id   VARCHAR(3)    NOT NULL,
FOREIGN KEY (order_no) REFERENCES Food_Order(order_no),
FOREIGN KEY (ala_meal_id) REFERENCES Ala_Carte_Menu(ala_meal_id)
);
