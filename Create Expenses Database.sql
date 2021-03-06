USE [master]
GO
/****** Object:  Database [Expenses]    Script Date: 9/3/2013 11:40:20 AM ******/
CREATE DATABASE [Expenses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Expenses_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Expenses_Data.mdf' , SIZE = 7552KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Expenses_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Expenses_Log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [Expenses] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Expenses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Expenses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Expenses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Expenses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Expenses] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Expenses] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Expenses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Expenses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Expenses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Expenses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Expenses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Expenses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Expenses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Expenses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Expenses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Expenses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Expenses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Expenses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Expenses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Expenses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Expenses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Expenses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Expenses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Expenses] SET  MULTI_USER 
GO
ALTER DATABASE [Expenses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Expenses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Expenses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Expenses] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Expenses]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 9/3/2013 11:40:20 AM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Charges]    Script Date: 9/3/2013 11:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Charges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ExpenseDate] [date] NOT NULL,
	[Merchant] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[BilledAmount] [smallmoney] NOT NULL,
	[TransactionAmount] [smallmoney] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Category] [int] NULL,
	[AccountNumber] [int] NULL,
	[ReceiptRequired] [bit] NOT NULL,
	[ExpenseType] [int] NOT NULL,
	[Notes] [varchar](250) NULL,
 CONSTRAINT [PK_Charges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/3/2013 11:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Alias] [nvarchar](25) NOT NULL,
	[Image] [varbinary](max) NULL,
	[Manager] [nvarchar](25) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseItems]    Script Date: 9/3/2013 11:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ReportNumber] [int] NOT NULL,
	[ExpenseDate] [date] NOT NULL,
	[Merchant] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[BilledAmount] [smallmoney] NOT NULL,
	[TransactionAmount] [smallmoney] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Category] [int] NOT NULL,
	[AccountNumber] [int] NULL,
	[ReceiptRequired] [bit] NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[Image] [varbinary](max) NULL,
	[ExpenseType] [int] NOT NULL,
	[ChargeId] [int] NOT NULL,
 CONSTRAINT [PK_ExpenseItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseReports]    Script Date: 9/3/2013 11:40:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseReports](
	[ReportNumber] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Amount] [smallmoney] NULL,
	[Purpose] [nvarchar](50) NOT NULL,
	[Approver] [nvarchar](25) NULL,
	[CostCenter] [int] NULL,
	[Notes] [nvarchar](250) NULL,
	[DateSubmitted] [date] NULL,
	[Status] [int] NOT NULL,
	[DateResolved] [date] NULL,
	[OwedToCreditCard] [smallmoney] NULL,
	[OwedToEmployee] [smallmoney] NULL,
	[DateSaved] [date] NULL,
	[EmployeeName] [varchar](50) NULL,
 CONSTRAINT [PK_ExpenseReports] PRIMARY KEY CLUSTERED 
