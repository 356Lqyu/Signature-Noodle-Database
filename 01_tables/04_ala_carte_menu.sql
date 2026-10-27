Create TABLE Ala_Carte_Menu (
ala_meal_id     VARCHAR(3)      NOT NULL  PRIMARY KEY,
description     VARCHAR(40)     NOT NULL,
price           DECIMAL(8,2)    NOT NULL,
cat_id          VARCHAR(5)      NOT NULL,
remark 		 VARCHAR(35),
FOREIGN key(cat_id) references Category(cat_id)
);
