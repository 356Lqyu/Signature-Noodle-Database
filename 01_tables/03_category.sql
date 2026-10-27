CREATE TABLE Category (
cat_id            VARCHAR(5)    NOT NULL  PRIMARY KEY,
description       VARCHAR(40)   NOT NULL ,
takeaway_charge   DECIMAL(5,2)  DEFAULT 0,
CONSTRAINT takeaway_charge_positive CHECK (takeaway_charge >= 0)
);
