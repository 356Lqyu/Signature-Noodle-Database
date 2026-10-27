CREATE TABLE Inventory (
inventory_id   VARCHAR(6)   NOT NULL  PRIMARY KEY,
staff_id       VARCHAR(5)    NOT NULL,
description    VARCHAR(40)   NOT NULL,
quantity       INT           NOT NULL,
date_restock   DATE          NOT NULL,
supplier       VARCHAR(1)   NOT NULL,
CHECK (quantity >= 0),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
