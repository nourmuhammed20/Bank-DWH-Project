use DW_Bank


CREATE TABLE FACT_LOAN (
    LOAN_SK INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    loan_id INT,
    branch_id INT,
    date_id2 datetime,
    loan_type VARCHAR(50),
    loan_amount float,
    FOREIGN KEY (loan_id) REFERENCES DIM_Loan (loan_id),
    FOREIGN KEY (branch_id) REFERENCES DIM_Branch (branch_id),
    FOREIGN KEY (date_id2) REFERENCES DIM_Date (Full_Date)
);

CREATE TABLE FACT_Transaction (
    transaction_id INT,
    account_id INT,
    transaction_type_id INT,
    date_id2 INT,
    time_key TIME,
    amount DECIMAL(10,2),
    FOREIGN KEY (transaction_id) REFERENCES DIM_Transactions (transaction_id),
    FOREIGN KEY (account_id) REFERENCES DIM_Account (account_id),
    FOREIGN KEY (transaction_type_id) REFERENCES DIM_Transaction_Type (transaction_type_id),
    FOREIGN KEY (date_id2) REFERENCES DIM_Date (Date_Id),
);

CREATE TABLE FACT_Treasury_PRODUCT (
    transaction_id INT,
    account_id INT,
    product_id INT,
    date_id2 INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (transaction_id) REFERENCES DIM_Transactions (transaction_id),
    FOREIGN KEY (account_id) REFERENCES DIM_Account (account_id),
    FOREIGN KEY (product_id) REFERENCES DIM_Treasury_Products (product_id),
    FOREIGN KEY (date_id2) REFERENCES DIM_Date (Date_Id)
);

CREATE TABLE Payment_fact (
    payment_id INT,
    branch_id INT,
    date_id2 INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (payment_id) REFERENCES DIM_Payment (payment_id),
    FOREIGN KEY (branch_id) REFERENCES DIM_Branch (branch_id),
    FOREIGN KEY (date_id2) REFERENCES DIM_Date (Date_Id)
);