(
	[ReportNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Charges] ON 

INSERT [dbo].[Charges] ([Id], [EmployeeId], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [ExpenseType], [Notes]) VALUES (3, 7, CAST(0x1B370B00 AS Date), N'Fourth Coffee', N'Seattle, WA', 12.0000, 12.0000, N'REF# 33748563', NULL, NULL, 0, 1, NULL)
INSERT [dbo].[Charges] ([Id], [EmployeeId], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [ExpenseType], [Notes]) VALUES (4, 7, CAST(0x1F370B00 AS Date), N'Fourth Coffee', N'Seattle, WA', 15.0000, 15.0000, N'REF# 33748876', NULL, NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Charges] OFF
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (1, N'Sabine Royant', N'sabiner', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (2, N'Jeff Price', N'jeffprice', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (3, N'Kevin Kelly', N'kevinkelly', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (4, N'Dennis Bye', N'dennisbye', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (5, N'Barbara Zighetti', N'barbarazighetti', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (6, N'Yan Li', N'yanli', NULL, N'raymondsam')
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Alias], [Image], [Manager]) VALUES (7, N'Robert Green', N'rogreen', NULL, N'barbarazighetti')
SET IDENTITY_INSERT [dbo].[ExpenseItems] ON 

INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (1, 7, 1, CAST(0xE7360B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to San Francisco', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (2, 7, 1, CAST(0xF6360B00 AS Date), N'Contoso Taxi', N'San Francisco, CA', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (3, 7, 1, CAST(0xF6360B00 AS Date), N'Contoso Taxi', N'San Francisco, CA', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (4, 7, 2, CAST(0xC9360B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (5, 7, 2, CAST(0xD3360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (6, 7, 2, CAST(0xD5360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (7, 7, 2, CAST(0xD5360B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (8, 7, 3, CAST(0x8D360B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (9, 7, 3, CAST(0x97360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (10, 7, 3, CAST(0x99360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (11, 7, 3, CAST(0x99360B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (12, 7, 4, CAST(0x51360B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (13, 7, 4, CAST(0x5B360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (14, 7, 4, CAST(0x5D360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (15, 7, 4, CAST(0x5D360B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (16, 7, 5, CAST(0x15360B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (17, 7, 5, CAST(0x1F360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (18, 7, 5, CAST(0x21360B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (19, 7, 5, CAST(0x21360B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (20, 7, 6, CAST(0xD9350B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (21, 7, 6, CAST(0xE3350B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (22, 7, 6, CAST(0xE5350B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (23, 7, 6, CAST(0xE5350B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (24, 7, 7, CAST(0x9D350B00 AS Date), N'Blue Yonder Airlines', N'Chicago, IL', 350.0000, 350.0000, N'Airfare to Chicago', 1, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (25, 7, 7, CAST(0xA7350B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab from airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (26, 7, 7, CAST(0xA9350B00 AS Date), N'Contoso Taxi', N'Chicago, IL', 50.0000, 50.0000, N'Cab to airport', 9, 723000, 0, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (27, 7, 7, CAST(0xA9350B00 AS Date), N'Northwind Inn', N'Chicago, IL', 400.0000, 400.0000, N'2 nights hotel', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (28, 7, 8, CAST(0xFB360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (29, 7, 9, CAST(0xDD360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (30, 7, 10, CAST(0xBF360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (31, 7, 11, CAST(0xA1360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (32, 7, 12, CAST(0x83360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (33, 7, 13, CAST(0x65360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (34, 7, 14, CAST(0x47360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (35, 7, 15, CAST(0x29360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (36, 7, 16, CAST(0x0B360B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (37, 7, 17, CAST(0xED350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (38, 7, 18, CAST(0xCF350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (39, 7, 19, CAST(0xB1350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (40, 7, 20, CAST(0x93350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (41, 7, 21, CAST(0x75350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (42, 7, 22, CAST(0x57350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (43, 7, 23, CAST(0x39350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (44, 7, 24, CAST(0x1B350B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (45, 7, 25, CAST(0xFD340B00 AS Date), N'The Phone Company', N'Seattle, WA', 50.0000, 50.0000, N'Cell phone bill', 8, 742000, 0, NULL, NULL, 2, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (46, 7, 26, CAST(0xF6360B00 AS Date), N'Northwind Inn', N'San Francisco, CA', 200.0000, 200.0000, N'REF# 27438948', 6, 723000, 1, NULL, NULL, 1, 0)
INSERT [dbo].[ExpenseItems] ([Id], [EmployeeId], [ReportNumber], [ExpenseDate], [Merchant], [Location], [BilledAmount], [TransactionAmount], [Description], [Category], [AccountNumber], [ReceiptRequired], [Notes], [Image], [ExpenseType], [ChargeId]) VALUES (47, 7, 26, CAST(0x0F370B00 AS Date), N'Contoso Taxi', N'Seattle, WA', 40.0000, 40.0000, N'REF# 77384751', 0, 0, 0, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ExpenseItems] OFF
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (1, 7, 450.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Tailspin Toys', CAST(0x1C370B00 AS Date), 2, CAST(0x36370B00 AS Date), 450.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (2, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0xD3360B00 AS Date), 2, CAST(0xD8360B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (3, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0x97360B00 AS Date), 2, CAST(0x9C360B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (4, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0x5B360B00 AS Date), 2, CAST(0x60360B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (5, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0x1F360B00 AS Date), 2, CAST(0x24360B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (6, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0xE3350B00 AS Date), 2, CAST(0xE8350B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (7, 7, 850.0000, N'Customer visit', N'barbarazighetti', 50992, N'Visit to Blue Yonder Airlines', CAST(0xA7350B00 AS Date), 2, CAST(0xAC350B00 AS Date), 850.0000, 0.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (8, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x00370B00 AS Date), 2, CAST(0x05370B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (9, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xE2360B00 AS Date), 2, CAST(0xE7360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (10, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xC4360B00 AS Date), 2, CAST(0xC9360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (11, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xA6360B00 AS Date), 2, CAST(0xAB360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (12, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x88360B00 AS Date), 2, CAST(0x8D360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (13, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x6A360B00 AS Date), 2, CAST(0x6F360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (14, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x4C360B00 AS Date), 2, CAST(0x51360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (15, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x2E360B00 AS Date), 2, CAST(0x33360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (16, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x10360B00 AS Date), 2, CAST(0x15360B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (17, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xF2350B00 AS Date), 2, CAST(0xF7350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (18, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xD4350B00 AS Date), 2, CAST(0xD9350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (19, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0xB6350B00 AS Date), 2, CAST(0xBB350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (20, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x98350B00 AS Date), 2, CAST(0x9D350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (21, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x7A350B00 AS Date), 2, CAST(0x7F350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (22, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x5C350B00 AS Date), 2, CAST(0x61350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (23, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x3E350B00 AS Date), 2, CAST(0x43350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (24, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x20350B00 AS Date), 2, CAST(0x25350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (25, 7, 50.0000, N'Last month''s cell phone', N'barbarazighetti', 50992, N'', CAST(0x02350B00 AS Date), 2, CAST(0x07350B00 AS Date), 0.0000, 50.0000, NULL, NULL)
INSERT [dbo].[ExpenseReports] ([ReportNumber], [EmployeeId], [Amount], [Purpose], [Approver], [CostCenter], [Notes], [DateSubmitted], [Status], [DateResolved], [OwedToCreditCard], [OwedToEmployee], [DateSaved], [EmployeeName]) VALUES (26, 7, 240.0000, N'Customer visit', N'barbarazighetti', 50992, N'', NULL, 0, NULL, 240.0000, 0.0000, CAST(0x36370B00 AS Date), NULL)
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_ReceiptRequired]  DEFAULT ((0)) FOR [ReceiptRequired]
GO
ALTER TABLE [dbo].[ExpenseItems] ADD  CONSTRAINT [DF_ExpenseItems_ReportNumber]  DEFAULT ((0)) FOR [ReportNumber]
GO
ALTER TABLE [dbo].[ExpenseItems] ADD  CONSTRAINT [DF_ExpenseItems_Type]  DEFAULT ((1)) FOR [ExpenseType]
GO
ALTER TABLE [dbo].[Charges]  WITH CHECK ADD  CONSTRAINT [FK_Charges_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Charges] CHECK CONSTRAINT [FK_Charges_Employees]
GO
ALTER TABLE [dbo].[ExpenseItems]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseItems_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[ExpenseItems] CHECK CONSTRAINT [FK_ExpenseItems_Employees]
GO
ALTER TABLE [dbo].[ExpenseItems]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseItems_ExpenseReports] FOREIGN KEY([ReportNumber])
REFERENCES [dbo].[ExpenseReports] ([ReportNumber])
GO
ALTER TABLE [dbo].[ExpenseItems] CHECK CONSTRAINT [FK_ExpenseItems_ExpenseReports]
GO
ALTER TABLE [dbo].[ExpenseReports]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReports_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[ExpenseReports] CHECK CONSTRAINT [FK_ExpenseReports_Employees]
GO
USE [master]
GO
ALTER DATABASE [Expenses] SET  READ_WRITE 
GO
