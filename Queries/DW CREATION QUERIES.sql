/*START DIMENSIONS*/
/*TIME DIMENSION*/
CREATE TABLE Dim_Date (
    Date_Id INT IDENTITY(1,1) NOT NULL,
    Full_Date DATE NOT NULL,
    Day_Of_Week VARCHAR(20) NOT NULL,
    Day_Of_Month INT NOT NULL,
    Day_Of_Year INT NOT NULL,
    Week_Of_Year INT NOT NULL,
    Month_Name VARCHAR(20) NOT NULL,
    Month_Number INT NOT NULL,
    Quarter_Number INT NOT NULL,
    Year_Number INT NOT NULL
);

DECLARE @StartDate DATE = '1950-01-01';
DECLARE @EndDate DATE = '2025-12-31';
DECLARE @CurrentDate DATE = @StartDate;

WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO Dim_Date (Full_Date, Day_Of_Week, Day_Of_Month, Day_Of_Year, Week_Of_Year, Month_Name, Month_Number, Quarter_Number, Year_Number)
    VALUES (
        @CurrentDate,
        DATENAME(WEEKDAY, @CurrentDate),
        DATEPART(DAY, @CurrentDate),
        DATEPART(DAYOFYEAR, @CurrentDate),
        DATEPART(WEEK, @CurrentDate),
        DATENAME(MONTH, @CurrentDate),
        DATEPART(MONTH, @CurrentDate),
        DATEPART(QUARTER, @CurrentDate),
        DATEPART(YEAR, @CurrentDate)
    );
    
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END


/*OTHER DIMENSIONS*/
CREATE TABLE DIM_Customers (
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
CREATE TABLE DIM_Branch (
  branch_id INT NOT NULL PRIMARY KEY,
  branch_name NVARCHAR(50),
  zip_code NVARCHAR(10),
  Location NVARCHAR(50)
);

CREATE TABLE DIM_Account (
  account_id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  branch_id INT NOT NULL,
  creation_date DATETime NOT NULL,
  account_balance FLOAT NOT NULL,
  account_type VARCHAR(100) NOT NULL,
  CONSTRAINT FK_Customers_Accounts FOREIGN KEY (customer_id) REFERENCES DIM_Customers(Customer_id),
  CONSTRAINT FK_Branch_Accounts FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);
CREATE TABLE DIM_Transaction_Type (
  transaction_type_id INT NOT NULL PRIMARY KEY,
  transaction_type_name VARCHAR(100) NOT NULL,
  is_debit char NOT NULL,
  is_credit char NOT NULL,
  is_internal char NOT NULL,
  is_external char NOT NULL
);

CREATE TABLE DIM_Loan (
  loan_id INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  interest_rate FLOAT NOT NULL,
  loan_type VARCHAR(100) NOT NULL,
  loan_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Loans FOREIGN KEY (account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_Branch_Loans FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);
CREATE TABLE DIM_Transactions (
  transaction_id INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  transaction_type_id INT NOT NULL,
  transaction_date DATETIME NOT NULL,
  interest_rate FLOAT NOT NULL,
  CONSTRAINT FK_Account_Transactions FOREIGN KEY (account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_TransactionType_Transactions FOREIGN KEY (transaction_type_id) REFERENCES DIM_Transaction_Type(transaction_type_id)
);
create table DIM_Treasury_Products(
product_id int NOT NUll PRIMARY KEY,
account_id int NOT NULL FOREIGN KEY REFERENCES DIM_Account(account_id),
Product_Name varchar(100) Not null,
product_type varchar(100) Not null,
interest_rate float not null,
Minimum_Balance float not null,
Maximum_Balance float not null,
fees float not null,
Availability varchar(100) Not null,
Terms varchar(100) Not null
);
CREATE TABLE DIM_Withdrawal (
  Withdrawal_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Withdrawal_date DATETIME NOT NULL,
  Withdrawal_method VARCHAR(150) NOT NULL,
  Withdrawal_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Withdrawals FOREIGN KEY (account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_Branch_Withdrawals FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);
CREATE TABLE DIM_Payment (
  Payment_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Payment_date DATETIME NOT NULL,
  Payment_method VARCHAR(150) NOT NULL,
  Payment_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Payments FOREIGN KEY (account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_Branch_Payments FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);
CREATE TABLE DIM_Transfer (
  Transfer_ID INT NOT NULL PRIMARY KEY,
  From_account_id INT NOT NULL,
  To_account_id INT NOT NULL,
  branch_id INT NOT NULL,
  Transfer_date DATETIME NOT NULL,
  Transfer_method VARCHAR(150) NOT NULL,
  Transfer_amount FLOAT NOT NULL,
  CONSTRAINT FK_From_Account_Transfers FOREIGN KEY (From_account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_To_Account_Transfers FOREIGN KEY (To_account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_Branch_Transfers FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);
CREATE TABLE DIM_Deposit (
  Deposit_ID INT NOT NULL PRIMARY KEY,
  account_id INT NOT NULL,
  branch_id INT NOT NULL,
  deposit_date DATETIME NOT NULL,
  deposit_method VARCHAR(150) NOT NULL,
  deposit_amount FLOAT NOT NULL,
  CONSTRAINT FK_Account_Deposits FOREIGN KEY (account_id) REFERENCES DIM_Account(account_id),
  CONSTRAINT FK_Branch_Deposits FOREIGN KEY (branch_id) REFERENCES DIM_Branch(branch_id)
);

/*END DIMENSION*/

/*START FACT TABLES*/


/*END FACT TABLES*/