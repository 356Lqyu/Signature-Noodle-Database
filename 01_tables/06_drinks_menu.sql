Create TABLE Drinks_Menu (
drinks_id       VARCHAR(2)    NOT NULL  PRIMARY KEY,
description     VARCHAR(40)   NOT NULL,
hot_price       NUMERIC(8,2)  NOT NULL,
cool_price      NUMERIC(8,2)  NOT NULL,
cat_id          VARCHAR(5)    NOT NULL,
FOREIGN key(cat_id) references Category(cat_id)
);
