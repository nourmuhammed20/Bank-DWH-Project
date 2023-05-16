use STG_Bank

/*creating tables*/


CREATE TABLE STG_Customers (
  Customer_id INT NOT NULL PRIMARY KEY,
  customer_name NVARCHAR(50),
  address NVARCHAR(100),
  phone NVARCHAR(20),
  zipcode NVARCHAR(10),
  dob DATE,
  gender CHAR(1),
  occupation NVARCHAR(50),
  annual_income FLOAT
);
CREATE TABLE STG_Branch (
  branch_id INT NOT NULL PRIMARY KEY,
  branch_name NVARCHAR(50),
  zip_code NVARCHAR(10),
  Location NVARCHAR(50)
);
CREATE TABLE STG_Account (
  account_id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  branch_id INT NOT NULL,
  creation_date DATETime NOT NULL,
  account_balance FLOAT NOT NULL,
  account_type VARCHAR(100) NOT NULL,
  CONSTRAINT FK_Customers_Accounts FOREIGN KEY (customer_id) REFERENCES STG_Customers(Customer_id),
  CONSTRAINT FK_Branch_Accounts FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);

CREATE TABLE STG_Credit_Card (
  credit_card_number bigint NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  start_date DATETIME NOT NULL,
  Expiration_date DATE NOT NULL,
  interest_rate FLOAT NOT NULL,
  credit_type VARCHAR(100) NOT NULL,
  credit_limit FLOAT NOT NULL,
  annual_fee FLOAT NOT NULL,
  CONSTRAINT FK_Account_CreditCards FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_CreditCards FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);
CREATE TABLE STG_Loan (
  loan_id INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  interest_rate FLOAT NOT NULL,
  loan_type VARCHAR(100) NOT NULL,
  loan_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Loans FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_Loans FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);
CREATE TABLE STG_Transaction_Type (
  transaction_type_id INT NOT NULL PRIMARY KEY,
  transaction_type_name VARCHAR(100) NOT NULL,
  is_debit char NOT NULL,
  is_credit char NOT NULL,
  is_internal char NOT NULL,
  is_external char NOT NULL
);
CREATE TABLE STG_Transactions (
  transaction_id INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  transaction_type_id INT NOT NULL,
  transaction_date DATETIME NOT NULL,
  interest_rate FLOAT NOT NULL,
  CONSTRAINT FK_Account_Transactions FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_TransactionType_Transactions FOREIGN KEY (transaction_type_id) REFERENCES STG_Transaction_Type(transaction_type_id)
);
create table STG_Treasury_Products(
product_id int NOT NUll PRIMARY KEY,
account_id int NOT NULL FOREIGN KEY REFERENCES STG_Account(account_id),
Product_Name varchar(100) Not null,
product_type varchar(100) Not null,
interest_rate float not null,
Minimum_Balance float not null,
Maximum_Balance float not null,
fees float not null,
Availability varchar(100) Not null,
Terms varchar(100) Not null
);

CREATE TABLE STG_Withdrawal (
  Withdrawal_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Withdrawal_date DATETIME NOT NULL,
  Withdrawal_method VARCHAR(150) NOT NULL,
  Withdrawal_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Withdrawals FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_Withdrawals FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);
CREATE TABLE STG_Payment (
  Payment_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Payment_date DATETIME NOT NULL,
  Payment_method VARCHAR(150) NOT NULL,
  Payment_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Payments FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_Payments FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);
CREATE TABLE STG_Transfer (
  Transfer_ID INT NOT NULL PRIMARY KEY,
  From_account_id INT NOT NULL,
  To_account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Transfer_date DATETIME NOT NULL,
  Transfer_method VARCHAR(150) NOT NULL,
  Transfer_amount FLOAT NOT NULL,
  CONSTRAINT FK_From_Account_Transfers FOREIGN KEY (From_account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_To_Account_Transfers FOREIGN KEY (To_account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_Transfers FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);
CREATE TABLE STG_Deposit (
  Deposit_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  deposit_date DATETIME NOT NULL,
  deposit_method VARCHAR(150) NOT NULL,
  deposit_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Deposits FOREIGN KEY (account_id) REFERENCES STG_Account(account_id),
  CONSTRAINT FK_Branch_Deposits FOREIGN KEY (branch_id) REFERENCES STG_Branch(branch_id)
);

