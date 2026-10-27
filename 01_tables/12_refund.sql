CREATE TABLE Refund (
refund_id      VARCHAR(5)    NOT NULL    PRIMARY KEY,
refund_date    DATE          NOT NULL,
refund_amount  DECIMAL(8,2)  NOT NULL,
cancel_id      VARCHAR(4),
FOREIGN KEY (cancel_id) REFERENCES Cancellation(cancel_id)
);
