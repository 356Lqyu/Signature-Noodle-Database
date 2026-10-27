CREATE TABLE Staff (
staff_id     VARCHAR(5)   NOT NULL   PRIMARY KEY,
name         VARCHAR(15)  NOT NULL,
phone_no     VARCHAR(12)  NOT NULL,
date_join    DATE         NOT NULL,
birth_date   DATE         NOT NULL,
gender       CHAR(1)      NOT NULL,
CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('M','F'))
);
