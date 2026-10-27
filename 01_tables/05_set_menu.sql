CREATE TABLE Set_Menu (
set_menu_id     VARCHAR(3)    NOT NULL  PRIMARY KEY,
description     VARCHAR(40)   NOT NULL,
price           DECIMAL(8,2)  NOT NULL,
cat_id          VARCHAR(5)    NOT NULL,
remark          VARCHAR(35),
FOREIGN KEY (cat_id) REFERENCES Category(cat_id)
);
