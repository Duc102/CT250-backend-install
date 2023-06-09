USE [master]
GO
/****** Object:  Database [ecommercedb]    Script Date: 25/04/2023 21:11:08 ******/
CREATE DATABASE [ecommercedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommercedb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ecommercedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommercedb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ecommercedb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ecommercedb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommercedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommercedb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommercedb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommercedb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommercedb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommercedb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommercedb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ecommercedb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecommercedb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommercedb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommercedb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommercedb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommercedb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommercedb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommercedb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommercedb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecommercedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommercedb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommercedb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommercedb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommercedb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommercedb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommercedb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommercedb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ecommercedb] SET  MULTI_USER 
GO
ALTER DATABASE [ecommercedb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommercedb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommercedb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommercedb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecommercedb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ecommercedb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ecommercedb] SET QUERY_STORE = OFF
GO
USE [ecommercedb]
GO
/****** Object:  User [CT250]    Script Date: 25/04/2023 21:11:08 ******/
CREATE USER [CT250] FOR LOGIN [CT250] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [ecommercedb]
GO
/****** Object:  Sequence [dbo].[address_seq]    Script Date: 25/04/2023 21:11:09 ******/
CREATE SEQUENCE [dbo].[address_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [ecommercedb]
GO
/****** Object:  Sequence [dbo].[user_seq]    Script Date: 25/04/2023 21:11:09 ******/
CREATE SEQUENCE [dbo].[user_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[address]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_address_line] [nvarchar](256) NULL,
	[second_address_line] [nvarchar](256) NULL,
	[postal_code] [nvarchar](256) NULL,
	[city] [nvarchar](256) NULL,
	[country_id] [bigint] NULL,
 CONSTRAINT [pk_ad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](256) NULL,
 CONSTRAINT [pk_coun] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_line]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_line](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_item_id] [bigint] NULL,
	[shop_order_id] [bigint] NULL,
	[qty] [int] NULL,
 CONSTRAINT [pk_ol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](255) NULL,
 CONSTRAINT [pk_os] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [pk_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_id] [bigint] NULL,
	[description] [nvarchar](1024) NULL,
	[name] [nvarchar](1024) NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [bigint] NOT NULL,
	[parent_category_id] [bigint] NULL,
	[category_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_configuration]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_configuration](
	[product_item_id] [bigint] NULL,
	[variation_option_id] [bigint] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[url] [varchar](255) NULL,
	[product_item_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_item]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_item](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[qty_in_stock] [int] NULL,
	[sku] [varchar](255) NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop_order]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_order](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[order_date] [date] NULL,
	[update_date] [date] NULL,
	[shipping_address_id] [bigint] NULL,
	[order_total] [real] NULL,
	[order_status_id] [bigint] NULL,
	[payment_id] [bigint] NULL,
 CONSTRAINT [pk_so] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_cart]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [pk_shc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_cart_item]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_cart_item](
	[cart_id] [bigint] NULL,
	[product_item_id] [bigint] NULL,
	[qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[site_user]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email_address] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_address]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_address](
	[address_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[is_default] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_payment]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_payment](
	[user_id] [bigint] NULL,
	[payment_id] [bigint] NULL,
	[is_default] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[variation]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variation](
	[id] [bigint] NOT NULL,
	[category_id] [bigint] NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [pk_variation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[variation_option]    Script Date: 25/04/2023 21:11:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[variation_option](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[variation_id] [bigint] NULL,
	[value] [nvarchar](255) NULL,
 CONSTRAINT [pk_variation_option] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([id], [first_address_line], [second_address_line], [postal_code], [city], [country_id]) VALUES (1, N'A Dormitory, 3/2 Streets', N'Xuan Khanh Ward, Ninh Kieu District', N'9000', N'Can Tho City', 84)
INSERT [dbo].[address] ([id], [first_address_line], [second_address_line], [postal_code], [city], [country_id]) VALUES (2, N'B Dormitory, 3/2 Street', N'Xuan Khanh Ward, Ninh Kieu District', N'9000', N'Can Tho City', 84)
INSERT [dbo].[address] ([id], [first_address_line], [second_address_line], [postal_code], [city], [country_id]) VALUES (3, N'Xuan Khanh', N'Ninh Kieu', N'9000', N'Can Tho', 84)
INSERT [dbo].[address] ([id], [first_address_line], [second_address_line], [postal_code], [city], [country_id]) VALUES (4, N'Xuan Khanh', N'Ninh Kieu', N'9000', N'Can Tho', 84)
SET IDENTITY_INSERT [dbo].[address] OFF
GO
INSERT [dbo].[country] ([id], [name]) VALUES (84, N'Viet Nam')
GO
SET IDENTITY_INSERT [dbo].[order_line] ON 

INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (1, 8, 1, 2)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (5, 5, 8, 2)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (6, 8, 8, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (7, 12, 9, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (8, 12, 10, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (9, 12, 11, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (10, 12, 12, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (11, 12, 13, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (12, 12, 14, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (13, 12, 15, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (14, 18, 16, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (16, 7, 18, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (18, 12, 20, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (22, 12, 24, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (23, 2, 25, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (25, 12, 27, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (26, 2, 28, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (27, 2, 29, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (28, 31, 30, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (29, 2, 31, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (30, 23, 32, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (31, 2, 33, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (32, 2, 34, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (33, 7, 35, 3)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (34, 12, 36, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (35, 31, 37, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (36, 23, 37, 1)
INSERT [dbo].[order_line] ([id], [product_item_id], [shop_order_id], [qty]) VALUES (37, 7, 38, 3)
SET IDENTITY_INSERT [dbo].[order_line] OFF
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 

INSERT [dbo].[order_status] ([id], [status]) VALUES (1, N'Pending')
INSERT [dbo].[order_status] ([id], [status]) VALUES (2, N'Awaiting Payment')
INSERT [dbo].[order_status] ([id], [status]) VALUES (3, N'Awaiting Fulfillment')
INSERT [dbo].[order_status] ([id], [status]) VALUES (4, N'Awaiting Shipment')
INSERT [dbo].[order_status] ([id], [status]) VALUES (5, N'Awaiting Pickup')
INSERT [dbo].[order_status] ([id], [status]) VALUES (6, N'Partially Shipping')
INSERT [dbo].[order_status] ([id], [status]) VALUES (7, N'Completed')
INSERT [dbo].[order_status] ([id], [status]) VALUES (8, N'Shipped')
INSERT [dbo].[order_status] ([id], [status]) VALUES (9, N'Canceled')
INSERT [dbo].[order_status] ([id], [status]) VALUES (10, N'Declined')
INSERT [dbo].[order_status] ([id], [status]) VALUES (11, N'Refunded')
INSERT [dbo].[order_status] ([id], [status]) VALUES (12, N'Disputed')
INSERT [dbo].[order_status] ([id], [status]) VALUES (13, N'Manual Vertification Required')
INSERT [dbo].[order_status] ([id], [status]) VALUES (14, N'Partially Refunded')
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[payment] ON 

INSERT [dbo].[payment] ([id], [name]) VALUES (1, N'Pay at home')
INSERT [dbo].[payment] ([id], [name]) VALUES (2, N'Online payment')
SET IDENTITY_INSERT [dbo].[payment] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (1, 100, N'Thiết kế êm ái- chất lượng tuyệt vời', N'Samsung Galaxy S10 AKG 3.5mm Stereo EO-IG955')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (5, 300, N'GIGABYTE Memory', N'GIGABYTE Memory')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (6, 300, N'AORUS Memory', N'AORUS Memory')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (7, 300, N'Designare Memory', N'Designare Memory')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (65, 3001, N'The best product', N'AORUS Gen5 10000 SSD')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (69, 3001, N'The best product', N'AORUS Gen4 7300 SSD')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (70, 101, N'The best product', N'AORUS K1')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (71, 101, N'The best product', N'AORUS K7')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (72, 101, N'The best product', N'AORUS K9 Optical')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (77, 100, N'The best product', N'HeadSet')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (78, 102, N'The best product', N'AORUS M4')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (79, 100, N'The best product', N'AORUS H5')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (80, 100, N'The best product', N'E1')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (81, 100, N'The best product', N'XH300')
INSERT [dbo].[product] ([id], [category_id], [description], [name]) VALUES (82, 100, N'The best product', N'XH300')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (1, NULL, N'Wired Peripherals')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (2, NULL, N'Wireless Peripherals')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (3, NULL, N'PC Component')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (4, NULL, N'Laptop Component')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (100, 1, N'Headset')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (101, 1, N'Keyboard')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (102, 1, N'Mouse')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (200, 2, N'Headset')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (201, 2, N'Keyboard')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (202, 2, N'Mouse')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (300, 3, N'RAM')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (301, 3, N'Drive')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (400, 4, N'RAM')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (401, 4, N'Drive')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (3001, 301, N'SSD')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (3002, 301, N'HDD')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (4001, 401, N'SSD')
INSERT [dbo].[product_category] ([id], [parent_category_id], [category_name]) VALUES (4002, 401, N'HDD')
GO
SET IDENTITY_INSERT [dbo].[product_configuration] ON 

INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (1, 1, 1)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (2, 10, 2)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (5, 25, 3)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (5, 35, 4)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (6, 26, 5)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (6, 35, 6)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (12, 27, 17)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (12, 41, 18)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (13, 28, 19)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (13, 36, 20)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (10, 26, 21)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (10, 38, 22)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (10, 22, 23)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (9, 26, 24)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (9, 39, 25)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (9, 22, 26)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (14, 45, 27)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (18, 45, 31)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (19, 46, 32)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (20, 46, 33)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (22, 57, 35)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (23, 11, 36)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (24, 57, 37)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (7, 26, 45)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (7, 36, 46)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (7, 22, 47)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (30, 79, 51)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (11, 26, 55)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (11, 40, 56)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (11, 22, 57)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (8, 26, 61)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (8, 37, 62)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (8, 22, 63)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (31, 1, 64)
INSERT [dbo].[product_configuration] ([product_item_id], [variation_option_id], [id]) VALUES (32, 4, 65)
SET IDENTITY_INSERT [dbo].[product_configuration] OFF
GO
SET IDENTITY_INSERT [dbo].[product_image] ON 

INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (1, N'/Images/Products/1/1/blackAKG.jpg', 1)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (2, N'/Images/Products/1/2/whiteAKG.jpg', 2)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (3, N'/Images/Products/5/5/fullbox.png', 5)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (4, N'/Images/Products/5/5/unbox.png', 5)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (5, N'/Images/Products/5/6/fullbox.png', 6)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (6, N'/Images/Products/5/6/unbox.png', 6)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (7, N'/Images/Products/6/7/fullbox.png', 7)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (8, N'/Images/Products/6/7/unbox.png', 7)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (9, N'/Images/Products/6/8/fullbox.png', 8)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (10, N'/Images/Products/6/8/unbox.png', 8)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (11, N'/Images/Products/6/9/fullbox.png', 9)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (12, N'/Images/Products/6/9/unbox.png', 9)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (13, N'/Images/Products/6/10/fullbox.png', 10)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (14, N'/Images/Products/6/10/unbox.png', 10)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (15, N'/Images/Products/6/11/fullbox.png', 11)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (16, N'/Images/Products/6/11/unbox.png', 11)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (17, N'/Images/Products/6/12/fullbox.png', 12)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (18, N'/Images/Products/6/12/unbox.png', 12)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (19, N'/Images/Products/7/13/fullbox.png', 13)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (20, N'/Images/Products/7/13/unbox.png', 13)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (21, N'/Images/Products/65/14/NewProductName1679985332201.png', 14)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (22, N'/Images/Products/65/14/NewProductName1679985340134.png', 14)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (27, N'/Images/Products/69/18/AORUSGen47300SSD1679988937858.png', 18)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (28, N'/Images/Products/69/18/AORUSGen47300SSD1679988944047.png', 18)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (29, N'/Images/Products/69/18/AORUSGen47300SSD1679988949347.png', 18)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (30, N'/Images/Products/69/19/AORUSGen47300SSD1679989011046.png', 19)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (31, N'/Images/Products/69/19/AORUSGen47300SSD1679989020639.png', 19)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (32, N'/Images/Products/69/19/AORUSGen47300SSD1679989030233.png', 19)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (35, N'/Images/Products/65/20/NewProductName1679985332201.png', 20)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (36, N'/Images/Products/65/20/NewProductName1679985340134.png', 20)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (38, N'/Images/Products/70/22/24792.png', 22)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (39, N'/Images/Products/70/22/24793.png', 22)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (40, N'/Images/Products/70/22/24797.png', 22)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (41, N'/Images/Products/70/22/24798.png', 22)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (42, N'/Images/Products/70/22/24799.png', 22)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (43, N'/Images/Products/71/23/18559.png', 23)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (44, N'/Images/Products/71/23/18150.png', 23)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (45, N'/Images/Products/71/23/17450.png', 23)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (46, N'/Images/Products/71/23/17453.png', 23)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (47, N'/Images/Products/71/23/17539.png', 23)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (48, N'/Images/Products/72/24/18856.png', 24)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (54, N'/Images/Products/78/30/21920.png', 30)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (55, N'/Images/Products/78/30/21986.png', 30)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (56, N'/Images/Products/78/30/21918.png', 30)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (57, N'/Images/Products/78/30/21914.png', 30)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (58, N'/Images/Products/79/31/18310.png', 31)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (59, N'/Images/Products/79/31/18313.png', 31)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (60, N'/Images/Products/79/31/18314.png', 31)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (61, N'/Images/Products/79/31/18315.png', 31)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (62, N'/Images/Products/79/31/18317.png', 31)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (63, N'/Images/Products/80/32/18054.png', 32)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (64, N'/Images/Products/80/32/18049.png', 32)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (65, N'/Images/Products/80/32/18050.png', 32)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (66, N'/Images/Products/80/32/18051.png', 32)
INSERT [dbo].[product_image] ([id], [url], [product_item_id]) VALUES (67, N'/Images/Products/80/32/18052.png', 32)
SET IDENTITY_INSERT [dbo].[product_image] OFF
GO
SET IDENTITY_INSERT [dbo].[product_item] ON 

INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (1, 4.9000000953674316, 3, N'TN000001', 1)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (2, 4, 2, N'TN000001', 1)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (5, 99, 5, N'TN000001', 5)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (6, 155, 10, N'TN000001', 5)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (7, 179.99000549316406, 12, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (8, 208.10000610351563, 14, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (9, 279.989990234375, 16, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (10, 290, 16, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (11, 300, 2, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (12, 499.989990234375, 0, N'TN000001', 6)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (13, 799.989990234375, 1, N'TN000001', 7)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (14, 289, 1, N'SKU00001', 65)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (18, 109.98999786376953, 2, N'SKU00001', 69)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (19, 151.11000061035156, 3, N'SKU00001', 69)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (20, 450, 3, N'SKU00001', 65)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (22, 118, 2, N'KSU00001', 70)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (23, 110.98999786376953, 0, N'KSU00001', 71)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (24, 98, 1, N'KSU00001', 72)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (30, 57.279998779296875, 4, N'KSU00001', 78)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (31, 101.43000030517578, 0, N'KSU00000', 79)
INSERT [dbo].[product_item] ([id], [price], [qty_in_stock], [sku], [product_id]) VALUES (32, 50, 2, N'KSU00001', 80)
SET IDENTITY_INSERT [dbo].[product_item] OFF
GO
SET IDENTITY_INSERT [dbo].[shop_order] ON 

INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (1, 1, CAST(N'2023-03-18' AS Date), CAST(N'2023-03-31' AS Date), 1, 416, 7, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (8, 1, CAST(N'2023-03-23' AS Date), CAST(N'2023-03-31' AS Date), 1, 406, 11, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (9, 1, CAST(N'2023-03-25' AS Date), CAST(N'2023-03-31' AS Date), 1, 500, 12, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (10, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-31' AS Date), 1, 500, 2, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (11, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-31' AS Date), 1, 500, 9, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (12, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-31' AS Date), 1, 500, 11, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (13, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-31' AS Date), 1, 499.99, 13, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (14, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-31' AS Date), 1, 499.99, 8, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (15, 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-29' AS Date), 1, 499.99, 1, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (16, 1, CAST(N'2023-03-31' AS Date), CAST(N'2023-03-31' AS Date), 1, 109.99, 7, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (18, 1, CAST(N'2023-03-31' AS Date), CAST(N'2023-04-06' AS Date), 1, 179.99, 5, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (20, 1, CAST(N'2023-04-02' AS Date), CAST(N'2023-04-04' AS Date), 1, 499.99, 13, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (24, 1, CAST(N'2023-04-03' AS Date), CAST(N'2023-04-03' AS Date), 1, 499.99, 1, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (25, 1, CAST(N'2023-04-04' AS Date), CAST(N'2023-04-04' AS Date), 1, 4, 12, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (27, 1, CAST(N'2023-04-07' AS Date), CAST(N'2023-04-07' AS Date), 1, 499.99, 1, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (28, 1, CAST(N'2023-04-07' AS Date), CAST(N'2023-04-07' AS Date), 1, 4, 1, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (29, 1, CAST(N'2023-04-07' AS Date), CAST(N'2023-04-14' AS Date), 1, 4, 10, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (30, 4, CAST(N'2023-04-14' AS Date), CAST(N'2023-04-14' AS Date), 1, 101.43, 1, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (31, 4, CAST(N'2023-04-14' AS Date), CAST(N'2023-04-14' AS Date), 1, 4, 1, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (32, 3, CAST(N'2023-04-14' AS Date), CAST(N'2023-04-14' AS Date), 2, 110.99, 8, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (33, 3, CAST(N'2023-04-14' AS Date), CAST(N'2023-04-14' AS Date), 2, 4, 1, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (34, 3, CAST(N'2023-04-14' AS Date), CAST(N'2023-04-14' AS Date), 2, 4, 1, 2)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (35, 1, CAST(N'2023-04-15' AS Date), CAST(N'2023-04-15' AS Date), 1, 179.99, 1, NULL)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (36, 4, CAST(N'2023-04-18' AS Date), CAST(N'2023-04-18' AS Date), 1, 499.99, 1, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (37, 4, CAST(N'2023-04-19' AS Date), CAST(N'2023-04-19' AS Date), 1, 212.42, 1, 1)
INSERT [dbo].[shop_order] ([id], [user_id], [order_date], [update_date], [shipping_address_id], [order_total], [order_status_id], [payment_id]) VALUES (38, 1, CAST(N'2023-04-25' AS Date), CAST(N'2023-04-25' AS Date), 1, 179.99, 1, NULL)
SET IDENTITY_INSERT [dbo].[shop_order] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping_cart] ON 

INSERT [dbo].[shopping_cart] ([id], [user_id]) VALUES (1, 1)
INSERT [dbo].[shopping_cart] ([id], [user_id]) VALUES (2, 2)
INSERT [dbo].[shopping_cart] ([id], [user_id]) VALUES (3, 3)
INSERT [dbo].[shopping_cart] ([id], [user_id]) VALUES (4, 4)
INSERT [dbo].[shopping_cart] ([id], [user_id]) VALUES (7, 8)
SET IDENTITY_INSERT [dbo].[shopping_cart] OFF
GO
INSERT [dbo].[shopping_cart_item] ([cart_id], [product_item_id], [qty]) VALUES (1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[site_user] ON 

INSERT [dbo].[site_user] ([id], [email_address], [password], [phone_number], [name]) VALUES (1, N'link@gmail.com', N'123456', N'0774039140', N'Link')
INSERT [dbo].[site_user] ([id], [email_address], [password], [phone_number], [name]) VALUES (2, N'kang@gmail.com', N'111222', N'0774039141', N'Kang')
INSERT [dbo].[site_user] ([id], [email_address], [password], [phone_number], [name]) VALUES (3, N'diep@gmail.com', N'222333', N'0784339242', N'Diep')
INSERT [dbo].[site_user] ([id], [email_address], [password], [phone_number], [name]) VALUES (4, N'duc@gmail.com', N'333444', N'0774039140', N'Duc')
INSERT [dbo].[site_user] ([id], [email_address], [password], [phone_number], [name]) VALUES (8, N'kuongchanto@gmail.com', N'12345678', N'554863814', N'Kuong Chan To')
SET IDENTITY_INSERT [dbo].[site_user] OFF
GO
INSERT [dbo].[user_address] ([address_id], [user_id], [is_default]) VALUES (1, 1, 1)
INSERT [dbo].[user_address] ([address_id], [user_id], [is_default]) VALUES (1, 4, 1)
INSERT [dbo].[user_address] ([address_id], [user_id], [is_default]) VALUES (2, 2, 1)
INSERT [dbo].[user_address] ([address_id], [user_id], [is_default]) VALUES (2, 3, 1)
INSERT [dbo].[user_address] ([address_id], [user_id], [is_default]) VALUES (4, 8, 1)
GO
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (1, 2, 1)
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (2, 1, 1)
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (3, 2, 1)
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (4, 1, 1)
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (4, 2, 0)
INSERT [dbo].[user_payment] ([user_id], [payment_id], [is_default]) VALUES (8, 1, 1)
GO
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (1, 100, N'Color')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (2, 200, N'Color')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (3, 300, N'Capacity')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (4, 300, N'Style')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (5, 300, N'Color')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (6, 400, N'Capacity')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (7, 400, N'Style')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (8, 3001, N'Capacity')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (9, 101, N'Color')
INSERT [dbo].[variation] ([id], [category_id], [name]) VALUES (10, 102, N'Color')
GO
SET IDENTITY_INSERT [dbo].[variation_option] ON 

INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (1, 1, N'Black')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (2, 1, N'Brown')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (3, 1, N'Red')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (4, 1, N'Orange')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (5, 1, N'Yellow')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (6, 1, N'Green')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (7, 1, N'Blue')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (8, 1, N'Violet')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (9, 1, N'Gray')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (10, 1, N'White')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (11, 1, N'RGB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (12, 2, N'Black')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (13, 2, N'Brown')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (14, 2, N'Red')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (15, 2, N'Orange')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (16, 2, N'Yellow')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (17, 2, N'Green')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (18, 2, N'Blue')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (19, 2, N'Violet')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (20, 2, N'Gray')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (21, 2, N'White')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (22, 5, N'RGB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (23, 3, N'2G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (24, 3, N'4G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (25, 3, N'8G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (26, 3, N'16G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (27, 3, N'32G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (28, 3, N'64G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (29, 6, N'2G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (30, 6, N'4G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (31, 6, N'8G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (32, 6, N'16G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (33, 6, N'32G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (34, 6, N'64G')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (35, 4, N'2666MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (36, 4, N'3200MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (37, 4, N'3333MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (38, 4, N'3733MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (39, 4, N'3600MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (40, 4, N'4400MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (41, 4, N'5200MHz')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (42, 8, N'128GB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (43, 8, N'256GB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (44, 8, N'512GB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (45, 8, N'1TB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (46, 8, N'2TB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (47, 9, N'Đen')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (48, 9, N'Nâu')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (49, 9, N'Đỏ')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (50, 9, N'Cam')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (51, 9, N'Vàng')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (52, 9, N'Lục')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (53, 9, N'Lam')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (54, 9, N'Tím')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (55, 9, N'Xám')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (56, 9, N'Trắng')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (57, 9, N'RGB')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (69, 10, N'Black')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (70, 10, N'Brown')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (71, 10, N'Red')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (72, 10, N'Orange')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (73, 10, N'Yellow')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (74, 10, N'Green')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (75, 10, N'Blue')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (76, 10, N'Violet')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (77, 10, N'Grey')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (78, 10, N'White')
INSERT [dbo].[variation_option] ([id], [variation_id], [value]) VALUES (79, 10, N'RGB')
SET IDENTITY_INSERT [dbo].[variation_option] OFF
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [pf_ad_coun] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [pf_ad_coun]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_pi] FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_pi]
GO
ALTER TABLE [dbo].[order_line]  WITH CHECK ADD  CONSTRAINT [fk_ol_so] FOREIGN KEY([shop_order_id])
REFERENCES [dbo].[shop_order] ([id])
GO
ALTER TABLE [dbo].[order_line] CHECK CONSTRAINT [fk_ol_so]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_pro_cat] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_pro_cat]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK5cypb0k23bovo3rn1a5jqs6j4] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK5cypb0k23bovo3rn1a5jqs6j4]
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD  CONSTRAINT [fk_parent] FOREIGN KEY([parent_category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product_category] CHECK CONSTRAINT [fk_parent]
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD  CONSTRAINT [FKh9b72s73v7cga3g5pff7xryvi] FOREIGN KEY([parent_category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[product_category] CHECK CONSTRAINT [FKh9b72s73v7cga3g5pff7xryvi]
GO
ALTER TABLE [dbo].[product_configuration]  WITH CHECK ADD  CONSTRAINT [fk_pro_conf_pro_item] FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[product_configuration] CHECK CONSTRAINT [fk_pro_conf_pro_item]
GO
ALTER TABLE [dbo].[product_configuration]  WITH CHECK ADD  CONSTRAINT [fk_pro_conf_var_op] FOREIGN KEY([variation_option_id])
REFERENCES [dbo].[variation_option] ([id])
GO
ALTER TABLE [dbo].[product_configuration] CHECK CONSTRAINT [fk_pro_conf_var_op]
GO
ALTER TABLE [dbo].[product_image]  WITH CHECK ADD  CONSTRAINT [FK7ilswwpi7ieo6hpvugpknlirg] FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[product_image] CHECK CONSTRAINT [FK7ilswwpi7ieo6hpvugpknlirg]
GO
ALTER TABLE [dbo].[product_item]  WITH CHECK ADD  CONSTRAINT [FKa9mjpi98ark8eovbtnnreygbb] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_item] CHECK CONSTRAINT [FKa9mjpi98ark8eovbtnnreygbb]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [fk_so_ad] FOREIGN KEY([shipping_address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [fk_so_ad]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [fk_so_os] FOREIGN KEY([order_status_id])
REFERENCES [dbo].[order_status] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [fk_so_os]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [fk_so_p] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [fk_so_p]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [fk_so_su] FOREIGN KEY([user_id])
REFERENCES [dbo].[site_user] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [fk_so_su]
GO
ALTER TABLE [dbo].[shop_order]  WITH CHECK ADD  CONSTRAINT [FKkxaxi8lsl27nxj7ls6hj7ku2l] FOREIGN KEY([shipping_address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[shop_order] CHECK CONSTRAINT [FKkxaxi8lsl27nxj7ls6hj7ku2l]
GO
ALTER TABLE [dbo].[shopping_cart]  WITH CHECK ADD  CONSTRAINT [fk_shc_su] FOREIGN KEY([user_id])
REFERENCES [dbo].[site_user] ([id])
GO
ALTER TABLE [dbo].[shopping_cart] CHECK CONSTRAINT [fk_shc_su]
GO
ALTER TABLE [dbo].[shopping_cart_item]  WITH CHECK ADD  CONSTRAINT [fk_shci_it] FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[shopping_cart_item] CHECK CONSTRAINT [fk_shci_it]
GO
ALTER TABLE [dbo].[shopping_cart_item]  WITH CHECK ADD  CONSTRAINT [fk_shci_shc] FOREIGN KEY([cart_id])
REFERENCES [dbo].[shopping_cart] ([id])
GO
ALTER TABLE [dbo].[shopping_cart_item] CHECK CONSTRAINT [fk_shci_shc]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [FKb94vp5jhhr5d7xc93emqv2gko] FOREIGN KEY([user_id])
REFERENCES [dbo].[site_user] ([id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [FKb94vp5jhhr5d7xc93emqv2gko]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD  CONSTRAINT [FKdaaxogn1ss81gkcsdn05wi6jp] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[user_address] CHECK CONSTRAINT [FKdaaxogn1ss81gkcsdn05wi6jp]
GO
ALTER TABLE [dbo].[user_payment]  WITH CHECK ADD  CONSTRAINT [fk_user_pay_p] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment] ([id])
GO
ALTER TABLE [dbo].[user_payment] CHECK CONSTRAINT [fk_user_pay_p]
GO
ALTER TABLE [dbo].[user_payment]  WITH CHECK ADD  CONSTRAINT [fk_user_pay_u] FOREIGN KEY([user_id])
REFERENCES [dbo].[site_user] ([id])
GO
ALTER TABLE [dbo].[user_payment] CHECK CONSTRAINT [fk_user_pay_u]
GO
ALTER TABLE [dbo].[variation]  WITH CHECK ADD  CONSTRAINT [fk_var_cat] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [fk_var_cat]
GO
ALTER TABLE [dbo].[variation]  WITH CHECK ADD  CONSTRAINT [FKpfb6yow7uvvugoe8oao2cal11] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_category] ([id])
GO
ALTER TABLE [dbo].[variation] CHECK CONSTRAINT [FKpfb6yow7uvvugoe8oao2cal11]
GO
ALTER TABLE [dbo].[variation_option]  WITH CHECK ADD  CONSTRAINT [fk_var_op] FOREIGN KEY([variation_id])
REFERENCES [dbo].[variation] ([id])
GO
ALTER TABLE [dbo].[variation_option] CHECK CONSTRAINT [fk_var_op]
GO
USE [master]
GO
ALTER DATABASE [ecommercedb] SET  READ_WRITE 
GO
