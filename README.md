Datawarehouse Project
=====================
#Part one - Requirement
This repository contains the implementation of a data warehousing project consisting of two phases. The goal of this project is to design and build a dimensional model based on an existing database and then transform the data into a data warehouse using SSIS. Additionally, queries will be executed on the fact tables to gain insights from the data, and the SSIS packages will be deployed and scheduled. 🚀📊

Phase 1: Proposal and Dimensional Model
---------------------------------------

In the first phase of the project, you will select a database and carefully study its schema. Then, you will design a dimensional model (star/snowflake schema) based on the chosen database. The following deliverables are expected:

1.  **Cover page:** Include the names and IDs of the students and the name of the TA.
2.  **Source ERD:** Present the Entity-Relationship Diagram (ERD) of the chosen database, highlighting the tables that will be used to build the dimensional model.
3.  **Dimensional model:** Design the dimensional model by performing the following tasks:
    *   **Define the business process(es):** Specify the business process(es) that will be modeled using the dimensional model.
    *   **Declare the grain of each fact table:** Describe what a record in each fact table represents.
    *   **Define the dimensions:** Determine the dimensions that will be included in the dimensional model.
    *   **Define the measures:** Identify the measures that will appear in the fact tables.
    *   **Add a diagram:** Provide a diagram illustrating the dimensional model. 📐

Phase 2: Data Transformation and Deployment
-------------------------------------------

In the second phase of the project, the focus will be on transforming the data from the source database to a staging area (STG), and then to the data warehouse (DWH) using SSIS. Additionally, queries will be executed on the fact tables to gain insights from the data. Finally, the SSIS packages will be deployed and scheduled. The following deliverables are expected:

1.  **Cover page:** Include the names and IDs of the students and the name of the TA.
2.  **Screenshots of data flow and control flow tasks:** Provide screenshots of the data flow tasks and control flow tasks used to build the data warehouse. Each screenshot should be accompanied by a meaningful title. 📷
3.  **Queries on fact tables:** Execute queries on each fact table to understand the information represented by the table and the insights that can be obtained from it. Include screenshots of the result set for each query. 📝
4.  **Screenshots of deployed packages:** Display screenshots of the deployed SSIS packages, including information about their scheduling. 📦🗓️
5.  **\[Bonus\] Interactive dashboard:** Optionally, build an interactive dashboard for the data warehouse using a Business Intelligence (BI) tool or any programming language. 📊📈


#Part 2 - Dataset Description
-------------------

The following describes the dataset used for the data warehousing project, including the fact tables and dimension tables.

### Fact Tables

1.  **Loan\_Fact**
    
    *   This fact table represents information about loans granted by the bank.
    *   It contains data about loan amounts, types, interest rates, terms, and other loan-specific attributes with each branch.
    *   Measures:
        *   Total loans per branch.
    *   Each record represents a loan given from a bank branch to an account in a specific date format.
2.  **Transaction\_Fact**
    
    *   This fact table represents information about various types of transactions that occur within the bank, such as deposits, withdrawals, transfers, and payments.
    *   It includes data about the transaction amount, date, time, location, and other transaction-specific attributes.
    *   Measures:
        *   Total transaction amount per each type.
    *   Each record represents a transaction made by an account in a specific date format.
3.  **Product\_Fact**
    
    *   This fact table represents information about the different products and services offered by the bank, such as mortgages, investments, insurance policies, etc.
    *   It includes data about the product type, pricing, terms, and other product-specific attributes.
    *   Measures:
        *   Most sold product per time.
    *   Each record represents a sales transaction made by a product in a specific date format.
4.  **Payment\_Fact**
    
    *   This fact table represents information about payments made by customers to the bank or received by customers from the bank.
    *   It includes data about the payment amount, date, time, location, and other payment-specific attributes.
    *   It also includes data about the accounts and customers involved in each payment transaction.
    *   Measures:
        *   Total number of payments made by a branch over a given period.
        *   Total value of payments made by a branch over a given period.
    *   Each record represents a payment transaction made by an account in a specific date format.

### Dimensions

The following dimensions are used in the dimensional model:

1.  **Time\_Dim**
    
    *   This dimension is used to track various time-related information, such as date, day, month, quarter, year, etc. It can be used to filter and analyze data based on different time periods.
2.  **Treasury\_Products\_Dim**
    
    *   This dimension is used to track information related to different treasury products offered by the bank, such as savings accounts, money market accounts, certificates of deposit, etc.
    *   It can be used to analyze and compare different products based on their interest rates, fees, minimum balance requirements, etc.
3.  **Branch\_Dim**
    
    *   This dimension is used to track information related to the various branches of the bank, such as branch location, address, phone number, etc.
    *   It can be used to filter and analyze data based on different branches.
4.  **Loan\_Dim**
    
    *   This dimension is used to track information related to loans offered by the bank, such as loan type, interest rate, loan amount, start date, end date, etc.
    *   It can be used to analyze and compare different loans based on their terms and performance.
5.  **Customers\_Dim**
    
    *   This dimension is used to track information related to bank customers, such as customer name, address, phone number, occupation, annual income, etc.
    *   It can be used to analyze and segment customers based on their demographics and behaviors.
6.  **Account\_Dim**
    
    *   This dimension is used to track information related to bank accounts, such as account type, account balance, creation date, etc.
    *   It can be used to analyze and compare different accounts based on their performance.
7.  **Transaction\_Dim**
    
    *   This dimension is used to track information related to different transactions, such as transaction date, transaction type, transaction amount, etc.
    *   It can be used to filter and analyze data based on different types of transactions.
8.  **Transaction\_Type\_Dim**
    
    *   This dimension is used to track information related to different transaction types, such as deposit, withdrawal, transfer, payment, etc.
    *   It can be used to filter and analyze data based on different types of transactions.
9.  **Deposit\_Dim**
    
    *   This dimension is used to track information related to deposits made by customers, such as deposit amount, deposit date, deposit method, etc.
    *   It can be used to analyze and compare different deposits based on their amounts and sources.
10.  **Transfer\_Dim**
    
    *   This dimension is used to track information related to transfers made between accounts, such as transfer amount, transfer date, transfer method, etc.
    *   It can be used to analyze and compare different transfers based on their amounts and sources.
11.  **Payment\_Dim**
    
    *   This dimension is used to track information related to payments made by customers, such as payment amount, payment date, payment method, etc.
    *   It can be used to analyze and compare different payments based on their amounts and sources.
12.  **Withdrawal\_Dim**
    
    *   This dimension is used to track information related to withdrawals made by customers, such as withdrawal amount, withdrawal date, withdrawal method, etc.
    *   It can be used to analyze and compare different withdrawals based on their amounts and sources.

These fact tables and dimensions form the foundation of the data warehousing project and enable the analysis of bank transactions, customer accounts, and treasury products.


Conclusion
----------

This data warehousing project provides a comprehensive solution for designing and building a dimensional model and transforming data into a data warehouse. It aims to showcase the ability to work with databases, dimensional modeling, ETL processes using SSIS, and querying data for insights. Feel free to explore the project files and documentation to understand the implementation details. 💡🔍
