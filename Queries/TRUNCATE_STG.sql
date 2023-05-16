USE [STG_Bank]
GO


ALTER TABLE [dbo].[STG_Account] DROP CONSTRAINT [FK_Customers_Accounts]
GO

ALTER TABLE [dbo].[STG_Account] DROP CONSTRAINT [FK_Branch_Accounts]
GO

/****** Object:  Table [dbo].[STG_Account]    Script Date: 5/5/2023 3:11:04 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STG_Account]') AND type in (N'U'))
DROP TABLE [dbo].[STG_Account]
GO

/****** Object:  Table [dbo].[STG_Account]    Script Date: 5/5/2023 3:11:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Account](
	[account_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[account_balance] [float] NOT NULL,
	[account_type] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STG_Account]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Accounts] FOREIGN KEY([branch_id])
REFERENCES [dbo].[STG_Branch] ([branch_id])
GO

ALTER TABLE [dbo].[STG_Account] CHECK CONSTRAINT [FK_Branch_Accounts]
GO

ALTER TABLE [dbo].[STG_Account]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Accounts] FOREIGN KEY([customer_id])
REFERENCES [dbo].[STG_Customers] ([Customer_id])
GO

ALTER TABLE [dbo].[STG_Account] CHECK CONSTRAINT [FK_Customers_Accounts]
GO



ALTER TABLE [dbo].[STG_Treasury_Products] DROP CONSTRAINT [FK__STG_Treas__accou__398D8EEE]
GO

/****** Object:  Table [dbo].[STG_Treasury_Products]    Script Date: 5/5/2023 3:07:06 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STG_Treasury_Products]') AND type in (N'U'))
DROP TABLE [dbo].[STG_Treasury_Products]
GO

/****** Object:  Table [dbo].[STG_Treasury_Products]    Script Date: 5/5/2023 3:07:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Treasury_Products](
	[product_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[Product_Name] [varchar](100) NOT NULL,
	[product_type] [varchar](100) NOT NULL,
	[interest_rate] [float] NOT NULL,
	[Minimum_Balance] [float] NOT NULL,
	[Maximum_Balance] [float] NOT NULL,
	[fees] [float] NOT NULL,
	[Availability] [varchar](100) NOT NULL,
	[Terms] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STG_Treasury_Products]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[STG_Account] ([account_id])
GO


/****** Object:  Table [dbo].[STG_Transaction_Type]    Script Date: 5/5/2023 3:06:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STG_Transaction_Type]') AND type in (N'U'))
DROP TABLE [dbo].[STG_Transaction_Type]
GO

/****** Object:  Table [dbo].[STG_Transaction_Type]    Script Date: 5/5/2023 3:06:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Transaction_Type](
	[transaction_type_id] [int] NOT NULL,
	[transaction_type_name] [varchar](100) NOT NULL,
	[is_debit] [char](1) NOT NULL,
	[is_credit] [char](1) NOT NULL,
	[is_internal] [char](1) NOT NULL,
	[is_external] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_Customers]    Script Date: 5/5/2023 3:06:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STG_Customers]') AND type in (N'U'))
DROP TABLE [dbo].[STG_Customers]
GO

/****** Object:  Table [dbo].[STG_Customers]    Script Date: 5/5/2023 3:06:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Customers](
	[Customer_id] [int] NOT NULL,
	[customer_name] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[zipcode] [nvarchar](10) NULL,
	[dob] [date] NULL,
	[gender] [char](1) NULL,
	[occupation] [nvarchar](50) NULL,
	[annual_income] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[STG_Branch]    Script Date: 5/5/2023 3:06:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STG_Branch]') AND type in (N'U'))
DROP TABLE [dbo].[STG_Branch]
GO

/****** Object:  Table [dbo].[STG_Branch]    Script Date: 5/5/2023 3:06:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_Branch](
	[branch_id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
	[zip_code] [nvarchar](10) NULL,
	[Location] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

