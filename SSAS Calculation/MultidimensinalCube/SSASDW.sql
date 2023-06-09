USE [master]
GO
/****** Object:  Database [SSASDW]    Script Date: 10/20/15 6:35:38 PM ******/
CREATE DATABASE [SSASDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SSASDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SSASDW.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SSASDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SSASDW_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SSASDW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSASDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSASDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSASDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSASDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSASDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSASDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSASDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSASDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSASDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSASDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSASDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSASDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSASDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSASDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSASDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSASDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SSASDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSASDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSASDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSASDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSASDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSASDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSASDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSASDW] SET RECOVERY FULL 
GO
ALTER DATABASE [SSASDW] SET  MULTI_USER 
GO
ALTER DATABASE [SSASDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSASDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SSASDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SSASDW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SSASDW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SSASDW', N'ON'
GO
USE [SSASDW]
GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 10/20/15 6:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerId] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimlProduct]    Script Date: 10/20/15 6:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimlProduct](
	[ProductId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 10/20/15 6:35:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [int] NULL,
	[Tax] [int] NULL,
	[SalesDate] [datetime] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [CityName]) VALUES (1, N'Alex', N'USA')
GO
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [CityName]) VALUES (2, N'Sukesh', N'India')
GO
INSERT [dbo].[DimCustomer] ([CustomerId], [CustomerName], [CityName]) VALUES (3, N'John', N'UK')
GO
INSERT [dbo].[DimlProduct] ([ProductId], [ProductName], [CategoryName]) VALUES (1, N'PC', N'Electronics')
GO
INSERT [dbo].[DimlProduct] ([ProductId], [ProductName], [CategoryName]) VALUES (2, N'Jeans', N'Clothes')
GO
INSERT [dbo].[DimlProduct] ([ProductId], [ProductName], [CategoryName]) VALUES (3, N'Tshirts', N'Clothes')
GO
INSERT [dbo].[DimlProduct] ([ProductId], [ProductName], [CategoryName]) VALUES (4, N'Keyboard', N'Electronics')
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (1, 1, 1000, 100, CAST(N'2011-01-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (1, 2, 2000, 120, CAST(N'2011-01-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (1, 3, 3000, 320, CAST(N'2011-05-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (1, 4, 4000, 452, CAST(N'2010-02-02 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (2, 1, 5000, 250, CAST(N'2010-03-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (2, 2, 6000, 650, CAST(N'2009-05-05 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (2, 3, 1500, 210, CAST(N'2006-01-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (3, 4, 3500, 360, CAST(N'2011-05-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (3, 2, 3500, 222, CAST(N'2006-02-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[FactSales] ([CustomerId], [ProductId], [Amount], [Tax], [SalesDate]) VALUES (3, 3, 2500, 36, CAST(N'2006-02-22 00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[FactSales]  WITH NOCHECK ADD  CONSTRAINT [FK_FactSales_DimCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[DimCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCustomer]
GO
ALTER TABLE [dbo].[FactSales]  WITH NOCHECK ADD  CONSTRAINT [FK_FactSales_DimlProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[DimlProduct] ([ProductId])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimlProduct]
GO
USE [master]
GO
ALTER DATABASE [SSASDW] SET  READ_WRITE 
GO
