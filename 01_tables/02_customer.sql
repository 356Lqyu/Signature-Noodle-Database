CREATE TABLE Customer (
cust_no      VARCHAR(5)   NOT NULL   PRIMARY KEY,
name         VARCHAR(15)  NOT NULL,
phone_no     VARCHAR(12)  NOT NULL,
email        VARCHAR(30)  NOT NULL,
birth_date   DATE         NOT NULL,
gender       CHAR(1)      NOT NULL,
CONSTRAINT chk_email CHECK (REGEXP_LIKE(email,'^[a-zA-Z]\w+@(\S+)$')),
CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('M','F'))
);
