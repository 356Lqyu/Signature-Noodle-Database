CREATE TABLE Finance (
finance_id   VARCHAR(6)     NOT NULL   PRIMARY KEY,
staff_id     VARCHAR(5)     NOT NULL,
type         VARCHAR(8)     NOT NULL,
description  VARCHAR(40)    NOT NULL,
amount       DECIMAL(8,2)   NOT NULL,
date_record  DATE           NOT NULL,
CHECK (type IN ('loss', 'profit')),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
