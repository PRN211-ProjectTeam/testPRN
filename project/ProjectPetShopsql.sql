USE [master]
GO
/****** Object:  Database [Project]    Script Date: 7/26/2023 12:00:35 AM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CustomerID] [nchar](10) NULL,
	[EmployeeID] [nchar](10) NULL,
	[Role] [int] NULL,
	[IsActive] [bit] NULL,
	[ShipperId] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogDetails]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogDetails](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Heading] [nvarchar](1000) NULL,
	[PageTitle] [nvarchar](1000) NULL,
	[ShortDescription] [nvarchar](1000) NULL,
	[FeaturedImageURL] [nvarchar](1000) NULL,
	[PublishedDate] [datetime] NULL,
 CONSTRAINT [PK_BlogDetails] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [nchar](200) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](10) NOT NULL,
	[CreateDate] [date] NULL,
	[Phone] [nchar](10) NULL,
	[Name] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[Province] [nvarchar](max) NULL,
	[Wards] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[DepartmentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [nchar](10) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NULL,
	[DepartmentID] [int] NULL,
	[Title] [nvarchar](30) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nvarchar](60) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Order Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](10) NOT NULL,
	[EmployeeID] [nchar](10) NULL,
	[OrderDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[OrderStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture_Products]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture_Products](
	[ProductId] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
 CONSTRAINT [PK_Picture_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PictureGallery]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureGallery](
	[PicId] [int] NOT NULL,
	[Id] [int] NULL,
	[Caption] [nvarchar](50) NULL,
	[Picture] [nchar](200) NULL,
 CONSTRAINT [PK_PictureGallery] PRIMARY KEY CLUSTERED 
(
	[PicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PictureProducts]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureProducts](
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
	[Picture] [nchar](200) NULL,
 CONSTRAINT [PK_PictureProducts] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [money] NULL,
	[Discontinued] [bit] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [bit] NOT NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reason_Cancel]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reason_Cancel](
	[ReasonId] [int] NOT NULL,
	[OrderID] [int] NULL,
	[Reason] [nvarchar](max) NULL,
	[StatusCancel] [tinyint] NOT NULL,
 CONSTRAINT [PK_Reason_Cancel] PRIMARY KEY CLUSTERED 
(
	[ReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[ShipId] [int] IDENTITY(1,1) NOT NULL,
	[ShipAddress] [nvarchar](max) NULL,
	[ShipCity] [nvarchar](max) NULL,
	[ShipContact] [nvarchar](30) NULL,
	[Freight] [money] NULL,
	[ShipperId] [int] NULL,
	[OrderID] [int] NULL,
	[PhoneContact] [nchar](10) NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 7/26/2023 12:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NULL,
	[Phone] [nchar](10) NULL,
	[District] [nvarchar](60) NULL,
	[Province] [nvarchar](60) NULL,
	[Wards] [nvarchar](60) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1, N'admin@gmail.com', N'12345678', NULL, N'Emp01     ', 1, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (2, N'cus01@gmail.com', N'Linhhihi123@', N'Cus01     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (3, N'shipper@gmail.com', N'12345678', NULL, NULL, 3, 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1003, N'shipper02@gmail.com', N'12345678', NULL, NULL, 3, 1, 2)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1004, N'cus02@gmail.com', N'12345678', N'Cus02     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1005, N'shipper003@gmail.com', N'12345678', NULL, NULL, 3, 1, 3)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1016, N'Cus012@gmail.com', N'HOhN&M&RK6', N'T5HBZMZ7XU', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1017, N'Cus02@gmail.com', N'12345678', N'Cus02     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1018, N'Cus03@gmail.com', N'12345678', N'Cus03     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1019, N'Cus04@gmail.com', N'12345678', N'Cus04     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1020, N'Cus05@gmail.com', N'12345678', N'Cus05     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1021, N'Cus06@gmail.com', N'12345678', N'Cus06     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1022, N'Cus07@gmail.com', N'12345678', N'Cus07     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1023, N'Cus08@gmail,com', N'12345678', N'Cus08     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1024, N'Cus09@gmai.com', N'12345678', N'Cus09     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1025, N'Cus10@gmail.com', N'12345678', N'Cus10     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1026, N'Cus11@gmail.com', N'12345678', N'Cus11     ', NULL, 2, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive], [ShipperId]) VALUES (1027, N'linhnguyen2772001@gmail.com', N'Linhhihi123@', N'ASNGQWX4TX', NULL, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogDetails] ON 

INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (7, N'<p>1. Top c&aacute;c loại gel dinh dưỡng tốt nhất hiện nay<br>A. Nutriplus Gel Virbac<br>Đặc điểm sản phẩm: Nutriplus Gel Virbac l&agrave; một sản phẩm dinh dưỡng cao cấp chứa nhiều vitamin, kho&aacute;ng chất v&agrave; c&aacute;c chất bổ sung kh&aacute;c. Sản phẩm c&oacute; kết cấu dạng gel, dễ sử dụng.<br>Ứng dụng v&agrave; c&ocirc;ng dụng: Hỗ trợ tăng c&acirc;n, phục hồi sức khỏe sau bệnh, bổ sung năng lượng cho ch&oacute; m&egrave;o trong qu&aacute; tr&igrave;nh tập luyện hoặc mang thai.<br>Đ&aacute;nh gi&aacute;: Nutriplus Gel Virbac được đ&aacute;nh gi&aacute; cao về chất lượng v&agrave; hiệu quả sử dụng.<br>Gel dinh dưỡng ch&oacute; m&egrave;o Nutriplus Gel Virbac<br>Gel dinh dưỡng ch&oacute; m&egrave;o Nutriplus Gel Virbac<br>B. Felovite II<br>Đặc điểm sản phẩm: Felovite II l&agrave; gel dinh dưỡng chứa vitamin, kho&aacute;ng chất v&agrave; taurine, đặc biệt ph&ugrave; hợp cho m&egrave;o.<br>Ứng dụng v&agrave; c&ocirc;ng dụng: Gi&uacute;p bổ sung năng lượng, hỗ trợ hệ ti&ecirc;u h&oacute;a v&agrave; tăng cường hệ miễn dịch cho m&egrave;o.<br>Đ&aacute;nh gi&aacute;: Felovite II được đ&aacute;nh gi&aacute; l&agrave; sản phẩm hiệu quả, gi&aacute; cả hợp l&yacute;.<br>C. Calo-Pet Gel<br>Đặc điểm sản phẩm: Calo-Pet Gel l&agrave; sản phẩm dinh dưỡng cao cấp với nhiều vitamin v&agrave; kho&aacute;ng chất cần thiết.<br>Ứng dụng v&agrave; c&ocirc;ng dụng: Hỗ trợ tăng c&acirc;n, phục hồi nhanh ch&oacute;ng sau bệnh v&agrave; n&acirc;ng cao sức khỏe tổng thể.<br>Đ&aacute;nh gi&aacute;: Calo-Pet Gel l&agrave; lựa chọn tốt cho ch&oacute; m&egrave;o cần bổ sung dinh dưỡng.<br>D. GNC Pets Ultra Mega High Calorie Booster<br>Đặc điểm sản phẩm: GNC Pets Ultra Mega High Calorie Booster l&agrave; gel dinh dưỡng chứa nhiều calo, vitamin v&agrave; kho&aacute;ng chất.<br>Ứng dụng v&agrave; c&ocirc;ng dụng: Gi&uacute;p ch&oacute; m&egrave;o tăng c&acirc;n nhanh ch&oacute;ng, phục hồi sức khỏe v&agrave; duy tr&igrave; năng lượng.<br>Đ&aacute;nh gi&aacute;: Sản phẩm được đ&aacute;nh gi&aacute; cao về chất lượng v&agrave; hiệu quả sử dụng, ph&ugrave; hợp cho ch&oacute; m&egrave;o cần tăng c&acirc;n nhanh ch&oacute;ng.<br>E. Tomlyn Nutri-Cal<br>Đặc điểm sản phẩm: Tomlyn Nutri-Cal l&agrave; gel dinh dưỡng gi&agrave;u calo, vitamin v&agrave; kho&aacute;ng chất, đặc biệt ph&ugrave; hợp cho ch&oacute; v&agrave; m&egrave;o.<br>Ứng dụng v&agrave; c&ocirc;ng dụng: Hỗ trợ tăng c&acirc;n, phục hồi sức khỏe sau bệnh, cung cấp năng lượng cho ch&oacute; m&egrave;o trong qu&aacute; tr&igrave;nh tập luyện hoặc mang thai.<br>Đ&aacute;nh gi&aacute;: Tomlyn Nutri-Cal được đ&aacute;nh gi&aacute; cao về chất lượng v&agrave; hiệu quả sử dụng, l&agrave; lựa chọn tốt cho ch&oacute; m&egrave;o cần bổ sung dinh dưỡng.<br>II. Hướng dẫn c&aacute;ch sử dụng gel dinh dưỡng cho ch&oacute;<br>A. T&igrave;m hiểu về nhu cầu dinh dưỡng của ch&oacute;<br>Tuổi, giới t&iacute;nh, trọng lượng v&agrave; đặc điểm sức khỏe: Cần t&igrave;m hiểu về c&aacute;c yếu tố n&agrave;y để x&aacute;c định nhu cầu dinh dưỡng ph&ugrave; hợp cho ch&oacute;.<br>Chế độ dinh dưỡng ph&ugrave; hợp: Từ những th&ocirc;ng tin tr&ecirc;n, x&aacute;c định chế độ dinh dưỡng ph&ugrave; hợp cho ch&oacute;, bao gồm cả việc sử dụng gel dinh dưỡng. Trước khi chọn gel dinh dưỡng cho ch&oacute;, h&atilde;y đảm bảo rằng bạn đ&atilde; t&igrave;m hiểu kỹ về c&aacute;ch chọn thức ăn cho ch&oacute; để cung cấp một chế độ dinh dưỡng đầy đủ cho th&uacute; cưng của bạn<br>x&aacute;c định chế độ dinh dưỡng ph&ugrave; hợp cho ch&oacute;, bao gồm cả việc sử dụng gel dinh dưỡng.<br>x&aacute;c định chế độ dinh dưỡng ph&ugrave; hợp cho ch&oacute;, bao gồm cả việc sử dụng gel dinh dưỡng.<br>B. C&aacute;ch sử dụng gel dinh dưỡng<br>Liều lượng v&agrave; tần suất sử dụng: Tham khảo hướng dẫn tr&ecirc;n bao b&igrave; sản phẩm hoặc tư vấn từ b&aacute;c sĩ th&uacute; y để x&aacute;c định liều lượng v&agrave; tần suất sử dụng ph&ugrave; hợp cho ch&oacute;.<br>C&aacute;ch cho ch&oacute; ăn gel dinh dưỡng: C&oacute; thể cho ch&oacute; liếm trực tiếp từ ống gel, hoặc trộn gel dinh dưỡng v&agrave;o thức ăn.<br>Lưu &yacute; khi sử dụng gel dinh dưỡng: Cần kiểm tra hạn sử dụng của sản phẩm, kh&ocirc;ng sử dụng sản phẩm qu&aacute; hạn hoặc bị hỏng.<br>III. Mua gel dinh dưỡng ở đ&acirc;u?<br>A. C&aacute;c cửa h&agrave;ng th&uacute; cưng uy t&iacute;n<br>Si&ecirc;u Pet<br>Website: https://sieupet.com<br>Ưu điểm: Đa dạng sản phẩm, chất lượng đảm bảo, tư vấn chuy&ecirc;n nghiệp<br>FamiPet<br>Website: https://famipet.vn<br>Ưu điểm: Gi&aacute; cả hợp l&yacute;, sản phẩm nhập khẩu ch&iacute;nh h&atilde;ng, ch&iacute;nh s&aacute;ch hậu m&atilde;i tốt<br>iPet Shop<br>Website: https://ipetshop.vn<br>Ưu điểm: Phục vụ tận t&igrave;nh, sản phẩm đa dạng, giao h&agrave;ng nhanh ch&oacute;ng</p>
<p>B. Mua h&agrave;ng trực tuyến<br>Shopee<br>Website: https://shopee.vn<br>Ưu điểm: Mua h&agrave;ng tiện lợi, gi&aacute; cả cạnh tranh, nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i<br>V&iacute; dụ sản phẩm: Nutriplus Gel Virbac &ndash; https://shopee.vn/Nutriplus-Gel-Virbac-i.123456.789012<br>Lazada<br>Website: https://www.lazada.vn<br>Ưu điểm: Đa dạng sản phẩm, ch&iacute;nh s&aacute;ch đổi trả linh hoạt, giao h&agrave;ng nhanh ch&oacute;ng<br>V&iacute; dụ sản phẩm: Felovite II &ndash; https://www.lazada.vn/Felovite-II-i.987654.321098<br>Tiki<br>Website: https://tiki.vn<br>Ưu điểm: Sản phẩm chất lượng, ch&iacute;nh s&aacute;ch bảo h&agrave;nh tốt, hỗ trợ kh&aacute;ch h&agrave;ng nhiệt t&igrave;nh<br>V&iacute; dụ sản phẩm: Tomlyn Nutri-Cal &ndash; https://tiki.vn/Tomlyn-Nutri-Cal-i.369852.741036<br>IV. Kết luận<br>Việc sử dụng gel dinh dưỡng cho ch&oacute; m&egrave;o đ&oacute;ng vai tr&ograve; quan trọng trong việc cải thiện sức khỏe, ph&aacute;t triển to&agrave;n diện của th&uacute; cưng. Bạn n&ecirc;n lựa chọn c&aacute;c sản phẩm từ c&aacute;c địa chỉ uy t&iacute;n v&agrave; ch&iacute;nh h&atilde;ng để đảm bảo chất lượng. Đồng thời, h&atilde;y tham khảo &yacute; kiến của b&aacute;c sĩ th&uacute; y để x&aacute;c định nhu cầu dinh dưỡng ph&ugrave; hợp v&agrave; c&aacute;ch sử dụng gel dinh dưỡng đ&uacute;ng c&aacute;ch cho ch&oacute; m&egrave;o của bạn.</p>
<p>Để đảm bảo sức khỏe tốt cho ch&oacute;, h&atilde;y tham khảo những lưu &yacute; khi chăm s&oacute;c sức khỏe cho ch&oacute; v&agrave; &aacute;p dụng ch&uacute;ng v&agrave;o qu&aacute; tr&igrave;nh chăm s&oacute;c th&uacute; cưng của bạn.</p>
<p>Khi mua gel dinh dưỡng, bạn c&oacute; thể tham khảo c&aacute;c ti&ecirc;u ch&iacute; sau để đưa ra quyết định:<br>Thương hiệu: Chọn c&aacute;c thương hiệu uy t&iacute;n v&agrave; ch&iacute;nh h&atilde;ng như Nutriplus Gel Virbac, Felovite II, Tomlyn Nutri-Cal, GNC Pets Ultra Mega High Calorie Booster, Calo-Pet Gel.<br>Gi&aacute; cả: So s&aacute;nh gi&aacute; cả của sản phẩm tại c&aacute;c địa chỉ b&aacute;n h&agrave;ng kh&aacute;c nhau, đồng thời lưu &yacute; tới c&aacute;c chương tr&igrave;nh khuyến m&atilde;i, ưu đ&atilde;i.<br>Đ&aacute;nh gi&aacute; của người d&ugrave;ng: Đọc c&aacute;c đ&aacute;nh gi&aacute;, b&igrave;nh luận của người d&ugrave;ng trước đ&oacute; để hiểu r&otilde; hơn về chất lượng v&agrave; hiệu quả sử dụng của sản phẩm.<br>Hạn sử dụng: Kiểm tra hạn sử dụng của sản phẩm trước khi mua để đảm bảo an to&agrave;n cho th&uacute; cưng của bạn.<br>Hỗ trợ tư vấn: Nếu kh&ocirc;ng chắc chắn về sản phẩm n&agrave;o ph&ugrave; hợp, bạn c&oacute; thể t&igrave;m kiếm sự tư vấn từ c&aacute;c chuy&ecirc;n gia hoặc b&aacute;c sĩ th&uacute; y để đưa ra lựa chọn ph&ugrave; hợp nhất.<br>Cuối c&ugrave;ng, việc chăm s&oacute;c sức khỏe v&agrave; dinh dưỡng cho ch&oacute; m&egrave;o l&agrave; một qu&aacute; tr&igrave;nh d&agrave;i hơi, n&ecirc;n h&atilde;y ki&ecirc;n nhẫn v&agrave; ch&uacute; &yacute; theo d&otilde;i sự thay đổi của th&uacute; cưng để điều chỉnh chế độ dinh dưỡng khi cần thiết.</p>
<p>Ch&uacute;c bạn v&agrave; th&uacute; cưng của m&igrave;nh lu&ocirc;n khỏe mạnh v&agrave; hạnh ph&uacute;c!</p>', N'Gel Dinh Dưỡng Cho Chó Mèo: Tìm Hiểu, Lựa Chọn & Sử Dụng', N'Gel Dinh Dưỡng Cho Chó Mèo: Tìm Hiểu, Lựa Chọn & Sử Dụng', N'Gel dinh dưỡng cho chó mèo là một sản phẩm quan trọng trong việc bổ sung năng lượng, vitamin và khoáng chất cho thú cưng của bạn. Việc sử dụng gel dinh dưỡng giúp cải thiện sức khỏe, phát triển cơ bắp, hỗ trợ hệ tiêu hóa và tăng cường hệ miễn dịch cho chó mèo.', N'/img/gel-dinh-duong-cho-meo.jpeg', CAST(N'2023-07-21T11:03:27.900' AS DateTime))
INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (8, N'<div class="entry-content">
<h2><span id="Cho_pug_gia_chung_hien_nay_la_bao_nhieu"><strong>Ch&oacute; pug gi&aacute; chung hiện nay l&agrave; bao nhi&ecirc;u?</strong></span></h2>
<p>Ch&oacute; Pug con gi&aacute; bao nhi&ecirc;u? Trước hết, ch&uacute;ng ta cần phải nắm được mức gi&aacute; ch&oacute; mặt xệ bao nhi&ecirc;u tiền? Bởi v&igrave; chỉ khi t&igrave;m hiểu được ch&oacute; Pug gi&aacute; bao nhi&ecirc;u đ&uacute;ng th&igrave; mới c&oacute; thể tr&aacute;nh việc mua phải những ch&uacute; ch&oacute; sức khỏe k&eacute;m hoặc l&agrave; kh&ocirc;ng đảm bảo.</p>
<p><img class="alignnone wp-image-1813 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/co-nen-mua-cho-pug-gia-500k-200k-hay-khong-1.jpg" alt="" width="600" height="338" data-ll-status="loaded"></p>
<p><strong><em>Bảng gi&aacute; chung của ch&oacute; Pug hiện nay</em></strong></p>
<div class="code-block code-block-6">&nbsp;</div>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div>
<table>
<tbody>
<tr>
<td><strong>Gi&aacute; ch&oacute;</strong></td>
<td><strong>Th&ocirc;ng tin ch&oacute;</strong></td>
</tr>
<tr>
<td>500.000 &ndash; 1 triệu</td>
<td>
<ul>
<li>90% l&agrave; lừa đảo</li>
<li>Ch&oacute; Ngoại h&igrave;nh kh&ocirc;ng đẹp như quảng c&aacute;o</li>
</ul>
</td>
</tr>
<tr>
<td>6-8 triệu</td>
<td>
<ul>
<li>L&agrave; ch&oacute; Pug thuần chủng sinh ra trong nước</li>
<li>C&oacute; sức khỏe ổn định</li>
<li>Loại n&agrave;y kh&ocirc;ng c&oacute; bất kỳ giấy tờ g&igrave; cả, 80% c&aacute;c b&eacute; Pug sinh ra tại Việt Nam đều kh&ocirc;ng c&oacute; giấy tờ</li>
<li>Ngoại h&igrave;nh xuất sắc, t&iacute;nh c&aacute;ch nổi trội, ph&ugrave; hợp chọn l&agrave;m ch&oacute; giống ( 8 triệu)</li>
</ul>
</td>
</tr>
<tr>
<td>10-12 triệu</td>
<td>
<ul>
<li>L&agrave; d&ograve;ng ch&oacute; Pug thuần chủng, d&ograve;ng trung, được sinh ra tại Việt Nam.</li>
<li>Gia phả + chứng nhận của VKA (<em>Vietnam Kennel Association</em>&nbsp;&ndash; Hiệp hội ch&oacute; giống Việt Nam</li>
<li>Ch&oacute; Pug gi&aacute; n&agrave;y được đảm bảo tuyệt đối về chất lượng v&agrave; độ thuần chủng</li>
</ul>
</td>
</tr>
<tr>
<td>12 &ndash; 15 triệu</td>
<td>
<ul>
<li>Ch&oacute; Pug được nhập khẩu từ c&aacute;c trại ch&oacute; Th&aacute;i Lan</li>
<li>Ch&oacute; Pug n&agrave;y tốt hơn một ch&uacute;t so với ch&oacute; nh&acirc;n giống trong nước.</li>
<li>Ch&oacute; c&oacute; kh&ocirc;ng giấy tờ chứng nhận, khai sinh. Nhưng đảm bảo về chất lượng v&agrave; ngoại h&igrave;nh đạt ti&ecirc;u chuẩn.</li>
</ul>
</td>
</tr>
<tr>
<td>18-25 triệu</td>
<td>
<ul>
<li>Pug nhập Th&aacute;i Lan</li>
<li>Đầy đủ giấy tờ của FCI Th&aacute;i</li>
<li>Những ch&uacute; ch&oacute; n&agrave;y thường được c&aacute;c trại ch&oacute; nhập khẩu về để nh&acirc;n giống</li>
</ul>
</td>
</tr>
<tr>
<td>42 &ndash; 60 triệu trở l&ecirc;n</td>
<td>
<ul>
<li>Pug được nhập khẩu trực tiếp từ Ch&acirc;u &Acirc;u</li>
<li>Được đảm bảo 100% về độ thuần chủng</li>
<li>Ch&oacute; c&oacute; giấy tờ, nguồn gốc r&otilde; r&agrave;ng</li>
<li>Hơn nữa, ch&oacute; đ&atilde; từng đi thi đấu, tham gia nhiều cuộc thi v&agrave; nhận được nhiều giải thưởng.</li>
<li>Gi&aacute; sẽ c&ograve;n cao hơn nếu ch&uacute; ch&oacute; Pug đ&oacute; c&oacute; giấy chứng nhận của FCI &ndash; Hiệp hội ch&oacute; giống Thế Giới.</li>
</ul>
</td>
</tr>
</tbody>
</table>
</div>
<figcaption></figcaption>
</figure>
<p>Tin tức thị trường:</p>
<p>Hiện nay, với&nbsp;<a href="https://blogchomeo.com/tag/pug/">Pug</a>&nbsp;kh&ocirc;ng c&oacute; giấy tờ, nhưng được ti&ecirc;m ph&ograve;ng đầy đủ c&oacute; mức gi&aacute; giao động l&agrave; 5,5, triệu đối với b&eacute; c&uacute;n 2 th&aacute;ng tuổi. Với những b&eacute; c&oacute; giấy tờ VKA đầy đủ th&igrave; mức gi&aacute; giao động trong khoảng từ 13 đến 15 triệu/ b&eacute; thuần chủng 100%, bao gồm đầy đủ xuất xứ v&agrave; được c&ocirc;ng nhận bởi Hiệp hội những người nu&ocirc;i ch&oacute; giống Việt Nam.</p>
<p>Tuy nhi&ecirc;n, mức gi&aacute; con phụ thuộc nhiều v&agrave;o m&agrave;u l&ocirc;ng, gia phả, h&igrave;nh d&aacute;ng của b&eacute; nữa.</p>
<div class="code-block code-block-6">&nbsp;</div>
<h2><span id="Cho_pug_gia_500k_su_that_hay_lua_dao"><strong>Ch&oacute; pug gi&aacute; 500k: sự thật hay lừa đảo?</strong></span></h2>
<p>Xin khẳng định với c&aacute;c bạn rằng, nếu muốn mua được 1 b&eacute; Pug thuần chủng tốt th&igrave; bạn phải bỏ ra &iacute;t nhất l&agrave; 5 triệu v&agrave; tin tức tr&ecirc;n c&aacute;c trang mạng b&aacute;n vặt, b&aacute;n h&agrave;ng dạo&nbsp;<em>ch&oacute; Pug gi&aacute; 500k</em>, thậm ch&iacute; c&ograve;n c&oacute; tin b&aacute;n ch&oacute; Pug 200k th&igrave; chắc chắn rằng đ&acirc;y l&agrave; tin tức lừa đảo.</p>
<p><img class="alignnone wp-image-1814 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/images.jpg" sizes="(max-width: 368px) 100vw, 368px" srcset="https://blogchomeo.com/wp-content/uploads/2021/07/images.jpg 225w, https://blogchomeo.com/wp-content/uploads/2021/07/images-150x150.jpg 150w" alt="" width="368" height="368" data-ll-status="loaded"></p>
<p><a href="https://blogchomeo.com/co-nen-mua-cho-pug-gia-500k-200k-hay-khong/"><em>Ch&oacute; pug gi&aacute; 500k &ndash; tin tức lừa đảo</em></a></p>
<div class="code-block code-block-6">&nbsp;</div>
<p>Đ&oacute; chỉ l&agrave; h&igrave;nh thức c&acirc;u kh&aacute;ch đặt cọc sau đ&oacute; chặn số v&agrave; kh&ocirc;ng c&ograve;n tin tức n&agrave;o nữa, hoặc cũng c&oacute; 1 số trường hợp cung cấp ch&oacute; Pug gi&aacute; 500k tuy nhi&ecirc;n l&agrave; ch&oacute; bệnh, nhập lậu,&hellip; V&igrave; thế, h&atilde;y cảnh gi&aacute;c để tr&aacute;nh kh&ocirc;ng bị d&iacute;nh c&acirc;u mắc lừa bởi những tin tức như thế n&agrave;y nh&eacute;!</p>
<h2><span id="Hien_nay_cho_pug_thuan_chung_gia_bao_nhieu"><strong>Hiện nay ch&oacute; pug thuần chủng gi&aacute; bao nhi&ecirc;u?&nbsp;</strong></span></h2>
<p>Nhu cầu mua ch&oacute; Pug hiện nay rất nhiều tuy nhi&ecirc;n giống ch&oacute; n&agrave;y sinh sản kh&aacute; k&eacute;m v&agrave; mức gi&aacute; cũng phụ thuộc v&agrave;o rất nhiều yếu tố kh&aacute;c nhau. Vậy, ch&oacute; Pug thuần chủng gi&aacute; bao nhi&ecirc;u, ch&oacute; Pug mini gi&aacute; đ&uacute;ng ch&iacute;nh x&aacute;c l&agrave; bao nhi&ecirc;u? Dưới đ&acirc;y l&agrave; một số th&ocirc;ng tin gi&aacute; ch&oacute; Pug thuần chủng bạn n&ecirc;n biết:</p>
<p><img class="wp-image-100 aligncenter lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/pug-dog-isolated-white-background.jpg" alt="" width="600" height="575" data-ll-status="loaded"></p>
<div class="code-block code-block-6">&nbsp;</div>
<p><em>Gi&aacute; ch&oacute; Pug thuần chủng</em></p>
<h3><span id="Cho_pug_thuan_chung_sinh_trong_nuoc"><strong>Ch&oacute; pug thuần chủng sinh trong nước</strong></span></h3>
<p>Giống ch&oacute; pug bao nhi&ecirc;u tiền 1 con khi sinh trong nước? Ch&oacute; Pug thuần chủng được sinh tại c&aacute;c trại giống th&uacute; cưng trong nước c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, c&oacute; x&aacute;c minh th&ocirc;ng tin chủ sở hữu nhưng kh&ocirc;ng c&oacute; giấy chứng nhận VKA th&igrave; mức gi&aacute; giao động trong khoảng 6 đến 8 triệu đồng. Đối với những b&eacute; c&oacute; gi&aacute; 8 triệu sẽ l&agrave; c&aacute;c b&eacute; sở hữu ngoại h&igrave;nh mập mạp v&agrave; xinh xắn. V&agrave; đương nhi&ecirc;n ch&oacute; Pug gi&aacute; 1tr l&agrave; 1 điều kh&ocirc;ng thể c&oacute; được.</p>
<h3><span id="Cho_pug_co_day_du_giay_to_VKA"><strong>Ch&oacute; pug c&oacute; đầy đủ giấy tờ VKA</strong></span></h3>
<p>Với những b&eacute; ch&oacute; mặt xệ con gi&aacute; bao nhi&ecirc;u khi c&oacute; giấy tờ đầy đủ? Gi&aacute; 1 con ch&oacute; Pug c&oacute; đầy đủ giấy tờ VKA th&igrave; mức gi&aacute; giao động trong khoảng từ 10 đến 15 triệu. V&agrave; đ&acirc;y l&agrave; một trong những b&eacute; c&oacute; gia phả r&otilde; r&agrave;ng, hệ gen ổn định, đảm bảo thuần chủng 100%. Vậy, tin tức ch&oacute; Pug gi&aacute; 1 triệu, ch&oacute; Pug gi&aacute; 2 triệu, ch&oacute; Pug gi&aacute; 3 triệu chắc chắn l&agrave; kh&ocirc;ng thể tin được đ&uacute;ng kh&ocirc;ng n&agrave;o?</p>
<div class="code-block code-block-6">&nbsp;</div>
<h3><span id="Gia_cho_pug_nhap_khau"><strong>Gi&aacute; ch&oacute; pug&nbsp; nhập khẩu</strong></span></h3>
<p>Ch&oacute; Pug mini gi&aacute; bao nhi&ecirc;u nếu l&agrave; giống nhập khẩu? Gi&aacute; ch&oacute; Pug dog nhập khẩu phụ thuộc v&agrave;o quốc gia xuất xứ của b&eacute;. Ch&oacute; mặt xệ bao nhi&ecirc;u tiền một con nhập khẩu? Cụ thể như sau:</p>
<p><img class="alignnone size-full wp-image-300 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/giong-cho-pug.jpg" alt="" width="622" height="419" data-ll-status="loaded"></p>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div>&nbsp;</div>
<figcaption><em>Ch&oacute; Pug nhập khẩu đẹp</em></figcaption>
</figure>
<ul role="list">
<li>Với những b&eacute; được nhập khẩu từ Th&aacute;i Lan mức gi&aacute; sẽ giao động khoảng 10 đến 15 triệu với những b&eacute; kh&ocirc;ng c&oacute; giấy tờ v&agrave; với những b&eacute; sở hữu đầy đủ giấy từ FCI Th&aacute;i mức gi&aacute; nằm trong khoảng 15 đến 20 triệu.</li>
<li>Ch&oacute; Pug gi&aacute; bao nhi&ecirc;u nếu nhập khẩu từ Ch&acirc;u &Acirc;u? Những b&eacute; nhập khẩu từ Ch&acirc;u &Acirc;u c&oacute; giấy tờ đầy đủ, đảm bảo l&agrave; h&agrave;ng được c&aacute;c sen săn đ&oacute;n rất nhiều. Với những b&eacute; Pug n&agrave;y, mức gi&aacute; trong khoảng 2000$-2500$.</li>
</ul>
<h2><span id="Nhung_dieu_quan_trong_khi_mua_cho_pug_ban_can_biet"><strong>Những điều quan trọng khi mua ch&oacute; pug bạn cần biết</strong></span></h2>
<p>Để sở hữu được b&eacute; Pug thuần chủng gi&aacute; tốt, v&agrave; tr&aacute;nh việc mua ch&oacute; Pug gi&aacute; rẻ lừa đảo như loại ch&oacute; pug gi&aacute; 1 triệu hay ch&oacute; Pug gi&aacute; 300k c&aacute;c sen cần lưu &yacute; một số vấn đề sau đ&acirc;y:</p>
<div class="code-block code-block-6">&nbsp;</div>
<h3><span id="Thoi_gian_bao_hanh"><strong>Thời gian bảo h&agrave;nh</strong></span></h3>
<p>Thời gian bảo h&agrave;nh tốt nhất với 1 b&eacute; Pug l&agrave; 70 đến 75 ng&agrave;y. Thường th&igrave; mức thời gian bảo h&agrave;nh với c&aacute;c giống ch&oacute; th&ocirc;ng thường l&agrave; 45 ng&agrave;y. Tuy nhi&ecirc;n Pug l&agrave; giống ch&oacute; c&oacute; sức đề kh&aacute;ng yếu hơn ch&iacute;nh v&igrave; thế m&agrave; thời gian bảo h&agrave;nh cao hơn gần gấp đ&ocirc;i so với những giống ch&oacute; th&ocirc;ng thường kh&aacute;c.</p>
<h3><span id="Giay_to_di_kem_kia_mua_cho_pug"><strong>Giấy tờ đi k&egrave;m kia mua ch&oacute; pug</strong></span></h3>
<p>H&atilde;y đảm bảo mua b&eacute; c&uacute;n của bạn với giấy tờ đi k&egrave;m đầy đủ. Bởi đ&oacute; ch&iacute;nh l&agrave; chứng cứ minh chứng bạn đ&atilde; mua v&agrave; bảo h&agrave;nh đ&uacute;ng thời hạn. Bạn tuyệt đối kh&ocirc;ng mua Pug nếu kh&ocirc;ng c&oacute; giấy tờ r&otilde; r&agrave;ng.</p>
<h3><span id="Nen_mua_cho_pug_tu_may_thang_tuoi"><strong>N&ecirc;n mua ch&oacute;&nbsp; pug từ mấy th&aacute;ng tuổi</strong></span></h3>
<p>Bạn n&ecirc;n mua những b&eacute; Pug 2 th&aacute;ng tuổi l&agrave; tốt nhất. V&igrave; ở độ tuổi n&agrave;y, b&eacute; mới được t&aacute;ch khỏi mẹ v&igrave; thế bạn l&agrave; chủ sở hữu đầu ti&ecirc;n v&agrave; t&igrave;nh cảm d&agrave;nh cho b&eacute; cũng như ngược lại sẽ r&otilde; r&agrave;ng v&agrave; th&acirc;n thiết hơn.</p>
<p><img class="alignnone wp-image-327 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/cham-soc-cho-pug-6.jpg" alt="" width="619" height="464" data-ll-status="loaded"></p>
<p>Kh&ocirc;ng những thế, những b&eacute; pug 2 th&aacute;ng tuổi đ&atilde; c&oacute; hệ ti&ecirc;u h&oacute;a ph&aacute;t triển tốt đồng thời được ti&ecirc;m ph&ograve;ng đầy đủ sẽ tr&aacute;nh bệnh v&agrave; c&oacute; thể ph&aacute;t triển tốt hơn rất nhiều.</p>
<h2><span id="Canh_giac_khi_mua_cho_pug_gia_re"><strong>Cảnh gi&aacute;c khi mua ch&oacute; pug gi&aacute; rẻ</strong></span></h2>
<p>Tr&ecirc;n c&aacute;c trang rao b&aacute;n vặt chắc chắn rằng tin tức b&aacute;n ch&oacute; Pug với gi&aacute; dưới&nbsp; 1 triệu -ch&oacute; Pug gi&aacute; 500k , thậm ch&iacute; b&aacute;n ch&oacute; Pug 200k hay hơn nữa l&agrave; ch&oacute; pug gi&aacute; 2 triệu, ch&oacute; pug gi&aacute; 3 triệu rất nhiều. Một lần nữa khẳng định lại với bạn rằng việc mua ch&oacute; Pug với gi&aacute; dưới 1 triệu hay ch&oacute; Pug gi&aacute; 1 triệu l&agrave; điều ho&agrave;n to&agrave;n kh&ocirc;ng c&oacute; thật. Bạn sẽ kh&ocirc;ng nhận được ch&uacute; ch&oacute; n&agrave;o cả v&agrave; thậm ch&iacute; c&ograve;n bị lừa tiền cọc.</p>
<p>V&igrave; vậy, nếu muốn sở hữu b&eacute; Pug thuần chủng giấy tờ r&otilde; r&agrave;ng h&atilde;y t&igrave;m kiếm địa chỉ b&aacute;n uy t&iacute;n, chất lượng.</p>
<p>Tr&ecirc;n đ&acirc;y l&agrave; lời giải đ&aacute;p ch&iacute;nh x&aacute;c nhất cho tin tức ch&oacute; Pug gi&aacute; rẻ như&nbsp;<a href="https://blogchomeo.com/co-nen-mua-cho-pug-gia-500k-200k-hay-khong/"><strong>ch&oacute; Pug gi&aacute; 500k</strong></a>. Hy vọng những th&ocirc;ng tin tr&ecirc;n đ&acirc;y sẽ gi&uacute;p bạn kh&ocirc;ng bị lừa đảo khi mua Pug v&agrave; biết được gi&aacute; ch&oacute; mặt xệ bao nhi&ecirc;u 1 con. Đến với&nbsp;<strong><a href="https://blogchomeo.com/">Blog ch&oacute; m&egrave;o</a></strong>&nbsp;để nhận được những kinh nghiệm mua ch&oacute; mặt xệ gi&aacute; nhi&ecirc;u l&agrave; hợp l&yacute; v&agrave; chăm s&oacute;c b&eacute; tốt nhất nh&eacute;!</p>
<p>C&aacute;c t&igrave;m kiếm li&ecirc;n quan kh&aacute;c:<em>&nbsp;ch&oacute; pug mặt xệ gi&aacute; bao nhi&ecirc;u, ch&oacute; pug con gi&aacute; bao nhi&ecirc;u, ch&oacute; mặt xệ bao nhi&ecirc;u tiền, ch&oacute; pug gi&aacute; 200k, ch&oacute; pug gi&aacute; 3 triệu, ch&oacute; pug gi&aacute; 2 triệu, ch&oacute; pug gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; rẻ, ch&oacute; pug gi&aacute;, ch&oacute; pug gi&aacute; 1 triệu, ch&oacute; pug thuần chủng gi&aacute; bao nhi&ecirc;u, ch&oacute; pug bao nhi&ecirc;u tiền 1 con, ch&oacute; mặt xệ con gi&aacute; bao nhi&ecirc;u, mua ch&oacute; pug gi&aacute; 1tr, ch&oacute; mặt xệ bao nhi&ecirc;u 1 con, ch&oacute; mặt xệ bao nhi&ecirc;u một con, ch&oacute; mặt xệ gi&aacute; bao nhi&ecirc;u một con, ch&oacute; mặt xệ gi&aacute; bao nhi&ecirc;u tiền, ch&oacute; mặt xệ gi&aacute; bao nhiu, ch&oacute; pug bao nhi&ecirc;u 1 con, ch&oacute; pug c&oacute; gi&aacute; bao nhi&ecirc;u, ch&oacute; pug dog gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; 300k, ch&oacute; pug mini gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; 1tr, gi&aacute; 1 con ch&oacute; pug, gi&aacute; ch&oacute; pug dog, ch&oacute; mặt xệ bao nhi&ecirc;u tiền một con, ch&oacute; mặt xệ gi&aacute; nhi&ecirc;u, &hellip;</em></p>
<div class="heateor_sss_sharing_container heateor_sss_vertical_sharing heateor_sss_bottom_sharing" data-heateor-sss-href="https://blogchomeo.com/co-nen-mua-cho-pug-gia-500k-200k-hay-khong/">
<div class="heateor_sss_sharing_ul">&nbsp;</div>
<div class="heateorSssClear">&nbsp;</div>
<div class="heateorSssSharingArrow heateorSssPullOut" title="Hide">&nbsp;</div>
</div>
</div>
<footer class="entry-footer"><span class="hm-tags-links"><span class="hm-tagged">TAGGED</span><a href="https://blogchomeo.com/tag/pug/" rel="tag">PUG</a></span></footer>', N'Có nên mua chó pug giá 500k, 200k hay không? Bảng giá chó Pug 2022', N'Có nên mua chó pug giá 500k, 200k hay không? Bảng giá chó Pug 2022', N'Giống chó Pug hiện nay đang được rất nhiều sen lựa chọn làm bé cưng đồng hành cùng mình. Nếu như bạn đang có ý định muốn mua 1 bé Pug thì trước hết cần phải tìm hiểu về mức giá cho Pug mặt xệ giá bao nhiêu cũng như những thông tin về đặc điểm tính cách của loại giống chó này. Trên mạng xã hội có đăng tải rất nhiều tin bán chó Pug giá 500k, vậy tin tức này thực hư ra sao? Cùng tìm hiểu kỹ hơn ngay sau đây nhé!', N'/img/co-nen-mua-cho-pug-gia-500k-200k-hay-khong-1.jpg', CAST(N'2023-07-21T11:05:45.727' AS DateTime))
INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (9, N'<h2><span id="1_Corgi_Fluffy_la_gi">1. Corgi Fluffy l&agrave; g&igrave;?</span></h2>
<p>Đại đa số giống ch&oacute; Corgi c&oacute; l&ocirc;ng ngắn v&agrave; đu&ocirc;i ngắn. Ngo&agrave;i ra ch&uacute;ng c&ograve;n c&oacute; những đặc điểm thuần chủng đ&oacute; l&agrave; ch&acirc;n ngắn v&agrave; m&igrave;nh d&agrave;i. Giống ch&oacute; n&agrave;y l&agrave; một nh&aacute;nh kh&aacute;c của Corgi c&oacute; t&ecirc;n l&agrave; Corgi Fluffy. Ch&oacute; Corgi Fluffy sở hữu bộ l&ocirc;ng d&agrave;i v&agrave; đu&ocirc;i d&agrave;i chạm đất. Đ&oacute; cũng l&agrave; những đặc điểm nổi bật nhất của ch&uacute;ng. Chiếc đu&ocirc;i của ch&uacute;ng cũng l&agrave; điểm thu h&uacute;t đối với những t&iacute;n đồ y&ecirc;u Corgi.</p>
<p><img class="alignnone wp-image-209 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/corgi-fluffy.jpg" alt="" width="600" height="338" data-ll-status="loaded"></p>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div><em>Fluffy Corgi hay c&ograve;n gọi l&agrave; Ch&oacute; Corgi l&ocirc;ng d&agrave;i</em></div>
</figure>
<h2><span id="2_Nguon_goc_dac_diem_cua_cho_Corgi_Fluffy"><strong>2. Nguồn gốc, đặc điểm của ch&oacute; Corgi Fluffy</strong></span></h2>
<p><strong><em>Nguồn gốc:</em></strong></p>
<div class="code-block code-block-6">&nbsp;</div>
<p>Ch&oacute; Corgi l&agrave; giống ch&oacute; c&oacute; nguồn gốc từ xứ Wales ở vương quốc Anh, dễ d&agrave;ng ph&acirc;n biệt nhờ m&agrave;u l&ocirc;ng v&agrave; đặc điểm về ngoại h&igrave;nh. Ban đầu, ch&uacute;ng chỉ c&oacute; một t&ecirc;n l&agrave; Welsh Corgi. Về sau, ch&uacute;ng được lai tạo th&agrave;nh nhiều giống ch&oacute; v&agrave; chia th&agrave;nh hai nh&oacute;m ch&iacute;nh: Corgi Pembroke v&agrave; Cardigan Corgi. Giống ch&oacute; n&agrave;y c&oacute; một t&ecirc;n gọi kh&aacute;c l&agrave; Fluffy Corgi thuộc d&ograve;ng Pembroke nhưng c&oacute; bộ l&ocirc;ng d&agrave;i đặc trưng. Hiện nay, số lượng của d&ograve;ng Corgi Pembroke đ&ocirc;ng hơn v&agrave; cũng được nu&ocirc;i phổ biến hơn. V&igrave; gi&aacute; th&agrave;nh kh&ocirc;ng qu&aacute; cao v&agrave; chế độ chăm s&oacute;c kh&ocirc;ng qu&aacute; phức tạp.</p>
<p><strong><em>Đặc điểm:</em></strong></p>
<p>Ch&oacute; Corgi Fluffy l&ocirc;ng d&agrave;i c&oacute; tai dựng, h&igrave;nh tam gi&aacute;c đều, k&iacute;ch thước tỉ lệ thuận với với khu&ocirc;n mặt của ch&uacute;ng. Corgi c&oacute; mũi nhỏ, nhọn v&agrave; d&agrave;i. Ở nhiều nơi, người ta cũng gọi ch&oacute; Corgi l&agrave; Foxy Dog v&igrave; ch&uacute;ng c&oacute; khu&ocirc;n mặt kh&aacute; giống lo&agrave;i c&aacute;o. Mắt Corgi to, rất tr&ograve;n, mũi đen, h&agrave;m nhỏ v&agrave; răng sắc. Ch&uacute;ng nhai kh&aacute; khỏe n&ecirc;n thường cắn ph&aacute; đồ đạc nếu như ch&uacute;ng bị nhốt trong nh&agrave;.</p>
<div class="code-block code-block-6">&nbsp;</div>
<ul>
<li>Ch&oacute; Corgi Fluffy m&ocirc; tả l&agrave; c&aacute;c ch&uacute; ch&oacute; c&oacute; bộ l&ocirc;ng tương đối d&agrave;i. C&aacute;c vị tr&iacute; như ngực, tai, dưới, ch&acirc;n, b&agrave;n ch&acirc;n v&agrave; ch&acirc;n sau c&oacute; l&ocirc;ng d&agrave;y v&agrave; hơn c&aacute;c bộ phận kh&aacute;c.</li>
<li>Ngoại trừ chiều d&agrave;i l&ocirc;ng. Th&igrave; ch&oacute; Ch&oacute; Corgi Fluffy c&oacute; đặc điểm ngoại h&igrave;nh của cả 2 d&ograve;ng Cardigan Corgi v&agrave; Pembroke Corgi. Những ch&uacute; ch&oacute; n&agrave;y thường c&oacute; l&ocirc;ng m&agrave;u giống như của Pembroke Welsh Corgi &ndash; m&agrave;u v&agrave;ng trắng v&agrave; m&agrave;u Fluffy. V&agrave; chiếc đu&ocirc;i giống như của d&ograve;ng Cardigan Corgi &ndash; đu&ocirc;i d&agrave;i chạm đất v&agrave; nhiều l&ocirc;ng.</li>
<li>Th&ocirc;ng thường, người ta sẽ kh&ocirc;ng để cho ch&uacute; ch&oacute; Fluffy Corgi của m&igrave;nh c&oacute; một bộ l&ocirc;ng d&agrave;i thướt tha như Fox S&oacute;c hoặc c&aacute;c giống ch&oacute; l&ocirc;ng d&agrave;i kh&aacute;c.</li>
<li>B&ecirc;n cạnh đặc điểm về bộ l&ocirc;ng. Th&igrave; Corgi Fluffy c&oacute; đặc điểm giống như một ch&uacute; ch&oacute; Corgi l&ocirc;ng ngắn th&ocirc;ng thường: Ch&acirc;n ngắn, lưng d&agrave;i, tai lớn v&agrave; tr&ograve;n. C&ugrave;ng với khu&ocirc;n mặt đầy đặn, m&otilde;m nhọn, hơi giống mặt c&aacute;o.</li>
</ul>
<p>&nbsp;<img class="alignnone wp-image-1870 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Nguon-goc-va-dac-diem-cua-cho-Corgi-Fluffy.jpg" alt="" width="650" height="390" data-ll-status="loaded"></p>
<p><em>Nguồn gốc v&agrave; đặc điểm của ch&oacute; Corgi Fluffy</em></p>
<h2><span id="3_Tinh_cach_cua_Corgi_Fluffy"><strong>3. T&iacute;nh c&aacute;ch của Corgi Fluffy</strong></span></h2>
<p>Giống ch&oacute; Corgi Fluffy n&agrave;y thừa hưởng gen v&agrave; tư chất của d&ograve;ng Pembroke. Ch&uacute;ng sống rất t&igrave;nh cảm, c&oacute; xu hướng quấn chủ, muốn l&agrave;m chủ vui vẻ, biết nghe lời, dễ d&agrave;ng huấn luyện bởi sự th&ocirc;ng minh, nhanh ch&oacute;ng nghe v&agrave; hiểu được tiếng người.</p>
<div class="code-block code-block-6">&nbsp;</div>
<p>Nhắc đến Corgi, ch&uacute;ng ta thường nhắc đến sự th&ocirc;ng minh của ch&uacute;ng. Corgi được xếp hạng 11 trong danh s&aacute;ch những giống ch&oacute; th&ocirc;ng minh nhất thế giới. Nhờ tr&iacute; th&ocirc;ng minh vượt trội, ch&oacute; Corgi Fluffy được huấn luyện rất nhanh v&agrave; dễ d&agrave;ng. Đặc biệt với những mệnh lệnh, Corgi chỉ cần huấn luyện từ 4 &ndash; 5 lần l&agrave; được.</p>
<p><strong>&ndash; Corgi Fluffy l&agrave; lo&agrave;i ch&oacute; trung th&agrave;nh:&nbsp;</strong>Trong suốt cuộc đời ch&oacute; Corgi Fluffy, ch&uacute;ng chỉ trung th&agrave;nh với một người chủ duy nhất. Ch&uacute;ng rất t&ocirc;n thờ v&agrave; lu&ocirc;n quấn qu&yacute;t chủ. Trong những trường hợp, khi gặp nguy hiểm, Corgi sẽ t&igrave;m c&aacute;ch bảo vệ chủ. V&agrave; ch&uacute;ng cũng sẽ chiến đấu hết m&igrave;nh v&igrave; sự an to&agrave;n của chủ nh&acirc;n.</p>
<p><img class="alignnone wp-image-1871 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Tinh-cach-cua-Fluffy-Corgi-rat-nang-dong.jpg" alt="" width="630" height="788" data-ll-status="loaded"></p>
<div class="code-block code-block-6">&nbsp;</div>
<p><em>T&iacute;nh c&aacute;ch của Fluffy Corgi rất năng động</em></p>
<p><strong>&ndash; Corgi Fluffy cũng kh&aacute; ương bướng:&nbsp;</strong>Trong một v&agrave;i trường hợp, ch&oacute; Corgi cũng c&oacute; một ch&uacute;t ương bướng khi kh&ocirc;ng l&agrave;m theo &yacute; của chủ nh&acirc;n. Do đ&oacute; việc huấn luyện ch&uacute;ng cũng gặp &iacute;t nhiều kh&oacute; khăn.</p>
<p>Bạn cần c&oacute; thời gian v&agrave; phương ph&aacute;p chỉ bảo th&iacute;ch hợp . Đồng thời kết hợp nhắc nhở để ch&uacute;ng thực hiện nghi&ecirc;m t&uacute;c hơn những mệnh lệnh của bạn đề ra. Đặc biệt ch&uacute;ng sủa rất dai dẳng nếu kh&ocirc;ng được nhắc nhở. Để tr&aacute;nh g&acirc;y n&ecirc;n những tiếng ồn kh&ocirc;ng mong muốn. Bạn h&atilde;y kiểm so&aacute;t t&igrave;nh c&aacute;ch của Corgi để giữ ch&uacute;ng y&ecirc;n l&agrave;nh v&agrave; th&acirc;n thiện.</p>
<div class="code-block code-block-6">&nbsp;</div>
<p><strong>&ndash;&nbsp;<a href="https://blogchomeo.com/corgi-fluffy/">Ch&oacute; Corgi Fluffy</a>&nbsp;rất l&agrave; năng động:&nbsp;</strong>Corgi l&agrave; lo&agrave;i ch&oacute; v&ocirc; c&ugrave;ng nghịch ngợm v&agrave; năng động ch&uacute;ng cần được vui chơi, chạy nhảy mỗi ng&agrave;y để giải ph&oacute;ng năng lượng. Ngo&agrave;i ra việc chạy nhảy v&agrave; hoạt động c&ograve;n gi&uacute;p Corgi tr&aacute;nh được bệnh b&eacute;o ph&igrave;.</p>
<h3><span id="Ly_Do_Nen_Nuoi_Cho_Corgi_Fluffy_Hien_Nay"><strong>L&yacute; Do N&ecirc;n Nu&ocirc;i Ch&oacute; Corgi Fluffy Hiện Nay.</strong></span></h3>
<p><strong>Trung th&agrave;nh, t&igrave;nh cảm.</strong></p>
<p><strong>Giống Ch&oacute; Corgi Fluffy</strong>&nbsp;rất t&igrave;nh cảm, dễ d&agrave;ng h&ograve;a nhập với c&aacute;c th&agrave;nh vi&ecirc;n trong nh&agrave;. Ch&uacute;ng đặc biệt trung th&agrave;nh v&agrave; th&iacute;ch quấn qu&yacute;t với chủ, song rất cảnh gi&aacute;c trước người lạ. Ch&iacute;nh bởi vậy Corgi l&agrave; người bạn đồng h&agrave;nh đ&aacute;ng tin cậy.</p>
<div class="code-block code-block-6">&nbsp;</div>
<p><strong>Gi&agrave;u năng lượng.</strong></p>
<p>Mặc d&ugrave; tr&ocirc;ng c&oacute; hiền l&agrave;nh nhưng bản t&iacute;nh Corgi rất năng động. Ch&uacute;ng l&agrave; lo&agrave;i ch&oacute; c&oacute; nhiều năng lượng c&ugrave;ng sức bền dẻo dai. Giống ch&oacute; n&agrave;y th&iacute;ch chạy nhảy trong m&ocirc;i trường rộng r&atilde;i n&ecirc;n c&oacute; thể tham gia nhiều hoạt động ngo&agrave;i trời.</p>
<p><strong>Ch&acirc;n ngắn đ&aacute;ng y&ecirc;u.</strong></p>
<p>Đ&ocirc;i ch&acirc;n ngắn ch&iacute;nh l&agrave; đặc điểm nổi bật của giống ch&oacute; n&agrave;y.&nbsp;<strong>Ch&oacute; Corgi Fluffy</strong>&nbsp;ch&acirc;n ngắn đến mức ngực s&aacute;t đất sẽ c&oacute; gi&aacute; rất cao. V&igrave; theo người chơi ch&oacute; chuy&ecirc;n nghiệp th&igrave; họ coi ch&acirc;n c&agrave;ng ngắn, th&acirc;n c&agrave;ng d&agrave;i th&igrave; c&agrave;ng ngộ nghĩnh, đ&aacute;ng y&ecirc;u.</p>
<p><strong>Th&ocirc;ng minh dễ bảo.</strong></p>
<p><strong>Ch&oacute; Corgi Fluffy</strong>&nbsp;đứng thứ 11 trong bảng xếp hạng những giống ch&oacute; th&ocirc;ng minh nhất của AKC. Ch&uacute;ng biết nghe lời v&agrave; rất dễ huấn luyện. Vậy n&ecirc;n việc dạy bảo Corgi kh&aacute; đơn giản so với những giống ch&oacute; cảnh kh&aacute;c.</p>
<h3><span id="Luu_Y_Khi_Nuoi_Day_Corgi"><strong>Lưu &Yacute; Khi Nu&ocirc;i Dạy Corgi.</strong></span></h3>
<p><strong>&ndash; Ch&oacute; Corgi Fluffy</strong>&nbsp;l&agrave; giống ch&oacute; c&oacute; hệ ti&ecirc;u h&oacute;a kh&aacute; k&eacute;m. Trong qu&aacute; tr&igrave;nh nu&ocirc;i, bạn cần ch&uacute; &yacute; bổ sung chế độ dinh dưỡng ph&ugrave; hợp theo độ tuổi. Khẩu phần ăn gi&agrave;u protein, canxi v&agrave; c&aacute;c loại ngũ cốc, rau củ tốt cho ch&oacute; như bắp cải, c&agrave; rốt, tr&aacute;i c&acirc;y.</p>
<p>&ndash; Ch&oacute; nhỏ rất h&aacute;u ăn n&ecirc;n bạn cần kiểm so&aacute;t lượng thức ăn ch&uacute;ng ti&ecirc;u thụ mỗi ng&agrave;y. Kh&ocirc;ng n&ecirc;n cho ch&oacute; ăn qu&aacute; nhiều hoặc dư thừa chất b&eacute;o, dễ khiến bị mắc c&aacute;c bệnh đường ruột.</p>
<p>&ndash; Tr&aacute;nh c&aacute;c loại thức ăn kh&oacute; ti&ecirc;u h&oacute;a, đồ cay n&oacute;ng, xương cứng, nội tạng động vật hoặc thức ăn qu&aacute; kh&ocirc;. Lu&ocirc;n để sẵn nước cho ch&oacute; uống v&agrave; nhớ thay nước mỗi ng&agrave;y 3 lần.</p>
<p><strong>&ndash; Ch&oacute; Corgi Fluffy</strong>&nbsp;l&agrave; lo&agrave;i ch&oacute; rất th&iacute;ch vận động, bởi vậy kh&ocirc;ng n&ecirc;n nhốt ch&uacute;ng trong nh&agrave; qu&aacute; l&acirc;u v&igrave; ch&oacute; c&oacute; thể bị stress. Bạn cần d&agrave;nh một ch&uacute;t thời gian mỗi s&aacute;ng cho ch&oacute; ra ngo&agrave;i hoạt động kết hợp với phơi nắng.</p>
<p><strong>&ndash; Corgi</strong>&nbsp;l&agrave; lo&agrave;i ch&oacute; th&ocirc;ng minh, th&iacute;ch tự l&agrave;m theo &yacute; m&igrave;nh n&ecirc;n cần ki&ecirc;n nhẫn, tốt nhất n&ecirc;n huấn luyện ch&uacute;ng ngay từ khi mới bắt về. Bạn c&oacute; thể bắt đầu tập cho ch&oacute; lệnh đơn giản như đứng y&ecirc;n, ngồi xuống, nằm xuống, bắt tay,&hellip;</p>
<p>&ndash; Ngo&agrave;i ra, bạn cũng n&ecirc;n tương t&aacute;c thường xuy&ecirc;n với ch&oacute; bằng c&aacute;ch gọi t&ecirc;n v&agrave; giao tiếp bằng mắt. Cần c&oacute; h&igrave;nh thức khen ngợi, thưởng động vi&ecirc;n khi ch&oacute; ho&agrave;n th&agrave;nh tốt nhiệm vụ.</p>
<h2><span id="4_Cach_cham_soc_cho_Corgi_Fluffy"><strong>4. C&aacute;ch chăm s&oacute;c ch&oacute; Corgi Fluffy</strong></span></h2>
<p>Chăm s&oacute;c l&ocirc;ng cho Fluffy Corgi v&ocirc; c&ugrave;ng quan trọng. V&igrave; ch&uacute;ng c&oacute; bộ l&ocirc;ng d&agrave;i, d&agrave;y v&agrave; kh&ocirc;ng ph&ugrave; hợp với kh&iacute; hậu ở Việt Nam. N&ecirc;n bạn cần ch&uacute; &yacute; một số vấn đề sau trong việc chăm s&oacute;c để ch&uacute;ng c&oacute; bộ l&ocirc;ng sạch đẹp v&agrave; mượt m&agrave;.</p>
<p>&ndash; Bạn n&ecirc;n chải l&ocirc;ng cho ch&oacute;&nbsp;<a href="https://blogchomeo.com/corgi-fluffy/"><strong>Fluffy Corgi</strong></a>&nbsp;mỗi ng&agrave;y. Việc chải l&ocirc;ng kh&ocirc;ng chỉ gi&uacute;p bộ l&ocirc;ng ch&uacute;ng lu&ocirc;n mượt m&agrave;, gọn g&agrave;ng. M&agrave; hơn thế nữa, điều n&agrave;y c&ograve;n gi&uacute;p loại bỏ l&ocirc;ng rụng tr&ecirc;n cơ thể ch&uacute;ng.</p>
<p>&ndash; T&iacute;nh c&aacute;ch của ch&oacute; Corgi kh&aacute; năng động, ch&uacute;ng thường xuy&ecirc;n chạy nhảy. N&ecirc;n việc bộ l&ocirc;ng lấm bẩn l&agrave; điều kh&ocirc;ng thể tr&aacute;nh khỏi. H&atilde;y sử dụng sữa tắm chuy&ecirc;n dụng cho th&uacute; cưng để ch&uacute;ng c&oacute; bộ l&ocirc;ng mượt m&agrave; v&agrave; &oacute;ng ả nhất.</p>
<p><img class="alignnone size-full wp-image-1872 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Fluffy-Corgi-Formatted.webp" alt="" width="600" height="399" data-ll-status="loaded"></p>
<p><em>Chăm s&oacute;c Fluffy Corgi rất quan trọng</em></p>
<p>&ndash; Bạn n&ecirc;n cắt tỉa l&ocirc;ng cho Corgi 2 &ndash; 3 th&aacute;ng 1 lần.&nbsp; T&ugrave;y điều kiện gia đ&igrave;nh m&agrave; bạn c&oacute; thể đưa Corgi đi spa cắt tỉa l&ocirc;ng. Ngo&agrave;i ra việc cắt tỉa l&ocirc;ng cần được ch&uacute; &yacute; v&agrave;o m&ugrave;a h&egrave;.</p>
<h2><span id="5_Cho_Corgi_Fluffy_an_gi"><strong>5. Ch&oacute; Corgi Fluffy ăn g&igrave;?</strong></span></h2>
<p>Nh&igrave;n chung, lo&agrave;i ch&oacute; n&agrave;y rất dễ t&iacute;nh trong khoản ăn uống, ch&uacute;ng ta c&oacute; thể cho ch&uacute;ng ăn như c&aacute;c giống ch&oacute; kh&aacute;c. Tuy nhi&ecirc;n, Corgi&nbsp; rất hay chạy nhảy n&ecirc;n cần nhiều năng lượng. V&igrave; vậy, bạn cần cung cấp cho ch&uacute;ng một khẩu phần nhiều đạm v&agrave; chất dinh dưỡng để duy tr&igrave; hoạt động của ch&uacute;ng cả ng&agrave;y.</p>
<p>Tại Việt Nam, Corgi thường được chủ cho ăn cơm l&agrave; chủ yếu. Tuy nhi&ecirc;n, theo một số chuy&ecirc;n gia dinh dưỡng lĩnh vực th&uacute; y th&igrave; Corgi cần tối thiểu 70% thịt, 30% c&ograve;n lại l&agrave; cơm v&agrave; rau củ quả cũng như c&aacute;c loại thức ăn kh&aacute;c.</p>
<p><img class="alignnone size-full wp-image-1874 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/fluffy-corgi-playing-on-the-beach.jpg" alt="" width="600" height="401" data-ll-status="loaded"></p>
<p><em>Ch&oacute; Corgi Fluffy l&ocirc;ng d&agrave;i rất đ&aacute;ng y&ecirc;u</em></p>
<p>&nbsp;</p>
<p>Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin m&agrave;&nbsp;<strong>Blog ch&oacute; m&egrave;o</strong> chia sẻ cho bạn về đặc điểm v&agrave; t&iacute;nh c&aacute;ch của ch&oacute; Corgi Fluffy hay c&ograve;n gọi l&agrave; ch&oacute; Corgi l&ocirc;ng d&agrave;i. Hy vọng rằng những th&ocirc;ng tin tr&ecirc;n sẽ gi&uacute;p bạn hiểu hơn về giống Ch&oacute; Corgi n&agrave;y.</p>', N'Tìm hiểu đặc điểm và tính cách của chó Corgi Fluffy', N'Tìm hiểu đặc điểm và tính cách của chó Corgi Fluffy', N'Khi nhắc đến những chú chó cưng được nhiều người ưa thích chắc hẳn không ai có thể bỏ qua những chú chó Corgi. Với đôi chân ngắn, cặp mông to tròn và đôi mắt sáng long lanh. Chó Corgi nổi tiếng được nhiều tín đồ thú cưng săn đón. Chó Corgi có 3 dòng: Corgi Pembroke, Corgi Cardigan và Corgi Fluffy. Bài viết này các bạn hãy cùng Blog chó mèo tìm hiểu về một số đặc điểm, tính cách của chó Corgi Fluffy nhé!', N'/img/corgi-fluffy.jpg', CAST(N'2023-07-21T11:08:04.210' AS DateTime))
INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (10, N'<h2><span id="1_Triet_san_la_gi"><strong>1. Triệt sản l&agrave; g&igrave;?</strong></span></h2>
<p>Triệt sản (<em>hay thiến</em>) đ&acirc;y l&agrave; một phẫu thuật<strong>&nbsp;loại bỏ cơ quan sinh dục&nbsp;</strong>của động vật. Việc n&agrave;y nhằm loại bỏ khả năng sinh sản của th&uacute; cưng một c&aacute;ch vĩnh viễn.</p>
<ul>
<li aria-level="1">Đối với con đực: Qu&aacute; tr&igrave;nh triệt sản l&agrave; qu&aacute; tr&igrave;nh cắt bỏ tinh ho&agrave;n của ch&oacute; m&egrave;o đực (h&agrave;nh động n&agrave;y thường được gọi l&agrave; thiến)</li>
<li aria-level="1">Đối với con c&aacute;i: Qu&aacute; tr&igrave;nh triệt sản nhằm mục đ&iacute;ch loại bỏ buồng trứng v&agrave; tử cung</li>
</ul>
<p>Triệt sản ch&oacute; c&aacute;i kh&ocirc;ng đơn giản như cuộc phẫu thuật triệt sản (thiến/hoạn) m&agrave; ch&oacute; đực nhận được. M&agrave; đ&oacute; l&agrave; cuộc phẫu thuật lớn hơn v&agrave; cần d&ugrave;ng đến g&acirc;y m&ecirc; to&agrave;n th&acirc;n.</p>
<figure id="attachment_5530" class="wp-caption aligncenter" aria-describedby="caption-attachment-5530"><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-3-1.jpg"><img class="wp-image-5530 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-3-1.jpg" alt="triet-san-cho-cai-khi-nao-3" width="600" height="293" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-5530" class="wp-caption-text">Phẫu thuật triệt sản cho ch&oacute; c&aacute;i sẽ lớn hơn ch&oacute; đực</figcaption>
</figure>
<h2><span id="2_Triet_san_cho_co_loi_ich_gi"><strong>2. Triệt sản ch&oacute; c&oacute; lợi &iacute;ch g&igrave;?</strong></span></h2>
<p>Triệt sản cho ch&oacute; c&aacute;i mang lại nhiều lợi &iacute;ch hơn bạn nghĩ đấy. Một số lợi &iacute;ch như sau:</p>
<div class="code-block code-block-6">&nbsp;</div>
<ul>
<li aria-level="1">Gi&uacute;p ch&oacute; c&aacute;i tr&aacute;nh thai, chấm dứt nguy cơ&nbsp;<a href="https://blogchomeo.com/lam-the-nao-de-biet-cho-mang-thai/">ch&oacute; mang thai</a>&nbsp;ngo&agrave;i &yacute; muốn&nbsp;</li>
<li aria-level="1">Giảm nguy cơ mắc c&aacute;c&nbsp;<a href="https://blogchomeo.com/benh-thuong-gap-o-cho/">bệnh</a>: Vi&ecirc;m tử cung t&iacute;ch mủ, ung thư tuyến v&uacute;&hellip;</li>
<li aria-level="1">Tr&aacute;nh thu h&uacute;t ch&oacute; đực&nbsp;</li>
<li aria-level="1">Loại bỏ một số&nbsp;<a href="https://blogchomeo.com/lam-the-nao-de-khu-mui-hoi-cua-cho-nguyen-nhan-va-cach-khac-phuc/">m&ugrave;i h&ocirc;i</a>&nbsp;tr&ecirc;n người ch&oacute; c&aacute;i</li>
<li aria-level="1">Giải quyết việc ch&oacute; c&aacute;i trở n&ecirc;n k&iacute;ch động trong thời kỳ động dục</li>
</ul>
<blockquote>
<p>Xem th&ecirc;m:&nbsp;<a href="https://blogchomeo.com/triet-san-cho-cho-meo/">Triệt Sản cho Boss &ndash; Lợi hay hại, c&oacute; n&ecirc;n triệt sản cho Ch&oacute; M&egrave;o?</a></p>
</blockquote>
<h2><span id="3_Nen_triet_san_cho_cai_khi_nao_la_phu_hop"><strong>3. N&ecirc;n triệt sản ch&oacute; c&aacute;i khi n&agrave;o l&agrave; ph&ugrave; hợp?</strong></span></h2>
<p>Giải đ&aacute;p cho c&acirc;u hỏi &ldquo;Triệt sản ch&oacute; c&aacute;i khi n&agrave;o?&rdquo; l&agrave;: Những con ch&oacute; c&aacute;i khỏe mạnh, đủ khả năng phẫu thuật sẽ thực hiện phẫu thuật triệt sản trong độ tuổi<strong>&nbsp;từ khoảng 6-9 th&aacute;ng</strong>&nbsp;l&agrave; tốt nhất. Tuy nhi&ecirc;n chắc chắn hơn về thời gian triệt sản của ch&oacute; c&aacute;i. Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n t&igrave;m&nbsp;<strong>hỏi &yacute; kiến của b&aacute;c sĩ th&uacute; y.</strong>&nbsp;B&aacute;c sĩ th&uacute; y sẽ xem x&eacute;t thể trạng hiện tại của ch&oacute;. Sau đ&oacute; mới đưa ra những khuyến c&aacute;o về thời gian triệt sản th&iacute;ch hợp cho ch&uacute; ch&oacute; của bạn.</p>
<figure id="attachment_5526" class="wp-caption aligncenter" aria-describedby="caption-attachment-5526"><strong><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-1.jpg"><img class="wp-image-5526 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-1.jpg" alt="triet-san-cho-cai-khi-nao-1" width="600" height="344" data-ll-status="loaded"></a></strong>
<figcaption id="caption-attachment-5526" class="wp-caption-text">Cần chọn thời điểm ph&ugrave; hợp để triệt sản cho ch&oacute; c&aacute;i</figcaption>
</figure>
<p>Một lưu &yacute; nữa về thời điểm triệt sản ch&oacute; c&aacute;i l&agrave; tốt nhất n&ecirc;n l&agrave;m<strong>&nbsp;trước chu kỳ dậy th&igrave; đầu ti&ecirc;n</strong>&nbsp;của ch&uacute;ng. Chu kỳ động dục đầu ti&ecirc;n của ch&oacute; c&aacute;i thường sẽ xảy ra v&agrave;o khoảng 6-7 th&aacute;ng tuổi. Nhiều b&aacute;c sĩ th&uacute; y sẽ đợi đến khi ch&oacute; c&aacute;i gần s&aacute;t tuổi &ldquo;dậy th&igrave;&rdquo; th&igrave; mới quyết định triệt sản. Bởi l&uacute;c đ&oacute; ch&uacute;ng mới c&oacute; khả năng chịu đựng được lượng thuốc g&acirc;y m&ecirc; cần thiết.</p>
<blockquote>
<p>Xem th&ecirc;m:&nbsp;<a href="https://blogchomeo.com/cho-salo-la-gi-dau-hieu-nhan-biet-cho-salo/">Ch&oacute; salo l&agrave; g&igrave;? Dấu hiệu nhận biết ch&oacute; salo</a></p>
</blockquote>
<p>Với ch&oacute; c&oacute; độ tuổi lớn hơn 6-9 th&aacute;ng, việc triệt sản sẽ&nbsp;<strong>kh&oacute; khăn&nbsp;</strong>hơn. Nếu bạn đ&atilde; lỡ qua &ldquo;thời điểm v&agrave;ng&rdquo; để triệt sản cho ch&oacute; c&aacute;i. Th&igrave; lần sau bạn sẽ phải t&iacute;nh to&aacute;n chu kỳ động dục của n&oacute; trước khi triệt sản. C&aacute;c b&aacute;c sĩ th&uacute; y kh&ocirc;ng khuyến kh&iacute;ch bạn đưa ch&oacute; đi triệt sản khi ch&uacute;ng vẫn c&ograve;n đang trong thời kỳ động dục. Họ sẽ<strong>&nbsp;đợi từ 2-3 th&aacute;ng, sau khi chu kỳ động dục của ch&oacute; c&aacute;i kết th&uacute;c&nbsp;</strong>rồi mới tiến h&agrave;nh phẫu thuật triệt sản.</p>
<div class="code-block code-block-6">&nbsp;</div>
<h2><span id="4_Triet_san_cho_cai_bao_nhieu_tien"><strong>4. Triệt sản ch&oacute; c&aacute;i bao nhi&ecirc;u tiền?</strong></span></h2>
<p>Gi&aacute; triệt sản ch&oacute; c&aacute;i sẽ dao động từ&nbsp;<strong>500.000 đồng đến 1.000.000 đồng.&nbsp;</strong>Gi&aacute; tiền&nbsp;t&ugrave;y theo c&acirc;n nặng v&agrave; độ tuổi của ch&oacute;. Phẫu thuật triệt sản cho ch&oacute; c&aacute;i l&agrave; rất quan trọng. Tốt nhất bạn n&ecirc;n lựa chọn cơ sở lớn, chất lượng v&agrave; đừng ham rẻ cho ch&oacute; triệt sản tại những nơi k&eacute;m uy t&iacute;n nh&eacute;!</p>
<h2><span id="5_9_luu_y_khi_triet_san_cho_cho_cai"><strong>5. #9 lưu &yacute; khi triệt sản cho ch&oacute; c&aacute;i</strong></span></h2>
<p>Triệt sản cho ch&oacute; c&aacute;i l&agrave; cuộc phẫu thuật lớn v&agrave; quan trọng. V&igrave; vậy, bạn cần lưu &yacute; một số vấn đề sau để đảm bảo c&ocirc; ch&oacute; của bạn được khỏe mạnh:</p>
<ul>
<li aria-level="1">Chỉ đưa ch&oacute; rời khỏi th&uacute; y khi đ&atilde; tỉnh thuốc m&ecirc; (mở mắt, ng&oacute;c đầu, cử động&hellip;)</li>
<li aria-level="1">Khi đưa c&uacute;n về nh&agrave;, đặt ch&uacute;ng ở vị tr&iacute; tho&aacute;ng m&aacute;t, y&ecirc;n tĩnh, &iacute;t người qua lại để ch&oacute; c&oacute; thể nghỉ ngơi.</li>
<li aria-level="1">V&agrave;i tiếng sau triệt sản, ch&oacute; c&aacute;i sẽ c&oacute; một số biểu hiện như loạng choạng, đi xi&ecirc;u vẹo, mắt đờ đẫn, gương mặt chưa ho&agrave;n to&agrave;n tỉnh t&aacute;o&hellip; Đ&acirc;y l&agrave; những biểu hiện ho&agrave;n to&agrave;n b&igrave;nh thường do thuốc m&ecirc; vẫn chưa hết t&aacute;c dụng. V&igrave; vậy bạn kh&ocirc;ng cần phải lo lắng. Sau v&agrave;i tiếng, c&ocirc; ch&oacute; của bạn sẽ tỉnh hẳn.</li>
<li aria-level="1">Kh&ocirc;ng cho/&eacute;p ch&oacute; ăn ngay sau khi triệt sản.</li>
<li aria-level="1">Giữ vệ sinh vết mổ của c&uacute;n.</li>
<li aria-level="1">Kh&ocirc;ng cho ch&oacute; nằm ra đất, c&aacute;t, nơi ẩm ướt v&agrave; k&eacute;m vệ sinh để tr&aacute;nh nhiễm tr&ugrave;ng vết thương.</li>
<li aria-level="1">Quan s&aacute;t v&agrave; theo d&otilde;i c&uacute;n thật kỹ trong suốt 24 tiếng đầu ti&ecirc;n sau triệt sản để kịp thời ph&aacute;t hiện c&aacute;c trường hợp bất thường nếu c&oacute;, như: Vết thương chảy m&aacute;u li&ecirc;n tục, bung chỉ&hellip;&nbsp;</li>
<li aria-level="1">Đưa ch&oacute; đến th&uacute; y để được can thiệp kịp thời nếu ch&uacute;ng c&oacute; những biểu hiện lạ</li>
<li aria-level="1">Đưa c&ocirc; ch&oacute; của bạn đến th&uacute; y ti&ecirc;m hậu phẫu theo lời dặn của b&aacute;c sĩ.</li>
</ul>
<figure id="attachment_5529" class="wp-caption aligncenter" aria-describedby="caption-attachment-5529"><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-2-1.jpg"><img class="wp-image-5529 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-2-1.jpg" alt="triet-san-cho-cai-khi-nao-2" width="600" height="338" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-5529" class="wp-caption-text">Phẫu thuật triệt sản cho ch&oacute; c&aacute;i</figcaption>
</figure>
<h2><span id="6_Ket_luan">6. Kết luận</span></h2>
<p>Như vậy,&nbsp;<strong>Blog Ch&oacute; M&egrave;o</strong>&nbsp;đ&atilde; trả lời cho bạn c&acirc;u hỏi: N&ecirc;n triệt sản ch&oacute; c&aacute;i khi n&agrave;o? Hy vọng qua b&agrave;i viết n&agrave;y bạn sẽ nắm r&otilde; được thời điểm th&iacute;ch hợp để triệt sản cho c&ocirc; ch&oacute; của m&igrave;nh. H&atilde;y lu&ocirc;n chăm s&oacute;c thật tốt cho ch&uacute;ng nh&eacute;!</p>
<div class="code-block code-block-6">&nbsp;</div>
<p><strong>Ngo&agrave;i ra, nếu bạn quan t&acirc;m về triệt sản ở m&egrave;o, c&oacute; thể tham khảo b&agrave;i viết sau:</strong></p>
<ol>
<li aria-level="1"><a href="https://blogchomeo.com/thien-meo-duc-bao-nhieu-tien/">Thiến m&egrave;o đực bao nhi&ecirc;u tiền, c&oacute; n&ecirc;n thiến m&egrave;o đực kh&ocirc;ng</a></li>
<li aria-level="1"><a href="https://blogchomeo.com/triet-san-meo-cai/">Triệt sản m&egrave;o c&aacute;i v&agrave; những lưu &yacute; cực k&igrave; quan trọng cho người nu&ocirc;i</a></li>
<li aria-level="1"><a href="https://blogchomeo.com/lam-the-nao-de-meo-het-gao-duc/">L&agrave;m thế n&agrave;o để m&egrave;o hết g&agrave;o đực?</a></li>
</ol>', N'Triệt sản chó cái khi nào tốt nhất? 9 lưu ý khi triệt sản chó cái', N'Triệt sản chó cái khi nào tốt nhất? 9 lưu ý khi triệt sản chó cái', N'Nếu bạn đang phân vân không biết nên triệt sản chó cái khi nào là tốt nhất thì bài viết này sẽ giúp bạn vấn đề đó. Cách xử lý khi cô chó của bạn đã qua thời điểm tốt nhất để triệt sản cũng sẽ được hé lộ. Cùng Blog Chó Mèo theo dõi ngay nhé!', N'/img/triet-san-cho-cai-khi-nao-3-1.jpg', CAST(N'2023-07-21T11:10:31.837' AS DateTime))
INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (11, N'<h2><span id="Nguon_goc_meo_anh_long_dai"><span id="Lich_su_ra_doi_cua_giong_meo_anh_long_dai"><strong>Nguồn gốc m&egrave;o anh l&ocirc;ng d&agrave;i</strong></span></span></h2>
<p>Nghe về t&ecirc;n của giống m&egrave;o n&agrave;y chắc hẳn mọi người sẽ li&ecirc;n tưởng đến&nbsp;<strong><a href="https://blogchomeo.com/meo-anh-long-ngan/" target="_blank" rel="noopener noreferrer">giống m&egrave;o anh l&ocirc;ng ngắn (British Shorthair)</a></strong>&nbsp;điều n&agrave;y ho&agrave;n to&agrave;n dễ hiểu th&ocirc;i v&igrave; đ&acirc;y c&oacute; thể được xem l&agrave; một đứa con lai của&nbsp;<a href="https://blogchomeo.com/tag/meo-anh/"><strong>m&egrave;o anh</strong></a>&nbsp;l&ocirc;ng ngắn v&agrave; m&egrave;o ba&nbsp; tư. Ban đầu, việc lai tạo n&agrave;y xảy ra nhằm gia tăng nh&oacute;m gen cho m&egrave;o l&ocirc;ng ngắn để t&igrave;m ra c&aacute;c đặc điểm vượt trội hơn. C&aacute;c gen l&ocirc;ng d&agrave;i n&agrave;y được xem l&agrave; gen lặn v&agrave; sẽ xuất hiện một v&agrave;i c&aacute; thể khi c&aacute;c c&aacute; thể m&egrave;o mẹ hoặc bố c&oacute; gen lai với m&egrave;o Ba Tư sinh v&agrave;i lứa</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Nhờ v&agrave;o ngoại h&igrave;nh kh&aacute; đẹp của giống m&egrave;o n&agrave;y, v&agrave;o những năm 1914 v&agrave; 1918 c&aacute;c nh&agrave; nh&acirc;n giống đ&atilde; nỗ lực t&igrave;m kiếm v&agrave; lai tạo nhằm nh&acirc;n giống British Longhair. Kh&ocirc;ng l&acirc;u sau đ&oacute;, giống m&egrave;o n&agrave;y trở n&ecirc;n cực kỳ nổi tiếng kh&ocirc;ng k&egrave;m g&igrave; người đ&agrave;n anh đi trước của m&igrave;nh</p>
<p>Về sau n&agrave;y, giống m&egrave;o anh l&ocirc;ng d&agrave;i bắt đầu được c&ocirc;ng nhận l&agrave; một giống độc lập bởi c&aacute;c hiệp hội th&uacute; kiểng tr&ecirc;n thế giới (năm 2009, ALD được đ&atilde;&nbsp; được hiệp hội m&egrave;o quốc tế TICA c&ocirc;ng nhận). Điểm kh&aacute;c biệt đặc trưng nhất giữa ALD v&agrave; ALN chỉ nằm ở chiều d&agrave;i bộ l&ocirc;ng, điều n&agrave;y củng khiến k&iacute;ch thước của ch&uacute;ng c&oacute; vẻ lớn hơn ALN do độ d&agrave;i của bộ l&ocirc;ng</p>
<h2><span id="Dac_diem_cua_meo_Anh_long_dai"><span id="Gioi_thieu_cac_dac_diem_cua_giong_meo_British_Longhair"><strong>Đặc điểm của m&egrave;o Anh l&ocirc;ng d&agrave;i<br></strong></span></span></h2>
<h3><span id="Tinh_cach_cua_British_Longhair"><strong>T&iacute;nh c&aacute;ch của British Longhair</strong></span></h3>
<p>British Longhair hội tụ đầy đủ c&aacute;c t&iacute;nh c&aacute;ch kết hợp giữa hai giống m&egrave;o ALN v&agrave; m&egrave;o Ba tư, những b&eacute; m&egrave;o n&agrave;y c&oacute; t&iacute;nh c&aacute;ch kh&aacute; điềm tĩnh, đ&ocirc;i khi hơi n&oacute;ng t&iacute;nh. Củng tương tự với hầu hết giống m&egrave;o kh&aacute;c, ch&uacute;ng th&iacute;ch được sự ch&uacute; &yacute; v&agrave; tiếp x&uacute;c với chủ, đặc biệt l&agrave; được vuốt ve hoặc được chơi đ&ugrave;a thường xuy&ecirc;n</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Về t&igrave;nh cảm, M&egrave;o Anh L&ocirc;ng D&agrave;i l&agrave; một con m&egrave;o đ&aacute;ng y&ecirc;u v&agrave; th&acirc;n thiện v&agrave; cũng sẽ thể hiện rất nhiều sự khoan dung. Ch&uacute;ng h&ograve;a đồng với mọi người khi ở b&ecirc;n, nhưng giống ch&oacute; n&agrave;y cũng vui vẻ tận hưởng thời gian của ri&ecirc;ng m&igrave;nh, điều n&agrave;y khiến ch&uacute;ng trở th&agrave;nh một lựa chọn th&ocirc;ng minh cho những người c&oacute; thể phải xa nh&agrave; trong nhiều giờ do bận rộn với c&ocirc;ng việc.</p>
<p>Mặc d&ugrave; c&oacute; bản t&iacute;nh thoải m&aacute;i ở m&egrave;o Anh l&ocirc;ng ngắn, nhưng điều quan trọng l&agrave; phải khuyến kh&iacute;ch giống ch&oacute; n&agrave;y vận động v&agrave; tham gia tập thể dục. H&atilde;y coi M&egrave;o Anh L&ocirc;ng D&agrave;i l&agrave; một giống m&egrave;o m&agrave; bạn cần đầu tư thời gian v&agrave; c&ocirc;ng sức khi ở b&ecirc;n ch&uacute;ng để tận dụng tối đa sức mạnh của ch&uacute;ng.</p>
<p>Cũng lưu &yacute; rằng M&egrave;o Anh L&ocirc;ng D&agrave;i l&agrave; một con m&egrave;o t&igrave;nh cảm, nhưng ch&uacute;ng thường kh&ocirc;ng th&iacute;ch được bế hoặc mang đi xung quanh. Ch&uacute;ng l&agrave; một giống ch&oacute; c&oacute; thể ph&ugrave; hợp với lối sống của người lớn hơn l&agrave; một giống ch&oacute; l&uacute;c n&agrave;o cũng ồn &agrave;o với lũ trẻ.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><img class="alignnone size-full wp-image-1017 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/meo-anh-long-dai-1.jpg" alt="" width="640" height="415" data-ll-status="loaded"></p>
<p>Một điều m&agrave; hầu hết mọi người đều nghĩ kh&oacute; c&oacute; thể xảy ra ch&iacute;nh l&agrave; việc huấn luyện cho m&egrave;o c&oacute; khả năng v&acirc;ng lời giống như với ch&oacute;. Tuy nhi&ecirc;n, m&egrave;o anh l&ocirc;ng ngắn lại l&agrave; một giống m&egrave;o kh&aacute; th&ocirc;ng minh, khả năng học hỏi rất nhanh bạn c&oacute; thể huấn luyện cho n&oacute; một số b&agrave;i tập cơ bản để m&egrave;o c&oacute; thể hoạt động nhiều hơn. Một trong những b&agrave;i tập cơ bản m&agrave; bạn c&oacute; thể tập luyện l&agrave; kh&ocirc;ng để m&egrave;o xin ăn tại b&agrave;n dường như l&agrave; chuyện rất đơn giản với giống m&egrave;o th&ocirc;ng minh n&agrave;y để x&acirc;y dựng một t&iacute;nh c&aacute;ch tốt cho ch&uacute;ng</p>
<h3><span id="Ngoai_hinh_cua_meo_anh_long_dai"><strong>Ngoại h&igrave;nh của m&egrave;o anh l&ocirc;ng d&agrave;i</strong></span></h3>
<p>Giống như người anh l&ocirc;ng ngắn của m&igrave;nh, m&egrave;o anh l&ocirc;ng d&agrave;i mang cho m&igrave;nh d&aacute;ng vẻ ngo&agrave;i mập mập v&agrave; mũm mĩm (dĩ nhi&ecirc;n bạn củng th&iacute;ch một ch&uacute; m&egrave;o mập địt đ&uacute;ng kh&ocirc;ng :D) Điều kiện giống l&yacute; tưởng nhất của ALD ch&iacute;nh l&agrave; c&oacute; cơ bắp nhưng kh&ocirc;ng m&acirc;p.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Phần ch&acirc;n tương đối ngắn so với c&aacute;c giống m&egrave;o kh&aacute;c k&egrave;m với bộ l&ocirc;ng d&agrave;y ra khiến bạn c&oacute; cảm gi&aacute;c ch&uacute;ng c&ograve;n m&uacute;p hơn nhiều so với c&aacute;c giống m&egrave;o l&ocirc;ng ngắn, phần ngực rộng v&agrave; mạnh mẽ gi&uacute;p d&aacute;ng đi nhẹ nh&agrave;ng hơn</p>
<p>Phần đầu của giống m&egrave;o n&agrave;y kh&aacute; tr&ograve;n v&agrave; to khiến cảm gi&aacute;c xoa đầu kh&aacute; sướng, đ&ocirc;i tai nhỏ gọn c&ugrave;ng với đ&ocirc;i mắt to tr&ograve;n, sẫm m&agrave;u đi k&egrave;m với bộ l&ocirc;ng d&agrave;i x&ugrave; khiến bạn cảm gi&aacute;c giống hệt như th&uacute; b&ocirc;ng (sẵn s&agrave;ng đốn tim bạn bất cứ l&uacute;c n&agrave;o)</p>
<p>Phần l&ocirc;ng ch&iacute;nh l&agrave; điểm nổi bật nhất của giống m&egrave;o anh l&ocirc;ng d&agrave;i, được thừa kế từ giống m&egrave;o Ba Tư tuy nhi&ecirc;n độ d&agrave;i c&oacute; vẻ kh&ocirc;ng thể so bằng n&ecirc;n thường được ph&acirc;n v&agrave;o nh&oacute;m &ldquo;b&aacute;n d&agrave;i&rdquo;. Điều đặc biệt đang n&oacute;i ở đ&acirc;y ch&iacute;nh l&agrave; về độ d&agrave;y của bộ l&ocirc;ng được thừa hưởng từ ALN bộ l&ocirc;ng dường như x&ugrave; hơn v&agrave; nh&igrave;n sang trọng hơn. Bộ l&ocirc;ng của ALD c&oacute; rất nhiều m&agrave;u kh&aacute;c nhau, c&ugrave;ng t&igrave;m hiểu chi tiết ở phần b&ecirc;n dưới nh&eacute;</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>X&eacute;t về k&iacute;ch thước v&agrave; c&acirc;n nặng th&igrave; đ&acirc;y l&agrave; giống m&egrave;o c&oacute; k&iacute;ch thước trung b&igrave;nh, con c&aacute;i c&oacute; c&acirc;n nặng từ 4 &ndash; 6kg, con đực thường lớn hơn v&agrave; nặng c&oacute; khi đến 8kg. So với những con m&egrave;o c&oacute; khung xương lớn hơn như Maine Coon, anh l&ocirc;ng d&agrave;i c&oacute; vẻ kh&ocirc;ng hề thua k&eacute;m do độ d&agrave;y bộ l&ocirc;ng của n&oacute;</p>
<h3><span id="Tim_hieu_ve_mau_long_cua_meo_long_dai_anh"><strong>T&igrave;m hiểu về m&agrave;u l&ocirc;ng của m&egrave;o l&ocirc;ng d&agrave;i anh</strong></span></h3>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Colourpoint</strong>: Nh&oacute;m m&agrave;u l&ocirc;ng đơn sắc, c&aacute;c b&eacute; m&egrave;o ALD thuộc nh&oacute;m n&agrave;y chỉ c&oacute; một m&agrave;u l&ocirc;ng duy nhất phủ khắp c&aacute;c bộ phận tr&ecirc;n cơ thể</p>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Chinchilla</strong>: Đ&acirc;y l&agrave; một phi&ecirc;n bản kh&aacute; đặc biệt của British Longhair, ch&uacute;ng c&oacute; phần đệm ch&acirc;n m&agrave;u đen v&agrave; bộ l&ocirc;ng trắng bạc tuyệt đẹp. Gi&aacute; của m&egrave;o Chinchilla thường cao ngất nưỡng v&igrave; vẻ đẹp của ch&uacute;ng</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Tabby</strong>: Một m&agrave;u sắc kh&aacute; đặc biệt thừa hưởng từ m&egrave;o ALN, c&oacute; thể m&ocirc; tả như c&oacute; một m&agrave;u chủ đạo v&agrave; c&aacute;c vện m&agrave;u kh&aacute;c xen lẫn v&agrave; r&otilde; r&agrave;ng tr&ecirc;n l&ocirc;ng. Tuy nhi&ecirc;n, do bộ l&ocirc;ng d&agrave;i của giống m&egrave;o n&agrave;y n&ecirc;n kh&oacute; c&oacute; thể nh&igrave;n r&otilde; c&aacute;c vện m&agrave;u</p>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Tortie</strong>: Củng l&agrave; một m&agrave;u phối hợp giữa hai m&agrave;u h&ograve;a quyện lẫn nhau tr&ecirc;n bộ l&ocirc;ng. Nhưng Tortie kh&aacute;c Tabby ở chữa hai khoảng m&agrave;u n&agrave;y kh&ocirc;ng c&oacute; ranh giới r&otilde; r&agrave;ng m&agrave; h&ograve;a quyện v&agrave;o nhau (hay c&ograve;n gọi l&agrave;&nbsp;<strong>m&agrave;u đồi mồi</strong>) thường gặp ở m&egrave;o ALD c&aacute;i</p>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Torbie</strong>: Sự pha trộn giữ Tortie v&agrave; Tabby về mặt m&agrave;u sắc</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>M&egrave;o Anh L&ocirc;ng d&agrave;i Bicolor</strong>: Mi&ecirc;u tả những ch&uacute; m&egrave;o ALD c&oacute; một m&agrave;u trắng v&agrave; một m&agrave;u đi k&egrave;m theo. Th&ocirc;ng thường m&agrave;u bicolor sẽ c&oacute; hai m&agrave;u ch&iacute;nh l&agrave; trắng &ndash; x&aacute;m (lilac) hoặc trắng &ndash; cam</p>
<div id="gallery-1" class="gallery galleryid-1015 gallery-columns-3 gallery-size-full">
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/british-longhair-tabby/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/British-Longhair-Tabby.jpg" sizes="(max-width: 300px) 100vw, 300px" srcset="https://blogchomeo.com/wp-content/uploads/2021/08/British-Longhair-Tabby.jpg 300w, https://blogchomeo.com/wp-content/uploads/2021/08/British-Longhair-Tabby-150x150.jpg 150w" alt="" width="300" height="300" aria-describedby="gallery-1-1018" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1018" class="wp-caption-text gallery-caption">Tabby</figcaption>
</figure>
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/meo-anh-long-dai-bicolor/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-Bicolor.jpg" sizes="(max-width: 300px) 100vw, 300px" srcset="https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-Bicolor.jpg 300w, https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-Bicolor-150x150.jpg 150w" alt="" width="300" height="300" aria-describedby="gallery-1-1019" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1019" class="wp-caption-text gallery-caption">Bicolor</figcaption>
</figure>
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/meo-anh-long-dai-chinchilla/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/meo-anh-long-dai-Chinchilla.jpg" alt="" width="350" height="341" aria-describedby="gallery-1-1020" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1020" class="wp-caption-text gallery-caption">Chinchilla</figcaption>
</figure>
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/meo-anh-long-dai-doi-moi/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-doi-moi.jpg" sizes="(max-width: 350px) 100vw, 350px" srcset="https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-doi-moi.jpg 350w, https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-doi-moi-150x150.jpg 150w" alt="" width="350" height="350" aria-describedby="gallery-1-1021" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1021" class="wp-caption-text gallery-caption">Tortie</figcaption>
</figure>
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/meo-anh-long-dai-mau-lilac/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/MEo-anh-long-dai-mau-lilac.jpg" alt="" width="350" height="245" aria-describedby="gallery-1-1022" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1022" class="wp-caption-text gallery-caption">Colourpoint</figcaption>
</figure>
<figure class="gallery-item">
<div class="gallery-icon landscape"><a href="https://blogchomeo.com/meo-anh-long-dai/meo-anh-long-dai-mau-torbie/"><img class="attachment-full size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Meo-anh-long-dai-mau-torbie.jpg" alt="" width="350" height="290" aria-describedby="gallery-1-1023" data-ll-status="loaded"></a></div>
<figcaption id="gallery-1-1023" class="wp-caption-text gallery-caption">Torbie</figcaption>
</figure>
</div>
<h2><span id="Huong_dan_cham_soc_meo_anh_long_dai_co_ban"><strong>Hướng dẫn chăm s&oacute;c m&egrave;o anh l&ocirc;ng d&agrave;i cơ bản</strong></span></h2>
<p>M&egrave;o Anh l&ocirc;ng d&agrave;i cần được dỗ d&agrave;nh một ch&uacute;t để đảm bảo ch&uacute;ng vẫn hoạt động v&agrave; tập thể dục đầy đủ. Nếu kh&ocirc;ng, bệnh b&eacute;o ph&igrave; ở m&egrave;o v&agrave; c&aacute;c vấn đề sức khỏe li&ecirc;n quan kh&aacute;c c&oacute; thể g&acirc;y ra.</p>
<p>Một c&aacute;ch th&ocirc;ng minh để khuyến kh&iacute;ch giống ch&oacute; n&agrave;y tập thể dục l&agrave; sử dụng c&aacute;c tr&ograve; chơi v&agrave; c&aacute;c buổi vui chơi dựa tr&ecirc;n c&aacute;ch chữa trị. Ngo&agrave;i ra, h&atilde;y xem x&eacute;t c&aacute;c thiết bị cho ăn tương t&aacute;c nếu c&oacute; vẻ như M&egrave;o Anh L&ocirc;ng D&agrave;i của bạn đang trở th&agrave;nh một con m&egrave;o nằm chờ qu&aacute; nhiều.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>C&ugrave;ng với việc l&ecirc;n lịch kh&aacute;m b&aacute;c sĩ th&uacute; y h&agrave;ng năm, Nữ ho&agrave;ng Anh của bạn sẽ cần được kiểm tra v&agrave; cắt tỉa m&oacute;ng tay thường xuy&ecirc;n. Nếu bạn chưa quen với việc bảo dưỡng m&egrave;o, b&aacute;c sĩ th&uacute; y c&oacute; thể chỉ cho bạn c&aacute;ch an to&agrave;n nhất để thực hiện việc n&agrave;y. Th&ecirc;m cột c&agrave;o v&agrave;o m&ocirc;i trường sống của bạn cũng c&oacute; thể gi&uacute;p th&uacute;c đẩy qu&aacute; tr&igrave;nh g&atilde;i l&agrave;nh mạnh v&agrave; giữ cho m&oacute;ng của m&egrave;o lu&ocirc;n trong t&igrave;nh trạng tốt.</p>
<p>Ngo&agrave;i việc chăm s&oacute;c m&oacute;ng tay, h&atilde;y kiểm tra tai của m&egrave;o Anh l&ocirc;ng d&agrave;i để t&igrave;m c&aacute;c dấu hiệu t&iacute;ch tụ bụi bẩn hoặc c&oacute; thể bị nhiễm tr&ugrave;ng v&agrave;i tuần một lần. Cũng n&ecirc;n n&oacute;i chuyện với b&aacute;c sĩ th&uacute; y của bạn về việc bắt đầu một chế độ đ&aacute;nh răng thường xuy&ecirc;n ph&ugrave; hợp với L&ocirc;ng d&agrave;i Anh của bạn.</p>
<h3><span id="Che_do_cham_soc_meo_anh_long_dai"><strong>Chế độ chăm s&oacute;c m&egrave;o anh l&ocirc;ng d&agrave;i</strong></span></h3>
<p>Do chiếc &aacute;o của giống m&egrave;o n&agrave;y qu&aacute; d&agrave;i v&agrave; d&agrave;y đặc n&ecirc;n đ&ograve;i hỏi bạn phải chăm s&oacute;c ch&uacute;ng nhiều hơn so với m&egrave;o ALN. Tuy nhi&ecirc;n, củng kh&ocirc;ng cần phải qu&aacute; chăm s&oacute;c đến từng ly từng t&yacute;. H&atilde;y chải l&ocirc;ng cho b&eacute; m&egrave;o l&ocirc;ng d&agrave;i của bạn khoảng một lần/tuần kh&ocirc;ng n&ecirc;n qu&aacute; nhiều c&oacute; thể l&agrave;m rụng l&ocirc;ng của ch&uacute;ng. Tuy nhi&ecirc;n, v&agrave;o m&ugrave;a rụng l&ocirc;ng của m&egrave;o anh l&ocirc;ng d&agrave;i bạn c&oacute; thể chải l&ocirc;ng cho ch&uacute;ng nhiều hơn khoảng 2 hoặc 3 lần một tuần</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><img class="alignnone size-full wp-image-1024 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Che-do-cham-soc-long-cho-meo-anh-long-dai.jpg" alt="" width="500" height="334" data-ll-status="loaded"></p>
<p>M&egrave;o anh l&ocirc;ng d&agrave;i n&ecirc;n được l&agrave;m quen với b&agrave;n chải v&agrave; lược từ khi c&ograve;n nhỏ để tập một th&oacute;i quen tốt v&agrave; ch&uacute;ng kh&ocirc;ng g&acirc;y kh&oacute; chịu khi chải l&ocirc;ng sau n&agrave;y. H&atilde;y chọn loại lược chải l&ocirc;ng ph&ugrave; hợp với m&egrave;o con v&iacute; dụ một b&agrave;n chải l&ocirc;ng mềm (n&oacute; c&oacute; thể khiến việc chải l&ocirc;ng l&acirc;u hơn do kh&ocirc;ng k&eacute;o l&ocirc;ng tốt nhưng lại kh&ocirc;ng g&acirc;y ảnh hưởng đến da của b&eacute; m&egrave;o) c&oacute; thể thay đổi b&agrave;n ch&agrave;i cứng hơn khi m&egrave;o đ&atilde; trưởng th&agrave;nh</p>
<p>M&egrave;o n&oacute;i chung l&agrave; loại động vật sạch sẽ ch&uacute;ng c&oacute; thể tự chăm s&oacute;c bộ l&ocirc;ng của m&igrave;nh bằng chiếc lưỡi được phủ bởi nhiều răng nhỏ như chiếc lược, đ&acirc;y chắc chắn l&agrave; c&ocirc;ng cụ chăm s&oacute;c l&ocirc;ng hiệu quả nhất. Tuy nhi&ecirc;n, điều n&agrave;y dẫn đến việc ch&uacute;ng sẽ nuốt một lượng l&ocirc;ng đ&aacute;ng kể v&agrave;o bụng sau mỗi qu&aacute; tr&igrave;nh tự vệ sinh cơ thể. Để hỗ trợ loại bỏ phần l&ocirc;ng n&agrave;y ra khỏi cơ thể bạn c&oacute; thể sử dụng một loại thức ăn phổ biến gọi l&agrave; &ldquo;cỏ m&egrave;o&rdquo; hoặc c&aacute;c loại thức ăn đặc trị th&ocirc;ng dụng kh&aacute;c</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>H&atilde;y đảm bảo chế độ ăn của m&egrave;o anh l&ocirc;ng d&agrave;i lu&ocirc;n đầy đủ chất dinh dưỡng với c&aacute;c th&agrave;nh phần chất lượng, tốt nhất cho ch&uacute;ng ăn &iacute;t c&aacute;c thực phẩm c&oacute; đường nhất c&oacute; thể nh&eacute;</p>
<h3><span id="Cac_benh_thuong_gap_o_meo_anh_long_dai"><strong>C&aacute;c bệnh thường gặp ở m&egrave;o anh l&ocirc;ng d&agrave;i</strong></span></h3>
<p>Mặc d&ugrave; c&oacute; sức đề kh&aacute;ng kh&aacute; mạnh mẽ thường &iacute;t mắc phải c&aacute;c bệnh truyền nhiễm. Tuy nhi&ecirc;n, ALD củng thường gặp một bệnh phổ biến m&agrave; người đ&agrave;n anh đi trước Shorthair củng mắc phải đ&oacute; ch&iacute;nh l&agrave; bệnh &ldquo;b&eacute;o ph&igrave;&rdquo;. B&eacute;o ph&igrave; ở m&egrave;o c&oacute; thể khiến bạn tr&ocirc;ng ch&uacute;ng rất đ&aacute;ng y&ecirc;u nhưng lu&ocirc;n tiềm ẩn c&aacute;c mỗi nguy hại dẫn đến c&aacute;c bệnh kh&aacute;c về m&aacute;u v&agrave; h&ocirc; hấp. Giải ph&aacute;p tốt nhất trong trường hợp n&agrave;y l&agrave; thường xuy&ecirc;n cho b&eacute; m&egrave;o hoạt động đơn giản bằng c&aacute;ch chơi đ&ugrave;a với ch&uacute;ng th&ocirc;i l&agrave; đủ</p>
<p>Một bệnh hiếm h&oacute;i ở British Longhair xảy ra do di truyền đ&oacute; l&agrave; bệnh về thận. Bệnh di truyền n&agrave;y thường gặp ở British Shorthair v&agrave; m&egrave;o Ba Tư n&ecirc;n đứa con lai của hai giống n&agrave;y củng kh&ocirc;ng ngoại lệ. U nang thận ph&aacute;t triển rất sớm trong những năm ALD c&ograve;n b&eacute; v&agrave; c&oacute; thể ph&aacute;t hiện dễ d&agrave;ng bằng si&ecirc;u &acirc;m</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Loại bệnh kh&aacute;c được gặp ở giống m&egrave;o n&agrave;y l&agrave; một bệnh về tim (hypertrophic cardiomyophthy &ndash; HCM) xảy ra thường xuy&ecirc;n hơn. Si&ecirc;u &acirc;m tim thường xuy&ecirc;n l&agrave; c&aacute;ch tốt nhất để ph&aacute;t hiện loại bệnh n&agrave;y trong giai đoạn đầu ủ bệnh. Bệnh n&agrave;y thường kh&ocirc;ng c&oacute; c&aacute;ch điều trị v&agrave; n&ecirc;n loại c&aacute;c b&eacute; m&egrave;o mang mầm bệnh n&agrave;y khỏi việc sinh sản, tuy nhi&ecirc;n nếu ph&aacute;t hiện bệnh sớm v&agrave; c&oacute; những biện ph&aacute;p điều trị ph&ugrave; hợp th&igrave; c&aacute;c b&eacute; m&egrave;o mắc bệnh vẫn c&oacute; thể sống được kh&aacute; l&acirc;u</p>
<p><img class="alignnone size-full wp-image-1025 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Co-meo-tri-benh-von-long.jpg" alt="" width="500" height="321" data-ll-status="loaded"></p>
<figure id="attachment_507" class="wp-caption aligncenter" aria-describedby="caption-attachment-507"></figure>
<p>Cỏ m&egrave;o trị bệnh v&oacute;n l&ocirc;ng</p>
<div class="code-block code-block-7">&nbsp;</div>
<h3><span id="Che_do_dinh_duong_cho_meo_long_dai_anh"><strong>Chế độ dinh dưỡng cho m&egrave;o l&ocirc;ng d&agrave;i anh</strong></span></h3>
<p>Về y&ecirc;u cầu dinh dưỡng, m&egrave;o ALD củng kh&ocirc;ng c&oacute; qu&aacute; nhiều kh&aacute;c biệt so với c&aacute;c giống m&egrave;o kh&aacute;c. Thực phẩm tốt nhất cho ALD l&agrave; c&aacute;c loại thực phẩm ướt hoặc kh&ocirc; với h&agrave;m lượng chất dinh dưỡng v&agrave; protein. C&aacute;c loại thực phẩm c&oacute; nguồn gốc thực vật kh&ocirc;ng được khuyến c&aacute;o v&agrave; chỉ n&ecirc;n nằm trong danh s&aacute;ch thực phẩm bổ sung chứ kh&ocirc;ng phải bữa ăn ch&iacute;nh</p>
<p>Ngo&agrave;i c&aacute;c thực phẩm ch&iacute;nh th&igrave; c&aacute;c loại thực phẩm bổ trợ như thực phẩm kh&ocirc; gi&uacute;p hỗ trợ qu&aacute; tr&igrave;nh rụng l&ocirc;ng, thực phẩm gi&uacute;p tr&aacute;nh hiện tượng b&oacute;ng l&ocirc;ng hoặc cỏ m&egrave;o c&oacute; thể sử dụng v&agrave;i th&aacute;ng một lần gi&uacute;p m&egrave;o khỏe mạnh hơn</p>
<p>B&ecirc;n cạnh đ&oacute;, nếu m&egrave;o ALD của bạn gặp triệu chứng HCM hoặc u nang thận, c&oacute; thể đưa đến b&aacute;c sĩ th&uacute; &yacute; để được tư vấn c&aacute;c chế độ dinh dưỡng ph&ugrave; hợp kh&aacute;c</p>
<div class="code-block code-block-7">&nbsp;</div>
<h2><span id="Gia_cua_meo_anh_long_dai_la_bao_nhieu"><strong>Gi&aacute; của m&egrave;o anh l&ocirc;ng d&agrave;i l&agrave; bao nhi&ecirc;u</strong></span></h2>
<p>Chắc hẳn đ&acirc;y l&agrave; phần m&agrave; nhiều bạn quan t&acirc;m nhất trong b&agrave;i viết v&igrave; ai m&agrave; chẳng muốn tham khảo gi&aacute; th&uacute; cưng trước khi mua phải kh&ocirc;ng? M&egrave;o anh l&ocirc;ng d&agrave;i được du nhập v&agrave;o Việt Nam trễ hơn so với ALN, một phần l&agrave; do &iacute;t người nu&ocirc;i m&egrave;o l&ocirc;ng d&agrave;i v&igrave; việc chăm s&oacute;c l&ocirc;ng thường tốn thời gian hơn so với m&egrave;o l&ocirc;ng ngắn n&ecirc;n gi&aacute; th&agrave;nh m&egrave;o anh l&ocirc;ng d&agrave;i ở Việt Nam củng c&oacute; gi&aacute; rẻ hơn kha kh&aacute; so với anh l&ocirc;ng ngắn. Vậy chi tiết gi&aacute; của c&aacute;c b&eacute; m&egrave;o British Longhair như thế n&agrave;o? Mời bạn tham khảo ngay sau đ&acirc;y th&ocirc;i</p>
<p>Dưới đ&acirc;y, Miao Lands sẽ tổng hợp cho c&aacute;c bạn gi&aacute; m&egrave;o anh l&ocirc;ng d&agrave;i đang được b&aacute;n tại thị trường Việt Nam được tổng hợp v&agrave;o th&aacute;ng 5/2020. Tuy nhi&ecirc;n, m&igrave;nh củng chỉ tổng hợp được một khoảng gi&aacute; n&agrave;o đ&oacute; chứ kh&ocirc;ng đưa ra mức gi&aacute; ch&iacute;nh x&aacute;c được v&igrave; gi&aacute; cả c&ograve;n ph&ugrave; hợp v&agrave;o nhiều yếu tố như độ thuần giống v&agrave; h&igrave;nh dạng b&ecirc;n ngo&agrave;i&hellip; nữa nh&eacute;.</p>
<p>&nbsp;</p>
<div class="code-block code-block-7">&nbsp;</div>
<h3><span id="Gia_meo_British_Longhair_duoc_sinh_ra_tai_Viet_Nam"><span id="Cho_Pug_mat_xe_duoc_sinh_ra_tai_Viet_Nam"><span id="Cho_Husky_duoc_sinh_ra_tai_Viet_Nam"><strong>Gi&aacute; m&egrave;o British Longhair được sinh ra tại Việt Nam</strong></span></span></span></h3>
<p>Tuy n&oacute;i, ALD được du nhập v&agrave;o kh&aacute; muộn so với ALN nhưng ch&uacute;ng củng đ&atilde; c&oacute; mặt kh&aacute; l&acirc;u đời tại Việt Nam n&ecirc;n bạn c&oacute; thể dễ d&agrave;ng mua được c&aacute;c b&eacute; m&egrave;o n&agrave;y tại nhiều nơi tr&ecirc;n cả nước chứ kh&ocirc;ng ri&ecirc;ng g&igrave; ở Hồ Ch&iacute; Minh v&agrave; H&agrave; nội. Theo sự tham khảo của m&igrave;nh tại nhiều trang web về th&uacute; cưng, những trại nu&ocirc;i giống uy t&iacute;n củng như một số c&aacute; nh&acirc;n b&aacute;n lẻ tr&ecirc;n facebook th&igrave; gi&aacute; của c&aacute;c b&eacute; m&egrave;o ALD sẽ giao động trong c&aacute;c khoảng như sau</p>
<p><img class="alignnone size-full wp-image-1026 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/anh-meo-anh-long-dai-7-1.jpg" sizes="(max-width: 600px) 100vw, 600px" srcset="https://blogchomeo.com/wp-content/uploads/2021/08/anh-meo-anh-long-dai-7-1.jpg 600w, https://blogchomeo.com/wp-content/uploads/2021/08/anh-meo-anh-long-dai-7-1-150x150.jpg 150w" alt="" width="600" height="601" data-ll-status="loaded"></p>
<p><strong>Gi&aacute; m&egrave;o ALD của những người b&aacute;n h&agrave;ng c&aacute; nh&acirc;n</strong>: Khi lướt facebook hoặc tham gia v&agrave;o c&aacute;c hội nh&oacute;m lu&ocirc;n quan đến ch&oacute; m&egrave;o, bạn c&oacute; sẽ thường xuy&ecirc;n thấy m&egrave;o l&ocirc;ng ngắn được rao b&aacute;n với mức gi&aacute; đa dạng nhưng thường sẽ dao động trong khoảng từ&nbsp;<strong>3.5 triệu &ndash; 5.5&nbsp; triệu/b&eacute;</strong></p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>Gi&aacute; m&egrave;o ALD ở cửa h&agrave;ng hoặc trại giống</strong>: Đối với những nh&agrave; cung cấp uy t&iacute;n l&uacute;c n&agrave;o gi&aacute; m&egrave;o củng thường dao động cao hơn so với những người b&aacute;n h&agrave;ng c&aacute; nh&acirc;n v&igrave; chế độ bảo h&agrave;nh sức khỏe rất tốt, k&egrave;m theo đ&oacute; l&agrave; giống lu&ocirc;n đạt độ thuần chủng như đ&atilde; giới thiệu. Th&ocirc;ng thường gi&aacute; m&egrave;o l&ocirc;ng ngắn khi mua tại c&aacute;c địa chỉ n&agrave;y thường sẽ cao hơn thường nằm trong khoảng&nbsp;<strong>5 triệu &ndash; 8 triệu/b&eacute;</strong>, tuy nhi&ecirc;n khi mua h&agrave;ng tại những địa điểm n&agrave;y sẽ đảm bảo hơn tr&aacute;nh t&igrave;nh trạng tiền mất tật mang</p>
<p><strong>Những lưu &yacute;</strong></p>
<p>1. Gi&aacute; m&egrave;o anh l&ocirc;ng d&agrave;i c&ograve;n dao động t&ugrave;y thuộc v&agrave;o m&agrave;u sắc. Gi&aacute; m&egrave;o m&agrave;u x&aacute;m xanh, tricolor, lilac thường c&oacute; gi&aacute;&nbsp;<strong>rẻ hơn 1 &ndash; 3 triệu so</strong>&nbsp;với m&egrave;o c&oacute; bộ l&ocirc;ng&nbsp;<strong>bicolor</strong><br>2. C&aacute;c b&eacute; m&egrave;o c&oacute; gi&aacute; rẻ hơn c&aacute;c khoảng gi&aacute; m&igrave;nh đưa ra ở tr&ecirc;n (<strong>nhỏ hơn hoặc bằng 3 triệu</strong>) đ&ocirc;i khi c&oacute; thể&nbsp;<strong>xuống đến</strong>&nbsp;<strong>1.5 &ndash; 2 triệu</strong>&nbsp;th&igrave; chắc chắn đ&acirc;y l&agrave; những b&eacute; m&egrave;o si&ecirc;u lai tạp v&agrave; kh&ocirc;ng n&ecirc;n mua bạn nh&eacute;</p>
<div class="code-block code-block-7">&nbsp;</div>
<h3><span id="Gia_meo_Anh_long_dai_sinh_tai_Viet_Nam_co_bo_hoac_me_nhap_khau"><span id="Cho_Pug_sinh_tai_Viet_Nam_nhung_cho_bo_me_nhap_khau"><span id="Cho_Husky_duoc_sinh_tai_Viet_Nam_co_bo_hoac_me_nhap_ngoai"><strong>Gi&aacute; m&egrave;o Anh l&ocirc;ng d&agrave;i sinh tại Việt Nam c&oacute; bố hoặc mẹ nhập khẩu</strong></span></span></span></h3>
<p>Kh&aacute;c với giống m&egrave;o ho&agrave;n to&agrave;n sinh ra tại Việt Nam, đ&agrave;n m&egrave;o c&oacute; bố hoặc mẹ nhập khẩu thường c&oacute; gi&aacute; dao động cao hơn v&igrave; nguồn gốc giống tốt hơn. Đối với loại n&agrave;y bạn n&ecirc;n mua tại c&aacute;c cửa h&agrave;ng lớn hoặc c&aacute;c trại giống uy t&iacute;n khi mua h&atilde;y đảm bảo người b&aacute;n cho bạn xem giấy nhập khẩu, giấy TICA, CFA của m&egrave;o bố mẹ để y&ecirc;n t&acirc;m hơn khi mua những b&eacute; m&egrave;o n&agrave;y nh&eacute;</p>
<p>C&aacute;c b&eacute; British Longhair thuộc nh&oacute;m n&agrave;y củng c&oacute; giấy tờ + gia phả r&otilde; r&agrave;ng, th&iacute;ch hợp để l&agrave;m giống. Gi&aacute; của ch&uacute;ng thường diao động trong khoảng từ&nbsp;<strong>7 &ndash; 11 triệu</strong>&nbsp;t&ugrave;y thuộc v&agrave;o gia phả v&agrave; chất lượng của m&egrave;o bố mẹ</p>
<h3><span id="Gia_meo_anh_long_dai_nhap_khau_truc_tiep"><span id="Cho_Pug_mat_xe_nhap_khau_truc_tiep"><span id="Cho_Husky_nhap_khau"><strong>Gi&aacute; m&egrave;o anh l&ocirc;ng d&agrave;i nhập khẩu trực tiếp</strong></span></span></span></h3>
<p>Củng tương tự với hầu hết giống th&uacute; cưng ngoại nhập kh&aacute;c, British Longhair củng được nhập khẩu từ c&aacute;c thị trường ch&iacute;nh l&agrave; Th&aacute;i Lan hoặc Ch&acirc;u &Acirc;u</p>
<div class="code-block code-block-7">&nbsp;</div>
<ul>
<li>Th&aacute;i Lan: vẫn được xem l&agrave; khu vực nhập khẩu th&uacute; kiểng h&agrave;ng đầu của Việt Nam v&igrave; c&oacute; nhiều trại giống lớn, vị tr&iacute; địa l&yacute; kh&aacute; gần với Việt Nam khiến gi&aacute; nhập khẩu tương đối rẻ. Đối với c&aacute;c ch&uacute; ch&oacute;&nbsp;<strong>nhập Th&aacute;i</strong>, gi&aacute; sẽ rơi v&agrave;o khoảng&nbsp;<strong>8 &ndash; 12 triệu</strong>&nbsp;với m&egrave;o kh&ocirc;ng giấy tờ v&agrave;&nbsp;<strong>14 &ndash; 20 triệu</strong>&nbsp;cho m&egrave;o&nbsp;<strong>đầy đủ giấy tờ nhập</strong>&nbsp;v&agrave; giấy chứng nhận. Những b&eacute; m&egrave;o nhập lu&ocirc;n đạt chất lượng, độ thuần chủng tốt v&agrave; được mua về l&agrave;m giống</li>
<li>Ch&acirc;u &Acirc;u: như đ&atilde; n&oacute;i ở phần lịch sử, ALD bắt nguồn từ ch&acirc;u &Acirc;u n&ecirc;n đ&agrave;n m&egrave;o ở đ&acirc;y phải n&oacute;i l&agrave; v&ocirc; c&ugrave;ng chất lượng về giống, về ngoại h&igrave;nh&hellip; C&aacute;c b&eacute; m&egrave;o anh l&ocirc;ng d&agrave;i nhập từ những khu vực n&agrave;y c&oacute; gi&aacute; th&agrave;nh rất cao c&oacute; khi l&ecirc;n đến&nbsp;<strong>v&agrave;i ng&agrave;n $</strong>&nbsp;l&agrave; chuyện ho&agrave;n to&agrave;n b&igrave;nh thường</li>
</ul>
<div class="alert alert-warning"><strong>Th&ocirc;ng b&aacute;o</strong><br>V&igrave; gi&aacute; sẽ thay đổi theo từng thời điểm kh&aacute;c nhau. N&ecirc;n nếu thời điểm xem b&agrave;i viết mức gi&aacute; đ&oacute; kh&ocirc;ng c&ograve;n ph&ugrave; hợp, vui l&ograve;ng b&igrave;nh luận b&ecirc;n dưới để m&igrave;nh điều chỉnh nh&eacute;. Cảm ơn bạn!</div>
<h3><span id="Mot_so_luu_y_can_biet_truoc_khi_mua_meo_British_long_dai"><span id="Mot_so_luu_y_can_biet_truoc_khi_mua_cho_Pug"><span id="Mot_so_luu_y_khi_chon_mua_cho_Husky"><strong>Một số lưu &yacute; cần biết trước khi mua m&egrave;o British l&ocirc;ng d&agrave;i</strong></span></span></span></h3>
<ul>
<li><strong>Địa điểm mua m&egrave;o l&ocirc;ng d&agrave;i</strong>: N&ecirc;n chọn c&aacute;c cửa h&agrave;ng c&oacute; t&ecirc;n tuổi, thương hiệu hoặc nếu mua từ người nu&ocirc;i h&atilde;y đảm bảo bạn c&oacute; thể đến tận nơi để xem trực tiếp t&igrave;nh trạng của m&egrave;o con nh&eacute;. &ldquo;Tuyệt đối kh&ocirc;ng mua online trừ khi bạn ở những nơi qu&aacute; &iacute;t hoặc kh&ocirc;ng c&oacute; điểm b&aacute;n trực tiếp. Nếu mua online h&atilde;y chọn những cửa h&agrave;ng uy t&iacute;n để đảm bảo cho c&uacute;n củng như cho ch&iacute;nh bạn&rdquo;</li>
<li><strong>Đừng ham rẻ</strong>: H&atilde;y xem lại c&aacute;c khoảng gi&aacute; của m&egrave;o ALD như m&igrave;nh đ&atilde; n&ecirc;u ở tr&ecirc;n, đừng v&igrave; ham rẻ một &iacute;t m&agrave; tiền mất tật mang</li>
<li><strong>Đảm bảo nguồn gốc r&otilde; r&agrave;ng</strong>: Nếu quyết định mua những giống m&egrave;o c&oacute; nguồn gốc ngoại, gi&aacute; tương đối cao h&atilde;y đảm bảo người b&aacute;n cho bạn xem đầy đủ giấy tờ của m&egrave;o bố mẹ hoặc của b&eacute; m&egrave;o bạn dự định mua nh&eacute;</li>
<li><strong>T&igrave;m hiểu trước khi mua</strong>: Trước khi tiến h&agrave;nh mua, h&atilde;y tham khảo nhiều nơi để biết mức gi&aacute; trung b&igrave;nh. B&ecirc;n cạnh đ&oacute;, bạn củng c&oacute; thể biết th&ecirc;m về h&igrave;nh d&aacute;ng của từng đ&agrave;n đến từ nhiều trại kh&aacute;c nhau gi&uacute;p dễ d&agrave;ng lựa chọn hơn v&agrave; kh&ocirc;ng bị mua &ldquo;hố&rdquo; (tuy nhi&ecirc;n ch&iacute;nh s&aacute;ch bảo h&agrave;nh sức khỏe của nơi b&aacute;n củng ảnh hưởng &iacute;t nhiều đến gi&aacute; trị của ch&uacute;ng đấy, chuyện g&igrave; củng c&oacute; nguy&ecirc;n nh&acirc;n của n&oacute; phải kh&ocirc;ng)</li>
</ul>', N'Giống Mèo anh lông dài 2022 Giá cả , cách nuôi, nơi bán…', N'Giống Mèo anh lông dài 2022 Giá cả , cách nuôi, nơi bán…', N'Nếu bạn đang muốn tìm hiểu và chọn một bé mèo với bộ lông dài mượt mà để làm thú cưng của mình thì mèo anh lông dài (British Longhair) là một trong những sự lựa chọn tốt nhất đấy. Tương tự với mèo anh lông ngắn, mèo anh lông dài đã du nhập vào Việt Nam từ lâu đời và con cháu của chính được sinh tại đây đã thích nghi với khí hậu nên sức khỏe thường rất tốt và ít gặp phải các bệnh do thời tiết hơn so với các giống mèo nhập khác', N'/img/meo-anh-long-dai-1.jpg', CAST(N'2023-07-25T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogDetails] ([BlogID], [Content], [Heading], [PageTitle], [ShortDescription], [FeaturedImageURL], [PublishedDate]) VALUES (12, N'<h2><span id="Tong_quan_ve_giong_cho_Mong_Coc"><span id="1_Gioi_thieu_tong_quan_ve_giong_cho_Mong_Coc"><strong>T</strong><strong>ổng quan về giống ch&oacute; M&ocirc;ng Cộc&nbsp;</strong></span></span></h2>
<p>Những điểm đầu ti&ecirc;n m&agrave; m&igrave;nh muốn n&oacute;i về giống ch&oacute; n&agrave;y c&oacute; lẽ l&agrave; t&ecirc;n gọi v&igrave; đ&ocirc;i l&uacute;c người n&agrave;y gọi t&ecirc;n n&agrave;y nhưng người kia lại gọi t&ecirc;n kh&aacute;c lầm l&agrave;m bạn lầm tưởng l&agrave; giống ch&oacute; kh&aacute;c đấy. Th&ocirc;ng thường, mọi người d&ugrave;ng t&ecirc;n&nbsp;<a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><strong>ch&oacute; m&ocirc;ng cộc</strong></a>&nbsp;để gọi giống ch&oacute; n&agrave;y, cũng c&oacute; thể gọi l&agrave; H&rsquo;m&ocirc;ng Cộc,&nbsp;<a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><strong>ch&oacute; H&rsquo;m&ocirc;ng</strong></a>, ch&oacute; Cộc, ch&oacute; Cộc đu&ocirc;i, ch&oacute; Cộc đỏ&hellip;. rất nhiều t&ecirc;n phải kh&ocirc;ng n&agrave;o nhưng thực ra đều d&ugrave;ng để gọi giống n&agrave;y cả đấy</p>
<p>Tiếp theo, h&atilde;y nh&igrave;n sơ qua về ngoại h&igrave;nh của anh bạn n&agrave;y nh&eacute; (h&igrave;nh b&ecirc;n tr&ecirc;n) c&oacute; thể dễ d&agrave;ng nhận thấy đ&acirc;y l&agrave; một giống ch&oacute; c&oacute; v&oacute;c d&aacute;ng trung b&igrave;nh, th&acirc;n h&igrave;nh v&ocirc; c&ugrave;ng chắc khỏe với hệ cơ ph&acirc;n bổ đều khắp cơ thể để th&iacute;ch nghi với khả năng vận động v&agrave; l&agrave;m việc khắc nghiệt ở v&ugrave;ng đồi n&uacute;i n&agrave;y</p>
<p>Một đặc điểm củng kh&aacute; nổi bật về mặt ngoại h&igrave;nh đ&oacute; ch&iacute;nh l&agrave; phần đu&ocirc;i của giống ch&oacute; n&agrave;y đ&oacute; ch&iacute;nh l&agrave; phần đu&ocirc;i. Th&ocirc;ng thường, ch&oacute; m&ocirc;ng cộc sẽ kh&ocirc;ng c&oacute; đu&ocirc;i hoặc phần đu&ocirc;i rất ngắn thường nằm trong khoảng 3 &ndash; 5cm hoặc d&agrave;i lắm củng chỉ từ 8 &ndash; 15cm. C&oacute; lẽ đ&acirc;y củng l&agrave; một phần l&yacute; do v&igrave; sao người ta gọi giống n&agrave;y với t&ecirc;n gọi l&agrave; ch&oacute; cộc (cộc đu&ocirc;i &ndash; hoặc cụt đu&ocirc;i đấy )</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><img class="size-full wp-image-917 aligncenter lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/cho-hmong-coc-duoi.jpg" alt="" width="640" height="450" data-ll-status="loaded"></p>
<h2><span id="Nguon_goc_cho_Mong_Coc"><span id="2_Nguon_goc_ra_doi_cua_giong_cho_Mong_Coc"><strong>Nguồn gốc ch&oacute; M&ocirc;ng Cộc</strong></span></span></h2>
<p>Nghe t&ecirc;n th&ocirc;i th&igrave; m&igrave;nh nghĩ bạn cũng đ&atilde; đo&aacute;n được giống ch&oacute; n&agrave;y c&oacute; nguồn gốc &ocirc;ng b&agrave; tổ ti&ecirc;n g&igrave; với d&acirc;n tộc H&rsquo;m&ocirc;ng rồi đ&uacute;ng kh&ocirc;ng n&agrave;o. Sự thực l&agrave; vậy, ch&oacute; m&ocirc;ng cộc l&agrave; một giống ch&oacute; đ&atilde; xuất hiện từ thời xa xưa v&agrave; gắn liền với cuộc sống đời thường của b&agrave; con d&acirc;n tộc H&rsquo;m&ocirc;ng</p>
<p>Đối với những người d&acirc;n tr&ecirc;n c&aacute;c v&ugrave;ng T&acirc;y Bắc như H&agrave; Giang, L&agrave;o Cai,&hellip; th&igrave; những ch&uacute; ch&oacute; H&rsquo;m&ocirc;ng đu&ocirc;i cộc lu&ocirc;n được họ y&ecirc;u qu&yacute; v&agrave; coi như th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh. Giống ch&oacute; cộc đu&ocirc;i ở đ&acirc;y được coi l&agrave; b&aacute;u vật v&igrave; đ&atilde; gắn b&oacute; với người d&acirc;n từ thủa sơ khai, trợ gi&uacute;p người d&acirc;n đi săn th&uacute;, canh giữ nh&agrave; v&agrave; hết mực trung th&agrave;nh. C&aacute;c nh&agrave; trưởng bản lu&ocirc;n tuyển chọn những ch&uacute; H&rsquo;M&ocirc;ng cộc đu&ocirc;i tinh kh&ocirc;n nhất để tr&ocirc;ng nh&agrave;.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Theo lời truyền miệng kể lại, th&igrave; giống n&agrave;y c&oacute; nguồn gốc từ loại s&oacute;i v&agrave; được thuần h&oacute;a qua nhiều thế hệ để trở th&agrave;nh ch&oacute; nh&agrave; như ng&agrave;y nay. Nhưng kh&ocirc;ng phải v&igrave; thế m&agrave; ch&uacute;ng đ&aacute;nh mất bản chất của m&igrave;nh, ch&oacute; M&ocirc;ng Cộc vẫn mang những đặc t&iacute;nh của một lo&agrave;i &ldquo;th&uacute; săn&rdquo; v&agrave; trở th&agrave;nh người bạn đồng h&agrave;nh cực kỳ tuyệt vời của những người d&acirc;n tộc Hm&ocirc;ng</p>
<p>C&ugrave;ng với sự th&ocirc;ng minh v&agrave; dũng cảm của m&igrave;nh ch&oacute; m&ocirc;ng cộc thực sự xứng đ&aacute;ng l&agrave; niềm tự h&agrave;o của b&agrave; con khu vực v&ugrave;ng n&uacute;i T&acirc;y Bắc nước ta</p>
<h2><span id="Dac_diem_cua_cho_Hmong_Coc_thuan_chung"><span id="3_Nhung_dac_diem_cua_cho_H8217mong_Coc_thuan_chung"><strong>Đ</strong><strong>ặc điểm của ch&oacute; H&rsquo;m&ocirc;ng Cộc thuần chủng</strong></span></span></h2>
<p><img class="alignnone size-full wp-image-918 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/Dac-diem-cua-cho-Hmong-Coc-thuan-chung.jpg" alt="" width="640" height="450" data-ll-status="loaded"></p>
<div class="code-block code-block-7">&nbsp;</div>
<p>&nbsp;</p>
<p><strong>1. Tổng quan về ngoại h&igrave;nh</strong></p>
<p>H&rsquo;m&ocirc;ng cộc l&agrave; một giống ch&oacute; c&oacute; ngoại h&igrave;nh trung b&igrave;nh, phần chiều d&agrave;i th&acirc;n d&agrave;i hơn chiều cao tuy nhi&ecirc;n kh&aacute;c biệt l&agrave; kh&ocirc;ng qu&aacute; đ&aacute;ng kể. Nh&igrave;n một c&aacute;ch tổng quan th&igrave; phần khung sườn của giống n&agrave;y rất chắc chắn, phần cơ được ph&acirc;n bổ đều tr&ecirc;n to&agrave;n bộ cơ thể khiến ch&uacute;ng c&oacute; một vẻ ngo&agrave;i h&agrave;i h&ograve;a, bắt mắt</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Đ&acirc;y l&agrave; một giống ch&oacute; thi&ecirc;n về hoạt động săn bắt v&agrave; l&agrave;m việc n&ecirc;n những đặc t&iacute;nh về d&aacute;ng đi như sự kh&eacute;o l&eacute;o, nhanh nhẹn l&agrave; một trong những yếu tố n&ecirc;n được c&acirc;n nhắc khi đ&aacute;nh gi&aacute; sự thuần chủng</p>
<p><strong>Đặc điểm h&igrave;nh th&aacute;i chung của giống ch&oacute; H&rsquo;m&ocirc;ng cộc đu&ocirc;i</strong></p>
<p>Về h&igrave;nh d&aacute;ng b&ecirc;n ngo&agrave;i, ngoại h&igrave;nh của ch&uacute;ng kh&aacute; đặc trưng với vẻ chắc nịch, đầy cơ bắp v&agrave; chiếc đu&ocirc;i cụt ngộ nghĩnh. Lo&agrave;i ch&oacute; H&rsquo; M&ocirc;ng c&oacute; nhiều điểm đặc biệt:</p>
<div class="code-block code-block-7">&nbsp;</div>
<figure><img class="aligncenter lazyloaded" title="Giống ch&oacute; H''mong cộc đu&ocirc;i" src="https://www.vietdvm.com/images/content/2015/02/cnty/hmong-coc-1.jpg" alt="Giống ch&oacute; H''mong cộc đu&ocirc;i" data-ll-status="loaded"></figure>
<p>&ndash; Tầm v&oacute;c trung b&igrave;nh, to&agrave;n th&acirc;n cơ bắp v&agrave; đậm chắc, hơi d&agrave;i, c&oacute; khung xương rộng, đầu to v&agrave; &aacute;nh mắt biểu cảm. K&iacute;ch thước bề ngo&agrave;i cũng tương đương với d&ograve;ng ch&oacute; ta hay c&ograve;n gọi l&agrave; ch&oacute; kiến.</p>
<p>&ndash; Gần như kh&ocirc;ng c&oacute; đu&ocirc;i, nếu c&oacute; th&igrave; cũng rất ngắn.</p>
<p>&ndash; Nanh của lo&agrave;i ch&oacute; n&agrave;y thường c&oacute; từ 6 đến 8 cạnh kh&aacute;c nhau (đ&acirc;y l&agrave; đặc điểm của lo&agrave;i ch&oacute; săn cổ xưa, theo kiểu cắn cổ con mồi v&agrave; x&eacute; thịt).</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>&ndash; Tai c&oacute; h&igrave;nh tam gi&aacute;c, lu&ocirc;n dựng đứng.</p>
<p>&ndash; Hai ch&acirc;n sau lu&ocirc;n trong tư thế sẵn s&agrave;ng tấn c&ocirc;ng.</p>
<p>&ndash; Sự kh&aacute;c biệt về h&igrave;nh thể giữa hai giới l&agrave; kh&ocirc;ng lớn. Ch&oacute; c&aacute;i c&oacute; thể h&igrave;nh kh&ocirc;ng thua k&eacute;m nhiều so với ch&oacute; đực, ngoại trừ k&iacute;ch thước hơi nhỏ hơn v&agrave; c&aacute;c đường n&eacute;t của đầu mềm mại hơn.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Tổng thể một con ch&oacute; H&rsquo;M&ocirc;ng cộc đu&ocirc;i c&oacute; thể h&igrave;nh hơi g&oacute;c cạnh, thiếu c&aacute;c n&eacute;t thanh t&uacute; v&agrave; mềm mại nhưng lu&ocirc;n bộc lộ c&aacute;c đặc điểm về thể lực rất tốt, cũng như khả năng chịu đựng c&aacute;c điều kiện thời tiết khắc nghiệt.</p>
<p><strong>2. Về k&iacute;ch thước</strong></p>
<p>Đ&uacute;ng với đặc điểm của một ch&uacute; ch&oacute; mang v&oacute;c d&aacute;ng trung b&igrave;nh, ch&oacute; M&ocirc;ng Cộc thường c&oacute; chiều cao trong khoảng 45 &ndash; 55cm, c&acirc;n nặng từ 15 &ndash; 25kg c&aacute;c yếu tố n&agrave;y một phần chịu ảnh hưởng của giới t&iacute;nh v&agrave; ch&oacute; đực thường nhỉnh hơn một ch&uacute;t so với ch&oacute; c&aacute;i</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>3. Phần đầu</strong></p>
<p>C&oacute; thể dễ d&agrave;ng nhận thấy phần đầu của ch&oacute; Cộc hơi rộng v&agrave; trải đều sang hai b&ecirc;n, phần sọ rộng đến nỗi nh&igrave;n tho&aacute;ng qua đ&ocirc;i khi bằng với phần xương bả vai, phần tr&aacute;n kh&aacute; rộng v&agrave; phẳng. Một số điểm kh&aacute;c m&agrave; ch&uacute;ng ta c&oacute; thể đ&aacute;nh gi&aacute; về độ thuần chủng của giống n&agrave;y như sau</p>
<p><strong>&ndash; M&otilde;m:</strong>&nbsp;Một trong những đặc điểm ch&iacute;nh để nhận diện c&aacute;c c&aacute; thể ch&oacute; m&ocirc;ng cộc thuần chủng phải kể đến ch&iacute;nh l&agrave; m&otilde;m. Phần m&otilde;m của ch&oacute; thuần chủng phải ngắn v&agrave; tr&ocirc;ng c&oacute; vẻ hơi vu&ocirc;ng (như m&otilde;m gấu). Phần m&otilde;m d&agrave;i v&agrave; thon về ph&iacute;a trước c&oacute; thể l&agrave; một lỗi giống nghi&ecirc;m trọng<br>&ndash;&nbsp;<strong>Mũi:</strong>&nbsp;Phần mũi của ch&oacute; H&rsquo;m&ocirc;ng thường c&oacute; ba m&agrave;u l&agrave; đen, đỏ hoặc n&acirc;u nhưng thường l&agrave; m&agrave;u đen ở cả ch&oacute; đực v&agrave; ch&oacute; c&aacute;i<br>&ndash;&nbsp;<strong>Mắt:</strong>&nbsp;Đ&ocirc;i mắt của ch&oacute; M&ocirc;ng cộc kh&ocirc;ng qu&aacute; lớn c&oacute; phần hơi nhọn ở phần kh&oacute;e mắt v&agrave; hơi lệch nhẹ từ hướng kh&oacute;e về phần đu&ocirc;i mắt nh&igrave;n sơ qua c&oacute; vẻ hơi gian nhỉ ^^<br>&ndash;&nbsp;<strong>Tai:</strong>&nbsp;Phần tai thường c&oacute; h&igrave;nh tam gi&aacute;c đều v&agrave; dựng đứng<br>&ndash;&nbsp;<strong>Cổ:</strong>&nbsp;Phần cổ d&agrave;i v&agrave; hơi chếch một ch&uacute;t về ph&iacute;a trước, khi thực hiện c&aacute;c hoạt động phần cổ hơi c&uacute;i thấp xuống</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>4. Phần th&acirc;n của ch&oacute; H&rsquo;m&ocirc;ng cộc</strong></p>
<p>&ndash;&nbsp;<strong>Ch&oacute;p vai</strong>: Rộng sang hai b&ecirc;n v&agrave; c&oacute; phần thoải đều khi xu&ocirc;i xuống ch&acirc;n trước, phần cơ bắp d&agrave;y tạo n&ecirc;n sự khỏe mạnh khi di chuyển<br>&ndash;&nbsp;<strong>Sống lưng:</strong>&nbsp;Dễ d&agrave;ng nh&igrave;n thấy trong hầu hết mọi khung h&igrave;nh, phần lưng của ch&oacute; H&rsquo;m&ocirc;ng kh&aacute; thẳng từ ph&iacute;a ch&oacute;p vai về đu&ocirc;i, mạnh mẽ hầu như kh&ocirc;ng c&oacute; độ dốc. Phần lưng dốc xuống c&oacute; thể l&agrave; một lỗi giống<br>&ndash;&nbsp;<strong>Phần ngực</strong>&nbsp;giữa hai ch&acirc;n trước được xem l&agrave; thuần chủng phải rộng &iacute;t nhất bằng một b&agrave;n tay người khi chụm lại, với phần b&agrave;n ch&acirc;n ph&aacute;t triển tốt. Xương sườn d&agrave;i v&agrave; bung tốt nhưng kh&ocirc;ng ph&ugrave;ng đều ra theo dạng th&ugrave;ng m&agrave; phải thon khi c&agrave;ng tiến về ph&iacute;a đu&ocirc;i<br>&ndash;&nbsp;<strong>Đu&ocirc;i:</strong>&nbsp;V&igrave; l&agrave; giống ch&oacute; cộc đu&ocirc;i n&ecirc;n phần đu&ocirc;i ch&oacute; c&agrave;ng ngắn c&agrave;ng tốt, một số c&aacute; thể sẽ c&oacute; chiều d&agrave;i đu&ocirc;i từ 3 &ndash; 15 cm được xem l&agrave; tạm chấp nhận được</p>
<p><strong>5. Phần ch&acirc;n trước v&agrave; sau của ch&oacute; H&rsquo;m&ocirc;ng</strong></p>
<div class="code-block code-block-7">&nbsp;</div>
<p>&ndash; Ch&acirc;n trước: Với đặc điểm của một giống ch&oacute; săn, M&ocirc;ng Cộc c&oacute; phần ch&acirc;n trước cơ bắp khả năng phối hợp tốt với ch&acirc;n sau cho khả năng di chuyển tự do. Xương bả vai d&agrave;i v&agrave; ngửa với c&aacute;c đầu tr&ecirc;n kh&aacute; gần nhau. Khi nh&igrave;n từ ph&iacute;a trước phần ch&acirc;n thẳng v&agrave; kh&ocirc;ng bị th&ocirc;. B&agrave;n ch&acirc;n c&oacute; k&iacute;ch thước trung b&igrave;nh, tr&ograve;n, nhỏ gọn v&agrave; c&aacute;c khớp đều, miếng đệm ch&acirc;n d&agrave;y<br>&ndash; Ch&acirc;n sau: Rộng v&agrave; mạnh mẽ, thẳng. Phần tiếp nối với xương sườn c&oacute; độ dốc lớn hơn một ch&uacute;t khoảng 30&ordm; so với xương ngang. Ở tư thế tự nhi&ecirc;n, xương đ&ugrave;i nối với xương chậu ở g&oacute;c xấp xỉ 90&ordm;. B&agrave;n ch&acirc;n với đặc điểm như ở ch&acirc;n trước, ch&acirc;n thẳng khi nh&igrave;n từ ph&iacute;a sau</p>
<table border="2">
<tbody>
<tr>
<td>
<h3><span id="Cach_nhan_biet_cho_Mong_Coc_thuan_chung"><strong>C&aacute;ch nhận biết ch&oacute; M&ocirc;ng Cộc thuần chủng</strong></span></h3>
<p>Đặc xong một lượt qua phần đặc điểm thuần chủng xong tẩu hỏa nhập ma lu&ocirc;n kh&ocirc;ng biết rốt cuộc l&agrave; ch&oacute; Cộc đu&ocirc;i như thế n&agrave;o mới l&agrave; phải chủng phải kh&ocirc;ng&nbsp; Điều n&agrave;y ho&agrave;n to&agrave;n b&igrave;nh thường tại đ&oacute; chỉ l&agrave; l&yacute; thuyết th&ocirc;i</p>
<p>Để ph&acirc;n biệt được ch&oacute; m&ocirc;ng cộc thuần chủng l&agrave; như thế n&agrave;o c&oacute; lẽ bạn phải quan s&aacute;t thật nhiều ảnh về ch&oacute; thuần chủng ở thực tế hoặc tr&ecirc;n c&aacute;c group Facebook chẳng hạn. Tuy nhi&ecirc;n, m&igrave;nh củng c&oacute; một số đặc điểm muốn nhấn mạnh như sau</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><strong>1.</strong>&nbsp;Đu&ocirc;i phải c&agrave;ng ngắn c&agrave;ng tốt<br><strong>2.</strong>&nbsp;M&otilde;m ngắn v&agrave; hơi vu&ocirc;ng &ndash; m&otilde;m nhọn v&agrave; d&agrave;i khả năng cao đ&atilde; bị lai<br><strong>3.</strong>&nbsp;Tai nhỏ v&agrave; dựng đứng<br><strong>4.</strong>&nbsp;Bộ l&ocirc;ng d&agrave;y, thẳng v&agrave; cứng &ndash; l&ocirc;ng x&ugrave; hoặc mềm c&oacute; khả năng bị lai</p>
</td>
</tr>
</tbody>
</table>
<h2><span id="Tinh_cach_cua_cho_Mong_Coc"><span id="4_Doi_netve_tinh_cach_cua_cho_Mong_Coc"><strong>T</strong><strong>&iacute;nh c&aacute;ch của ch&oacute; M&ocirc;ng Cộc</strong></span></span></h2>
<p><img class="wp-image-1242 aligncenter lazyloaded" src="https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Ven.jpg" sizes="(max-width: 499px) 100vw, 499px" srcset="https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Ven.jpg 1024w, https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Ven-768x432.jpg 768w, https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Ven-750x422.jpg 750w" alt="Cho Mong Coc Ven" width="499" height="281" data-pin-no-hover="true" data-ll-status="loaded"></p>
<p><strong>1. Sự th&ocirc;ng minh</strong></p>
<p>Thật sự xứng đ&aacute;ng với danh quốc khuyến, sự th&ocirc;ng minh l&agrave; một điểm đ&aacute;ng tự h&agrave;o của giống ch&oacute; n&agrave;y. Ch&oacute; H&rsquo;m&ocirc;ng c&oacute; khả năng học hỏi rất nhanh, bạn c&oacute; thể dễ d&agrave;ng huấn luyện giống n&agrave;y v&igrave; ch&uacute;ng c&oacute; thể hiểu được b&agrave;i học của bạn nhờ v&agrave;o tr&iacute; th&ocirc;ng minh của m&igrave;nh, đ&acirc;y l&agrave; l&iacute; do khiến một số nơi con người huấn luyện ch&oacute; cộc trở th&agrave;nh ch&oacute; nghiệp vụ, phục vụ trong qu&acirc;n đội</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>B&ecirc;n cạnh tr&iacute; th&ocirc;ng minh, th&igrave; khả năng ghi nhớ củng l&agrave; một điểm mạnh khiến người ta y&ecirc;u th&iacute;ch ch&uacute;ng. Ch&oacute; Hmong bẩm sinh đ&atilde; c&oacute; một tr&iacute; nhớ si&ecirc;u ph&agrave;m, ch&uacute;ng rất xuất sắc trong việc ghi nhớ đường do đ&oacute; người d&acirc;n lu&ocirc;n ưu &aacute;i dẫn theo ch&uacute;ng trong c&aacute;c cuộc đi săn s&acirc;u trong rừng, ch&oacute; cộc thường chịu cả tr&aacute;ch nhiệm dẫn đường v&agrave; săn bắt c&aacute;c lo&agrave;i th&uacute; nhỏ</p>
<p>Ch&uacute;ng c&oacute; thể dễ d&agrave;ng ghi nhớ khoảng đường về nh&agrave; c&aacute;c xa 6 &ndash; 7 dặm một c&aacute;ch dễ d&agrave;ng v&agrave; được xem l&agrave; &ldquo;la b&agrave;n của d&acirc;n tộc H&rsquo;m&ocirc;ng&rdquo; trong những chuyến đi săn</p>
<p><strong>2. Khả năng huấn luyện tuyệt vời</strong></p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Mặc d&ugrave; c&oacute; nguồn gốc hoang d&atilde; v&agrave; tổ ti&ecirc;n l&agrave; ch&oacute; s&oacute;i nhưng sau nhiều thế hệ ch&oacute; H&rsquo;m&ocirc;ng đ&atilde; c&oacute; thể huấn luyện dễ d&agrave;ng v&agrave; gi&uacute;p đỡ b&agrave; con d&acirc;n tộc trong c&aacute;c c&ocirc;ng việc hằng ng&agrave;y</p>
<p>Th&ocirc;ng thường, c&ocirc;ng việc phổ biến của ch&oacute; M&ocirc;ng cộc l&agrave; giữ nh&agrave; v&agrave; tr&ocirc;ng đồ cho chủ. Tuy nhi&ecirc;n, với bản năng c&ograve;n s&oacute;t lại của lo&agrave;i s&oacute;i ch&uacute;ng lại c&oacute; thể ho&agrave;n th&agrave;nh c&aacute;c nhiệm vụ rất tốt trong c&aacute;c cuộc đi săn v&agrave; kh&ocirc;ng ngần ngại đối đầu với th&uacute; dữ trong rừng để bảo vệ chủ</p>
<p>Ng&agrave;y nay, con người đ&atilde; khai th&aacute;c được khả năng đ&aacute;nh hơi rất tốt của ch&oacute; M&ocirc;ng Cộc n&ecirc;n đ&atilde; được lực lượng cảnh s&aacute;t Việt Nam lựa chọn l&agrave;m bạn trung th&agrave;nh để l&agrave;m c&aacute;c nhiệm vụ ở khu vực bi&ecirc;n giới, những ch&uacute; ch&oacute; H&rsquo;m&ocirc;ng được huấn luyện b&agrave;i bản cho c&aacute;c nhiệm vụ li&ecirc;n quan đến ph&ograve;ng chống tội phạm xuy&ecirc;n quốc gia</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Nếu bạn đang mong muốn sở hữu một ch&uacute; ch&oacute; H&rsquo;m&ocirc;ng trong gia đ&igrave;nh bạn c&oacute; thể huấn luyện cho ch&uacute;ng hầu hết c&aacute;c b&agrave;i tập đơn giản như nhặt đồ, ngồi, năm, đi vệ sinh đ&uacute;ng chỗ&hellip; Nhưng nhớ h&atilde;y huấn luyện ch&uacute;ng trong độ tuổi đang trưởng th&agrave;nh (khoảng v&agrave;i th&aacute;ng tuổi) để c&oacute; khả năng tiếp thu tốt nhất nh&eacute;</p>
<p><img class="size-full wp-image-1239 aligncenter lazyloaded" src="https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Den-e1599489188875.jpg" alt="Cho Mong Coc Den" width="500" height="667" data-pin-no-hover="true" data-ll-status="loaded"></p>
<p><strong>3. L&ograve;ng trung th&agrave;nh</strong></p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Hầu hết mọi giống ch&oacute; đều trung th&agrave;nh với người chủ của m&igrave;nh v&agrave; ch&oacute; H&rsquo;m&ocirc;ng cộc của kh&ocirc;ng ngoại lệ. Ch&uacute;ng thường chỉ ăn thức ăn của chủ cho, nhớ đường về nh&agrave; d&ugrave; ở c&aacute;ch xa v&agrave;i km v&agrave; đặc biệt l&agrave; kh&ocirc;ng bao giờ ch&ecirc; chủ ngh&egrave;o</p>
<p>Ch&uacute;ng lu&ocirc;n đề ph&ograve;ng v&agrave; sẵn s&agrave;ng tấn c&ocirc;ng những người xấu hoặc c&oacute; &yacute; định tiếp cận với chủ nh&acirc;n của ch&uacute;ng</p>
<p>Những vấn đề về sức khỏe thường gặp ở ch&oacute; M&ocirc;ng Cộc</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Ch&oacute; Hm&ocirc;ng c&oacute; thể được coi l&agrave; một lo&agrave;i động vật c&oacute; lối sống kh&aacute; hoang d&atilde; v&agrave; th&iacute;ch nghi tốt với m&ocirc;i trường tự nhi&ecirc;n. Tuy nhi&ecirc;n, c&acirc;u n&oacute;i &ldquo;bệnh tật th&igrave; kh&ocirc;ng chừa một ai lu&ocirc;n đ&uacute;ng trong mọi trường hợp&rdquo;</p>
<p>C&oacute; nguồn gốc từ v&ugrave;ng n&uacute;i, nơi c&oacute; thời tiết m&aacute;t mẻ v&agrave; lạnh v&agrave;o m&ugrave;a đ&ocirc;ng, ch&oacute; Hm&ocirc;ng c&oacute; thể bị sốc do thay đổi m&ocirc;i trường.&nbsp;Nhưng ch&uacute;ng c&oacute; thể th&iacute;ch nghi dần dần, tất cả những g&igrave; bạn cần l&agrave;m khi đưa ch&oacute; đến những nơi c&oacute; kh&iacute; hậu n&oacute;ng hơn như ở khu vực ph&iacute;a nam nước ta chẳng hạn, h&atilde;y cung cấp th&ecirc;m nước v&agrave; cho n&oacute; một nơi tho&aacute;ng m&aacute;t để nghỉ ngơi.</p>
<p>Ngo&agrave;i ra, bộ l&ocirc;ng của ch&oacute; m&ocirc;ng cộc kh&aacute; d&agrave;y, đ&acirc;y c&oacute; thể l&agrave; m&ocirc;i trường sống l&yacute; tưởng cho ve hoặc r&acirc;n sinh s&ocirc;i nảy nở. H&atilde;y đảm bảo&nbsp;tắm cho ch&oacute; thường xuy&ecirc;n để ngăn ngừa c&aacute;c bệnh v&agrave; sự kh&oacute; chịu cho&nbsp;<a href="https://blogchomeo.com/benh-ve-cho/"><strong>ve ch&oacute;</strong></a>&nbsp;g&acirc;y ra</p>
<div class="code-block code-block-7">&nbsp;</div>
<h2><span id="Nuoi_cho_Hmong_coc_nhu_the_nao"><span id="cham-soc-h8217mong-coc-nhu-the-nao"><strong>Nu&ocirc;i ch&oacute; H&rsquo;m&ocirc;ng cộc như thế n&agrave;o?</strong></span></span></h2>
<p>Kh&ocirc;ng giống như những ch&uacute; ch&oacute; ngoại lai,&nbsp;<a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><strong>ch&oacute; M&ocirc;ng Cộc</strong></a>&nbsp;nội địa c&oacute; chế độ dinh dưỡng v&agrave; chăm s&oacute;c kh&aacute;c biệt. Nếu bạn chưa c&oacute; nhiều kinh nghiệm trong vấn đề n&agrave;y, những th&ocirc;ng tin bổ &iacute;ch dưới đ&acirc;y l&agrave; thứ m&agrave; bạn kh&ocirc;ng được bỏ qua:</p>
<h3><span id="Che_do_dinh_duong_danh_cho_cho_Mong_Coc"><strong>Chế độ dinh dưỡng d&agrave;nh cho ch&oacute; M&ocirc;ng Cộc</strong></span></h3>
<ul>
<li>Đối với những ch&uacute; ch&oacute; con từ 1 đến 3 th&aacute;ng tuổi sở hữu hệ thống ti&ecirc;u h&oacute;a chưa ph&aacute;t triển ho&agrave;n thiện, bạn cần cho ch&uacute;ng ăn ch&iacute;n uống s&ocirc;i. Tốt nhất bạn h&atilde;y cho ch&oacute; con ăn ch&aacute;o lo&atilde;ng, uống sữa hoặc c&aacute;c loại thực phẩm được nấu ch&iacute;n. Tuyệt đối kh&ocirc;ng sử dụng thức ăn tươi sống khiến cho vật nu&ocirc;i dễ bị mắc phải c&aacute;c căn bệnh ti&ecirc;u h&oacute;a.</li>
<li>Đối với những ch&uacute; ch&oacute; trưởng th&agrave;nh, người nu&ocirc;i cần cung cấp h&agrave;m lượng protein cao cho th&uacute; cưng ph&aacute;t triển. Đ&acirc;y l&agrave; thời điểm bạn c&oacute; thể cho ch&oacute; ăn c&aacute;c loại thịt đỏ, thịt trắng, cua, t&ocirc;m, ốc nấu ch&iacute;n hoặc để tươi. Nhưng mọi người cần lưu &yacute; l&agrave; phải tập cho ch&oacute; ăn thức ăn tươi từ từ. Khi vật nu&ocirc;i đ&atilde; quen dần bạn mới c&oacute; thể tăng th&ecirc;m số lượng thức ăn.</li>
</ul>
<h3><span id="Tao_moi_truong_song_ly_tuong_cho_cho_Mong_Coc"><strong>Tạo m&ocirc;i trường sống l&yacute; tưởng cho ch&oacute; M&ocirc;ng Cộc</strong></span></h3>
<p>Ch&oacute; M&ocirc;ng Cộc c&oacute; nguồn gốc xuất xứ từ v&ugrave;ng n&uacute;i ph&iacute;a Bắc n&ecirc;n rất y&ecirc;u th&iacute;ch cuộc sống tự do, h&ograve;a lẫn c&ugrave;ng thi&ecirc;n nhi&ecirc;n. V&igrave; vậy bạn h&atilde;y t&igrave;m một nơi rộng r&atilde;i, tho&aacute;ng m&aacute;t để th&uacute; nu&ocirc;i c&oacute; thể thoải m&aacute;i chạy nhảy m&agrave; kh&ocirc;ng cảm thấy bị t&ugrave; t&uacute;ng. Khu vực nu&ocirc;i nhốt th&uacute; phải c&oacute; điều kiện nhiệt độ l&yacute; tưởng dao động từ 25 đến 30 độ C. Gợi &yacute; tốt nhất cho bạn trong trường hợp n&agrave;y l&agrave; h&atilde;y nu&ocirc;i ch&oacute; M&ocirc;ng Cộc b&ecirc;n trong vườn nh&agrave; hoặc khoảng s&acirc;n rộng b&ecirc;n ngo&agrave;i căn hộ.</p>
<h3><span id="Cach_cham_soc_suc_khoe_cho_cho_Mong_Coc"><strong>C&aacute;ch chăm s&oacute;c sức khỏe cho ch&oacute; M&ocirc;ng Cộc</strong></span></h3>
<p>Việt Nam l&agrave; một trong những quốc gia c&oacute; kh&iacute; hậu ẩm ướt, n&ecirc;n rất dễ khiến cho vi khuẩn v&agrave; virus ph&aacute;t triển. Nếu bạn muốn bảo vệ vật nu&ocirc;i của m&igrave;nh một c&aacute;ch tuyệt đối, h&atilde;y tiến h&agrave;nh ti&ecirc;m ph&ograve;ng cho ch&oacute; M&ocirc;ng Cộc từ khi mới sinh ra. Trong qu&aacute; tr&igrave;nh đ&oacute;, người nu&ocirc;i phải tu&acirc;n thủ lịch ti&ecirc;m ph&ograve;ng v&agrave; kh&ocirc;ng được bỏ cử để c&oacute; được kết quả ph&ograve;ng bệnh cao nhất.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Nếu như mọi người nhận thấy những biểu hiện bất thường ở ch&oacute; M&ocirc;ng Cộc như đi ti&ecirc;u ra m&aacute;u, mệt mỏi, ch&aacute;n ăn v&agrave; hay n&ocirc;n ối, bạn h&atilde;y đưa ngay vật nu&ocirc;i đến b&aacute;c sĩ th&uacute; y. Tuyệt đối kh&ocirc;ng tự điều trị tại nh&agrave; khiến cho bệnh trạng c&agrave;ng th&ecirc;m trầm trọng.</p>
<p>Về vấn đề vệ sinh răng miệng, bạn h&atilde;y đ&aacute;nh răng thường xuy&ecirc;n v&agrave; l&agrave;m sạch men răng định kỳ 6 th&aacute;ng/lần cho th&uacute; cưng. Hạn chế cho ch&oacute; ăn qu&aacute; nhiều đồ ngọt l&agrave;m răng bị s&acirc;u v&agrave; mục ruỗng.</p>
<p>Mỗi ng&agrave;y bạn h&atilde;y bỏ ra khoảng 15 ph&uacute;t để l&agrave;m sạch tai ch&oacute; v&agrave; cắt tỉa bộ m&oacute;ng ch&acirc;n cho vật nu&ocirc;i tại nh&agrave;. Sau đ&oacute;, bạn lại lấy một &iacute;t b&ocirc;ng g&ograve;n được tẩm ẩm lau nhẹ nh&agrave;ng xung quanh mắt v&agrave; hốc mắt của th&uacute; nu&ocirc;i. H&atilde;y lau ch&ugrave;i một c&aacute;ch nhẹ nh&agrave;ng v&agrave; cẩn thận để kh&ocirc;ng l&agrave;m xước gi&aacute;c mạc của ch&uacute;ng.</p>
<div class="code-block code-block-7">&nbsp;</div>
<h3><span id="Cach_ve_sinh_long_cho_Mong_Coc"><strong>C&aacute;ch vệ sinh l&ocirc;ng ch&oacute; M&ocirc;ng Cộc</strong></span></h3>
<p>V&igrave; ch&oacute; M&ocirc;ng Cộc c&oacute; bộ l&ocirc;ng ngắn n&ecirc;n người nu&ocirc;i kh&ocirc;ng cần mất nhiều thời gian v&agrave; c&ocirc;ng sức để chải chuốt bộ l&ocirc;ng. Nhưng &iacute;t nhất một lần mỗi ng&agrave;y bạn cần d&agrave;nh thời gian để tắm gội cho th&uacute; cưng của m&igrave;nh. V&igrave; giống ch&oacute; M&ocirc;ng Cộc rất hiếu động, ch&uacute;ng rất hay chạy nhảy khiến cho cơ thể nhanh ch&oacute;ng bị dơ bẩn.</p>
<p>Th&ecirc;m một vấn đề bạn cần lưu &yacute; sau khi tắm ch&oacute; l&agrave; h&atilde;y sấy kh&ocirc; bộ l&ocirc;ng v&agrave; d&ugrave;ng lược chải theo chiều từ tr&ecirc;n xuống dưới. &Aacute;p dụng động t&aacute;c chải l&ocirc;ng một c&aacute;ch nhẹ nh&agrave;ng để loại bỏ hết phần l&ocirc;ng rrụng v&agrave; đưa l&ocirc;ng ch&oacute; đi v&agrave;o nếp gọn g&agrave;ng.</p>
<h3><span id="Cach_huan_luyen_cho_Mong_Coc"><strong>C&aacute;ch huấn luyện ch&oacute; M&ocirc;ng Cộc</strong></span></h3>
<figure class="wp-block-image is-resized">
<figcaption><a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><em><strong>C&aacute;ch huấn luyện ch&oacute; M&ocirc;ng Cộc</strong></em></a></figcaption>
</figure>
<p>Một ch&uacute; ch&oacute; M&ocirc;ng Cộc sẽ trở n&ecirc;n ngoan ngo&atilde;n v&agrave; nghe lời chủ nh&acirc;n khi được huấn luyện từ l&uacute;c c&ograve;n nhỏ. Nếu bạn cũng muốn sở hữu ch&uacute; th&uacute; cưng như thế, h&atilde;y &aacute;p dụng c&aacute;ch huấn luyện dưới đ&acirc;y:</p>
<div class="code-block code-block-7">&nbsp;</div>
<h4><span id="Huan_luyen_cho_Mong_Coc_ngoi_theo_lenh">Huấn luyện ch&oacute; M&ocirc;ng Cộc ngồi theo lệnh</span></h4>
<ul>
<li><strong>Bước 1:</strong>&nbsp;Chuẩn bị sẵn một &iacute;t thức ăn hạt kh&ocirc; rồi đưa ngang mũi để vật nu&ocirc;i đ&aacute;nh hơi. Đ&acirc;y l&agrave; c&aacute;ch để bạn k&iacute;ch th&iacute;ch vị gi&aacute;c của ch&oacute; v&agrave; điều khiển th&uacute; nu&ocirc;i theo &yacute; m&igrave;nh.</li>
<li><strong>Bước 2:</strong>&nbsp;Bạn h&atilde;y ra lệnh ngồi xuống v&agrave; lấy một &iacute;t hạt kh&ocirc; cho vật nu&ocirc;i ăn khi ch&uacute;ng v&acirc;ng lời. Nếu ch&uacute;ng kh&ocirc;ng v&acirc;ng lời, bạn h&atilde;y d&ugrave;ng tay nhấn m&ocirc;ng ch&oacute; xuống v&agrave; kh&ocirc;ng cần phải cho ăn.</li>
<li><strong>Bước 3:</strong>&nbsp;Ki&ecirc;n tr&igrave; lặp lại hai bước l&agrave;m tr&ecirc;n khoảng 20 lần một ng&agrave;y, bạn sẽ dạy được ch&oacute; biết ngồi theo lệnh chỉ trong v&ograve;ng một tuần.</li>
</ul>
<h4><span id="Huan_luyen_cho_Mong_Coc_di_theo_chu_ma_khong_can_day_xich">Huấn luyện ch&oacute; M&ocirc;ng Cộc đi theo chủ m&agrave; kh&ocirc;ng cần d&acirc;y x&iacute;ch</span></h4>
<ul>
<li><strong>Bước 1:</strong>&nbsp;Bạn cũng cần chuẩn bị một &iacute;t thức ăn hạt kh&ocirc; để l&agrave;m mồi dẫn dụ th&uacute; cưng.</li>
<li><strong>Bước 2:</strong>&nbsp;Thay v&igrave; ra lệnh cho ch&oacute; ngồi xuống, bạn chỉ cần vừa đi vừa cho th&uacute; cưng ăn. Cứ 20 bước ch&acirc;n bạn h&atilde;y cho ch&uacute;ng ăn một lần để vật nu&ocirc;i bị k&iacute;ch th&iacute;ch v&agrave; lu&ocirc;n chạy theo người chủ của m&igrave;nh.</li>
<li><strong>Bước 3:</strong>&nbsp;Lặp lại hai bước l&agrave;m tr&ecirc;n khoảng 15 lần một ng&agrave;y trong v&ograve;ng một tuần liền. Sau đ&oacute;, bạn c&oacute; thể cởi bỏ d&acirc;y x&iacute;ch cho ch&oacute; m&agrave; kh&ocirc;ng sợ th&uacute; cưng bị thất lạc.</li>
</ul>
<h4><span id="Huan_luyen_cho_Mong_Coc_biet_danh_hoi_tim_do">Huấn luyện ch&oacute; M&ocirc;ng Cộc biết đ&aacute;nh hơi t&igrave;m đồ</span></h4>
<ul>
<li><strong>Bước 1:</strong>&nbsp;Người nu&ocirc;i h&atilde;y dẫn ch&oacute; đến một b&atilde;i đất trống để chuẩn bị qu&aacute; tr&igrave;nh huấn luyện. Bạn kh&ocirc;ng thể huấn luyện ch&oacute; b&ecirc;n trong căn nh&agrave; v&igrave; nơi đ&acirc;y c&oacute; sự hỗn tạp c&aacute;c m&ugrave;i hương khiến cho ch&oacute; M&ocirc;ng Cộc rất kh&oacute; đ&aacute;nh hơi.</li>
<li><strong>Bước 2:</strong>&nbsp;Bạn h&atilde;y lấy ra m&oacute;n đồ vật muốn ch&uacute;ng t&igrave;m kiếm rồi cho th&uacute; nu&ocirc;i ngửi lấy m&ugrave;i đồ vật. Tiếp đến, bạn h&atilde;y mang vật dụng đem đi giấu v&agrave; tuyệt đối kh&ocirc;ng cho ch&uacute;ng nh&igrave;n thấy.</li>
<li><strong>Bước 3:&nbsp;</strong>Sử dụng x&iacute;ch ch&oacute; để dẫn ch&oacute; đi đ&aacute;nh hơi quanh khu vực giấu đồ vật. Khi th&uacute; cưng đ&atilde; t&igrave;m thấy m&oacute;n đồ m&agrave; bạn đ&atilde; giấu đi, h&atilde;y vuốt ve khen ngợi v&agrave; thưởng cho ch&uacute;ng một &iacute;t thức ăn.</li>
</ul>
<h2><span id="Phan_loai_cho_mong_coc_theo_hinh_dang"><span id="5_Phan_loai_cho_mong_coc_theo_hinh_dang"><strong>Ph&acirc;n loại ch&oacute; m&ocirc;ng cộc theo h&igrave;nh d&aacute;ng</strong></span></span></h2>
<p>Tiếp tục đi đến một phần kh&aacute; th&uacute; vị m&agrave; chắc hầu hết c&aacute;c bạn đều quan đ&oacute; ch&iacute;nh l&agrave; ch&oacute; M&ocirc;ng Cộc c&oacute; những loại m&agrave;u l&ocirc;ng n&agrave;o hoặc c&aacute;ch ph&acirc;n loại giống ch&oacute; n&agrave;y l&agrave;m sao cho đ&uacute;ng phải kh&ocirc;ng?</p>
<blockquote>
<p>Trong c&aacute;c m&agrave;u l&ocirc;ng n&agrave;y th&igrave; ch&oacute; M&ocirc;ng Cộc đỏ (hay n&acirc;u đỏ) được c&aacute;c người chơi th&uacute; kiểng săn l&ugrave;ng nhiều v&igrave; m&agrave;u sắc bắt mắt</p>
</blockquote>
<p><img class="wp-image-1241 aligncenter lazyloaded" src="https://miaolands.com/wp-content/uploads/2020/09/Cho-mong-coc-trang.jpg" sizes="(max-width: 500px) 100vw, 500px" srcset="https://miaolands.com/wp-content/uploads/2020/09/Cho-mong-coc-trang.jpg 960w, https://miaolands.com/wp-content/uploads/2020/09/Cho-mong-coc-trang-768x514.jpg 768w, https://miaolands.com/wp-content/uploads/2020/09/Cho-mong-coc-trang-750x502.jpg 750w" alt="Cho mong coc trang" width="500" height="335" data-pin-no-hover="true" data-ll-status="loaded"></p>
<p>Hiện tại ch&oacute; M&ocirc;ng Cộc được ph&acirc;n loại dựa tr&ecirc;n 2 ti&ecirc;u ch&iacute; l&agrave; độ d&agrave;i đu&ocirc;i v&agrave; m&agrave;u sắc bộ l&ocirc;ng. N&oacute;i một c&aacute;ch chi tiết hơn, người ta&nbsp;<a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><strong>ph&acirc;n loại ch&oacute; M&ocirc;ng Cộc</strong></a>&nbsp;như sau:</p>
<div class="code-block code-block-7">&nbsp;</div>
<h3><span id="1_Phan_loai_cho_Mong_Coc_dua_tren_do_dai_duoi"><strong>1. Ph&acirc;n loại ch&oacute; M&ocirc;ng Cộc dựa tr&ecirc;n độ d&agrave;i đu&ocirc;i</strong></span></h3>
<ul>
<li>Ch&oacute; H&rsquo;M&ocirc;ng Cộc đu&ocirc;i tịt l&agrave; giống ch&oacute; gần như kh&ocirc;ng c&oacute; đu&ocirc;i. Tại vị tr&iacute; đu&ocirc;i ch&oacute;, bạn chỉ c&oacute; thể tr&ocirc;ng thấy một &iacute;t l&ocirc;ng đu&ocirc;i nằm lộ ra b&ecirc;n ngo&agrave;i. Đ&acirc;y cũng l&agrave; giống ch&oacute; c&oacute; gi&aacute; b&aacute;n cao nhất trong số c&aacute;c d&ograve;ng ch&oacute; M&ocirc;ng Cộc hiện nay.</li>
<li>Ch&oacute; H&rsquo;M&ocirc;ng Cộc đu&ocirc;i thỏ l&agrave; giống ch&oacute; sở hữu chiếc đu&ocirc;i 1 mẫu c&oacute; độ ngắn tương tự như đu&ocirc;i thỏ. Chiếc đu&ocirc;i ch&oacute; l&uacute;c n&agrave;y c&oacute; độ d&agrave;i khi&ecirc;m tốn v&agrave; thường chỉ dao động từ 3 đến 5cm.</li>
<li>Ch&oacute; H&rsquo;M&ocirc;ng Cộc đu&ocirc;i cọc lửng l&agrave; giống ch&oacute; sở hữu chiếc đu&ocirc;i d&agrave;i nhất so với những lo&agrave;i ch&oacute; M&ocirc;ng Cộc c&ograve;n lại. Th&ocirc;ng thường ch&oacute; đu&ocirc;i cụt lửng sẽ sở hữu bộ đu&ocirc;i d&agrave;i từ 8 đến 15 cm.</li>
</ul>
<h3><span id="2_Phan_loai_cho_Mong_Coc_theo_mau_long"><strong>2. Ph&acirc;n loại ch&oacute; M&ocirc;ng Cộc theo m&agrave;u l&ocirc;ng</strong></span></h3>
<ul>
<li>Ch&oacute; M&ocirc;ng Cộc m&agrave;u đen mực sở hữu bộ l&ocirc;ng d&agrave;y c&oacute; m&agrave;u đen tựa như mực.</li>
<li>Ch&oacute; H&rsquo;M&ocirc;ng Cộc m&agrave;u vằn mang bộ l&ocirc;ng vằn vện tựa như những ch&uacute; hổ con.</li>
<li>Ch&oacute; H&rsquo;M&ocirc;ng Cộc m&agrave;u hung n&acirc;u hoặc m&agrave;u hồng đỏ l&agrave; giống ch&oacute; hiếm v&agrave; kh&oacute; t&igrave;m hơn c&aacute;c giống ch&oacute; tr&ecirc;n.</li>
</ul>
<p>&nbsp;</p>
<h3><span id="Tieu_chi_danh_gia_cho_Mong_Coc_dep_thuan_chung"><span id="tieu-chi-danh-gia-cho-mong-coc-dep-thuan-chung"><strong>Ti&ecirc;u ch&iacute; đ&aacute;nh gi&aacute; ch&oacute; M&ocirc;ng Cộc đẹp, thuần chủng</strong></span></span></h3>
<p>Ngay cả ở qu&ecirc; hương của ch&uacute; ch&oacute; n&agrave;y &ndash; v&ugrave;ng đất T&acirc;y Bắc th&igrave; số lượng thuần chủng l&agrave; v&ocirc; c&ugrave;ng qu&yacute; hiếm. Ch&iacute;nh sự qu&yacute; hiếm n&agrave;y l&agrave;m những người đam m&ecirc; th&uacute; cảnh r&aacute;o riết săn l&ugrave;ng.</p>
<p>Vậy đặc điểm ph&acirc;n biệt một ch&uacute;&nbsp;<a href="https://blogchomeo.com/cho-hmong-coc-duoi/"><strong>ch&oacute; m&ocirc;ng cộc thuần chủng</strong></a>&nbsp;l&agrave; g&igrave;? Đ&oacute; l&agrave; đu&ocirc;i c&agrave;ng ngắn th&igrave; c&agrave;ng đẹp, m&otilde;m phải ngắn, bộ l&ocirc;ng d&agrave;y đen tuyền, kh&ocirc;ng x&ugrave; kh&ocirc;ng mượt, nhưng cần thẳng v&agrave; cứng. Tuy nhi&ecirc;n một con ch&oacute; H&rsquo;m&ocirc;ng cộc l&ocirc;ng đỏ b&acirc;y giờ quả l&agrave; một b&aacute;u vật.</p>
<div class="code-block code-block-7">&nbsp;</div>
<p><img class="alignnone size-full wp-image-919 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/08/cho-mong-coc-1.jpg" alt="" width="750" height="502" data-ll-status="loaded"></p>
<figure id="attachment_1494" class="wp-caption alignnone" aria-describedby="caption-attachment-1494">
<figcaption id="caption-attachment-1494" class="wp-caption-text">Phom d&aacute;ng Ch&oacute; m&ocirc;ng cộc n&acirc;u đỏ trưởng th&agrave;nh</figcaption>
</figure>
<p>Tai phải nhỏ. Ch&oacute; thuần chủng c&oacute; k&iacute;ch thước tương đối v&agrave; h&igrave;nh thể săn chắc. C&aacute;c tỉ lệ quan trọng bạn c&oacute; thể c&acirc;n nhắc khi chọn mua l&agrave;: chiều d&agrave;i đầu lớn hơn hoặc bằng 40% chiều cao th&acirc;n trước, chiều d&agrave;i m&otilde;m bằng khoảng 40%&nbsp; chiều d&agrave;i đầu,&hellip;</p>
<h2><span id="Gia_cho_H_mong_Coc_thuan_chung_gia_bao_nhieu"><span id="6_Gia_cho_H_mong_Coc_thuan_chung_gia_bao_nhieu"><strong>Gi&aacute; ch&oacute; H m&ocirc;ng Cộc thuần chủng gi&aacute; bao nhi&ecirc;u</strong></span></span></h2>
<p>Tương tự như nhiều giống ch&oacute; kh&aacute;c, gi&aacute; ch&oacute; M&ocirc;ng Cộc củng rất đa dạng v&agrave; phụ thuộc nhiều v&agrave;o độ thuần chủng, chiều d&agrave;i đu&ocirc;i v&agrave; đặc biệt l&agrave; m&agrave;u l&ocirc;ng của ch&uacute;ng</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Sau khi đọc b&agrave;i viết đến đ&acirc;y c&oacute; lẽ ch&uacute;ng ta đều đồng &yacute; rằng ch&oacute; M&ocirc;ng cộc n&acirc;u đỏ sẽ c&oacute; mức gi&aacute; cao nhất v&agrave; đồng thời ngoại h&igrave;nh c&oacute; phần đu&ocirc;i cộc ho&agrave;n to&agrave;n củng được gi&aacute; hơn loại cộc thỏ v&agrave; cộc lửng. Như vậy khoảng gi&aacute; của giống ch&oacute; n&agrave;y sẽ giao động như sau</p>
<p>Ch&oacute; M&ocirc;ng Cộc c&aacute;c m&agrave;u l&ocirc;ng như&nbsp;<strong>đen (phổ biến nhất), v&agrave;ng, vện</strong>&nbsp;c&oacute; phần&nbsp;<strong>đu&ocirc;i</strong>&nbsp;dạng&nbsp;<strong>cộc lửng v&agrave; cộc thỏ</strong>&nbsp;thường c&oacute; gi&aacute; v<strong>&agrave;o khoảng 2 triệu &ndash; 2.5 triệu</strong></p>
<p>Ch&oacute; M&ocirc;ng Cộc c&aacute;c m&agrave;u như tr&ecirc;n c&oacute; phần đu&ocirc;i&nbsp;<strong>cộc tịt hoặc cộc thỏ,</strong>&nbsp;<strong>c&oacute; giấy tờ</strong>&nbsp;thuần chủng sẽ c&oacute; gi&aacute; trong&nbsp;<strong>khoảng từ 5 &ndash; 8 triệu đồng</strong></p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Ch&oacute; H&rsquo;m&ocirc;ng&nbsp;<strong>m&agrave;u n&acirc;u đỏ</strong>&nbsp;c&oacute; gi&aacute; th&agrave;nh kh&aacute; cao đặc biệt l&agrave; với những b&eacute;&nbsp;<strong>cộc tịt</strong>&nbsp;nữa th&igrave; gi&aacute; th&agrave;nh c&oacute; thể dao động trong&nbsp;<strong>khoảng 10 &ndash; 25 triệu</strong>&nbsp;hoặc hơn t&ugrave;y v&agrave;o chủ sở hữu</p>
<h2><span id="Co_the_mua_cho_Hmong_coc_duoi_o_dau"><span id="7_Co_the_mua_cho_H8217mong_coc_duoi_o_dau"><strong>C&oacute; thể mua ch&oacute; H&rsquo;m&ocirc;ng cộc đu&ocirc;i ở đ&acirc;u?&nbsp;</strong></span></span></h2>
<p>Hiện nay, c&aacute;c cộng đồng về giống ch&oacute; n&agrave;y đ&atilde; bắt đầu xuất hiện nhiều chứ kh&ocirc;ng c&ograve;n hiềm như trước nữa, bạn c&oacute; thể tham gia c&aacute;c diễn đ&agrave;n về ch&oacute; Cộc tr&ecirc;n Facebook hoặc c&aacute;c diễn đ&agrave;n để t&igrave;m th&ecirc;m th&ocirc;ng tin v&agrave; dĩ nhi&ecirc;n sẽ c&oacute; một số trại giống cung cấp giống n&agrave;y</p>
<p>B&ecirc;n cạnh đ&oacute;, bạn ho&agrave;n to&agrave;n c&oacute; thể đến trực tiếp c&aacute;c khu vực rừng n&uacute;i H&agrave; Giang, Bắc Giang, Sơn La để chọn mua trực tiếp tại c&aacute;c bản l&agrave;ng của người d&acirc;n H&rsquo;m&ocirc;ng tuy nhi&ecirc;n h&atilde;y trang bị đầy đủ kiến thức để tr&aacute;nh bị ch&agrave;o gi&aacute; cao nh&eacute;</p>
<div class="code-block code-block-7">&nbsp;</div>
<p>Một số k&ecirc;nh online như chợ tốt củng c&oacute; nhiều c&aacute; nh&acirc;n rao b&aacute;n nhưng khi mua qua đ&acirc;y h&atilde;y đảm bảo c&oacute; thể đến trực tiếp để xem t&igrave;nh trạng c&uacute;n để kh&ocirc;ng mua phải ch&oacute; bệnh</p>
<p>Chế độ ăn uống khi nu&ocirc;i ch&oacute; H&rsquo;m&ocirc;ng cộc đu&ocirc;i</p>
<p><img class="wp-image-1240 aligncenter lazyloaded" src="https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Nau-do.jpg" sizes="(max-width: 500px) 100vw, 500px" srcset="https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Nau-do.jpg 960w, https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Nau-do-768x514.jpg 768w, https://miaolands.com/wp-content/uploads/2020/09/Cho-Mong-Coc-Nau-do-750x502.jpg 750w" alt="Cho Mong Coc Nau do" width="500" height="335" data-pin-no-hover="true" data-ll-status="loaded"></p>
<div class="code-block code-block-7">&nbsp;</div>
<h2><span id="Nhung_dieu_can_can_nhac_khi_co_y_dinh_nuoi_cho_Hmong"><span id="8_Nhung_dieu_can_can_nhac_khi_co_y_dinh_nuoi_cho_Hmong"><strong>Những điều cần c&acirc;n nhắc khi c&oacute; &yacute; định nu&ocirc;i ch&oacute; Hm&ocirc;ng</strong></span></span></h2>
<p>Tuy c&oacute; t&iacute;nh c&aacute;ch th&acirc;n thiện với chủ nhưng ch&oacute; Hm&ocirc;ng lu&ocirc;n thận trọng mỗi khi gặp người lạ, bản năng bảo vệ l&atilde;nh thổ rất cao. Đảm bảo x&iacute;ch hoặc nhốt ch&oacute; v&agrave;o lồng khi c&oacute; kh&aacute;ch đến thăm nh&agrave; bạn nh&eacute;</p>
<p>Bản t&iacute;nh vốn dĩ l&agrave; ch&oacute; săn n&ecirc;n ch&uacute;ng c&oacute; thể tấn c&ocirc;ng c&aacute;c vật nu&ocirc;i kh&aacute;c trong nh&agrave; như m&egrave;o, thỏ, bọ&hellip;. Ch&uacute;ng c&oacute; thể rất hung dữ khi nh&igrave;n thấy m&egrave;o v&agrave; sẽ tấn c&ocirc;ng ch&uacute;ng nếu ch&uacute;ng c&oacute; cơ hội. Bạn n&ecirc;n cảnh gi&aacute;c khi ch&oacute; gặp m&egrave;o nh&agrave;, m&egrave;o nh&agrave; h&agrave;ng x&oacute;m hoặc c&oacute; &yacute; định nu&ocirc;i th&ecirc;m m&egrave;o trong nh&agrave;</p>
<p>Gi&aacute; ch&oacute; Hm&ocirc;ng cộc n&acirc;u đỏ l&agrave; đắt nhất trong c&aacute;c m&agrave;u. Điều n&agrave;y c&oacute; thể được giải th&iacute;ch do người Việt Nam tin rằng ch&oacute; m&agrave;u n&acirc;u đỏ sẽ mang lại may mắn cho chủ nh&acirc;n v&agrave; m&agrave;u n&agrave;y d&ugrave; sao cũng đẹp v&agrave; độc hơn c&aacute;c m&agrave;u kh&aacute;c. Đ&oacute; l&agrave; l&yacute; do tại sao gi&aacute; một&nbsp; b&eacute; m&ocirc;ng cộc đỏ thuần chủng c&oacute; thể l&ecirc;n đến v&agrave;i ngh&igrave;n đ&ocirc; la đấy</p>', N'Chó H’mông cộc đuôi – Ông kẹ vùng núi – Tứ đại quốc khuyển Việt', N'Chó H’mông cộc đuôi – Ông kẹ vùng núi – Tứ đại quốc khuyển Việt', N'Chó Mông Cộc hay còn gọi là H’mông cộc đuôi giống chó đã xuất hiện từ đời ở nước ta, chúng được xem là những người bạn đồng hành tin cậy nhất của dân tộc H’mông với sự thông minh và những đặc tính tuyệt vời khác. Cùng với chó Phú Quốc, chó Bắc Hà và Dingo Đông Dương đã tạo thành bộ tứ quốc khuyển của Việt Nam.', N'/img/cho-hmong-coc-duoi-12.jpg', CAST(N'2023-07-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlogDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (1, N'Thức ăn cho mèo', N'Danh mục này bao gồm các sản phẩm và phụ kiện liên quan đến mèo', N'https://giayphepluuhanhtudo.com/ckfinder/userfiles/images/3-thuc%20an%20ch%C3%B3%20meo.jpg                                                                                                              ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (2, N'Thức ăn cho chó', N'Danh mục này chứa các sản phẩm và phụ kiện dành cho chó', N'https://sieupet.com/sites/default/files/pictures/images/thuc-an-kho-cho-cho.gif                                                                                                                         ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (6, N'Dinh Dưỡng', N'Danh mục này cung cấp các sản phẩm liên quan đến dinh dưỡng cho thú cưng như thức ăn chất lượng cao, bổ sung vitamin và khoáng chất, hoặc các sản phẩm dinh dưỡng đặc biệt cho thú cưng có nhu cầu đặc thù.', N'https://megapet.vn/wp-content/uploads/2021/02/gel-dinh-duong-cho-cho-Nuvita-768x768.jpg                                                                                                                 ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (8, N'Dụng cụ y tế ', N'Danh mục này chứa các dụng cụ y tế và sản phẩm dùng trong việc chăm sóc sức khỏe cho thú cưng như bộ chăm sóc răng miệng, kẹp móng, xịt chống côn trùng, băng gạc và các sản phẩm khác liên quan đến y tế thú cưng.', N'https://nld.mediacdn.vn/zoom/700_438/291774122806476800/2021/9/8/2704-meo-16310700426461865483800.jpg                                                                                                   ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (9, N'Quần Áo', N'Danh mục này bao gồm các sản phẩm quần áo dành cho thú cưng như áo len, áo khoác, áo sơ mi, áo thể thao, váy cho thú cưng và các loại quần áo khác để giữ ấm, tạo phong cách và bảo vệ thú cưng khỏi thời tiết khắc nghiệt.', N'https://vietgiftmarket.com/wp-content/uploads/2018/10/shop-quan-ao-cho-cho-meo.jpg                                                                                                                      ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (10, N'Đồ chơi', N'Danh mục này bao gồm các đồ chơi dành cho thú cưng như bóng, chuỗi răng, đồ chơi nạp nước, đồ chơi kích thích trí tuệ và các loại đồ chơi khác để giải trí và kích thích hoạt động của thú cưng.', N'https://petmaster.vn/wp-content/uploads/2020/06/1-9.jpg                                                                                                                                                 ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (11, N'Phụ kiện ', N'Danh mục này chứa các phụ kiện khác như vòng cổ, lồng và giường, bát ăn, bình nước, dây xích, áo mưa và các loại phụ kiện khác để chăm sóc và trang trí cho thú cưng.', N'https://vinpet.com.vn/wp-content/uploads/2020/12/mot-so-phu-kien-cung-nhu-dung-cu-can-thiet.jpg                                                                                                         ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (13, N'Vệ sinh', N'Danh mục này chứa các sản phẩm vệ sinh dành cho thú cưng như bột cát vệ sinh cho mèo, giấy thảm vệ sinh, nước tẩy mùi vệ sinh, bông tẩy tai, và các sản phẩm khác để giữ vệ sinh và sạch sẽ cho thú cưng', N'https://bizweb.dktcdn.net/thumb/grande/100/229/172/products/tam-lot-thuong1.jpg                                                                                                                         ')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (15, N'Chuồng và lồng', N'Danh mục này chứa các sản phẩm chuồng và lồng dành cho thú cưng như chuồng cho chó, lồng cho mèo, chuồng vận chuyển, và các loại chuồng và lồng khác để cung cấp nơi ở an toàn và thoải mái cho thú cưng.', N'https://vn-test-11.slatic.net/p/8a3a1ab9d0d66198c95250dde874bf03.jpg_800x800Q100.jpg                                                                                                                    ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'ASNGQWX4TX', CAST(N'2023-07-25' AS Date), N'0979276002', N'linh', N'Huyện Thạch Thất', N'Thành phố Hà Nội', N'Xã Yên Trung', N'phúc tiến ')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus01     ', CAST(N'2023-07-20' AS Date), N'0912345678', N'Nguyễn Thị Hường', N'Hai Bà Trưng', N'Hà Nội', N'Trương Định', N'Số 20, Ngõ 123, Đường Trần Khát Chân, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus02     ', CAST(N'2023-05-31' AS Date), N'0987654321', N'Trần Văn Nam', N'Ba Đình', N'Hà Nội', N'Liễu Giai', N'Số 15, Ngõ 456, Đường Kim Mã, Ba Đình, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus03     ', CAST(N'2023-05-31' AS Date), N'0909090909', N'Lê Thị Anh', N'Cầu Giấy', N'Hà Nội', N'Dịch Vọng', N'Số 30, Ngõ 789, Đường Xuân Thủy, Cầu Giấy, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus04     ', CAST(N'2023-05-31' AS Date), N'0977777777', N'Phạm Văn Đức', N'Hoàn Kiếm', N'Hà Nội', N'Hàng Trống', N'Số 5, Ngõ 987, Đường Lý Thái Tổ, Hoàn Kiếm, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus05     ', CAST(N'2023-05-31' AS Date), N'0966666666', N'Hoàng Thị Lan', N'Tây Hồ', N'Hà Nội', N'Quảng An', N'Số 12, Ngõ 654, Đường Âu Cơ, Tây Hồ, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus06     ', CAST(N'2023-05-31' AS Date), N'0922222222', N'Vũ Thị Hương', N'Long Biên', N'Hà Nội', N'Gia Thụy', N'Số 25, Ngách 321, Đường Nguyễn Văn Linh, Long Biên, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus07     ', CAST(N'2023-05-31' AS Date), N'0933333333', N'Đặng Minh Tú', N'Nam Từ Liêm', N'Hà Nội', N'Mễ Trì', N'Số 8, Ngõ 222, Đường Phạm Hùng, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus08     ', CAST(N'2023-05-31' AS Date), N'0944444444', N'Lương Văn Trung', N'Đống Đa', N'Hà Nội', N'Trung Liệt', N'Số 18, Ngõ 888, Đường Thái Hà, Đống Đa, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus09     ', CAST(N'2023-05-31' AS Date), N'0955555555', N'Trương Thị Thảo', N'Thanh Xuân', N'Hà Nội', N'Khương Trung', N'Số 6, Ngõ 555, Đường Nguyễn Trãi, Thanh Xuân, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus10     ', CAST(N'2023-05-31' AS Date), N'0966666666', N'Nguyễn Văn An', N'Hoàng Mai', N'Hà Nội', N'Vĩnh Hưng', N'Số 9, Ngõ 777, Đường Trương Định, Hoàng Mai, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'Cus11     ', CAST(N'2023-05-31' AS Date), N'0967891231', N'Lê Linh Chi', N'Cầu Giấy', N'Hà Nội ', N'Xuân Thủy', N'Số 10, ngõ 230, Xuân Thủy, Cầu Giấy, Hà Nội')
INSERT [dbo].[Customers] ([CustomerID], [CreateDate], [Phone], [Name], [District], [Province], [Wards], [Address]) VALUES (N'T5HBZMZ7XU', CAST(N'2023-07-20' AS Date), N'0986763483', N'Nguyễn Phúc Hưng', N'Huyện Hà Quảng', N'Tỉnh Cao Bằng', N'Thị trấn Thông Nông', N'Cao Bằng')
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (1, N'Nhân viên bán hàng', NULL)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (2, N'Kỹ thuật viên', NULL)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (3, N'Quản lý cửa hàng', NULL)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType]) VALUES (4, N'Kế toán viên', NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp01     ', N'Nguyễn', N'Linh', 1, N'Nhân viên bán hàng', CAST(N'2000-05-15' AS Date), CAST(N'2023-02-20' AS Date), N' Số 10, Đường Nguyễn Trãi, Hà Nội', N'0901234569')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp02     ', N'Trần', N'Thúy', 1, N'Nhân viên bán hàng', CAST(N'2002-07-25' AS Date), CAST(N'2023-02-20' AS Date), N'Số 10, Đường Trần Duy Hưng, Quận Cầu Giấy, Hà Nội', N'0976543210')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp03     ', N'Trần', N'Hoa', 1, N'Nhân viên bán hàng', CAST(N'2002-01-25' AS Date), CAST(N'2023-02-20' AS Date), N'Số 7, Ngách 321, Đường Nguyễn Văn Cừ, Quận Long Biên, Hà Nội', N'0976543210')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp04     ', N'Nguyễn', N'Hoàng', 1, N'Nhân viên bán hàng', CAST(N'2001-01-20' AS Date), CAST(N'2023-02-20' AS Date), N'Số 15, Đường Lê Đức Thọ, Quận Nam Từ Liêm, Hà Nội', N'0998765432')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp05     ', N'Nguyễn ', N'Anh', 1, N'Nhân viên bán hàng', CAST(N'2001-10-21' AS Date), CAST(N'2023-02-20' AS Date), N'Số 5, Ngõ 123, Đường Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội', N'0932468102')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp06     ', N'Nguyễn ', N'Hương', 4, N'Kế toán viên', CAST(N'1999-01-25' AS Date), CAST(N'2023-02-20' AS Date), N'Số 106, Đường Trần Duy Hưng, Quận Cầu Giấy, Hà Nội', N'0923456789')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp07     ', N'Nguyễn ', N'Dung', 4, N'Kế toán viên', CAST(N'2000-09-25' AS Date), CAST(N'2023-02-20' AS Date), N'Số 20, Đường Trần Thái Tông, Quận Đống Đa, Hà Nội', N'0976543210')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp08     ', N'Lê', N'Chi', 3, N'Quản lý cửa hàng', CAST(N'1996-07-19' AS Date), CAST(N'2023-02-20' AS Date), N'Số 5, Ngõ 123, Đường Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội', N'0998765321')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp09     ', N'Nguyễn', N'Bảo', 2, N'Kỹ thuật viên', CAST(N'1998-11-19' AS Date), CAST(N'2023-02-20' AS Date), N'Số 30, Ngõ 456, Đường Trần Phú, Quận Ba Đình, Hà Nội', N'0976543290')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp10     ', N'Trần ', N'Hưng', 2, N'Kỹ thuật viên', CAST(N'1999-12-10' AS Date), CAST(N'2023-02-20' AS Date), N'Số 30, Ngõ 456, Đường Trần Phú, Quận Ba Đình, Hà Nội', N'0976543990')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [BirthDate], [HireDate], [Address], [Phone]) VALUES (N'Emp11     ', N'Lê', N'Bảo', 3, N'Quản lý cửa hàng', CAST(N'1995-12-28' AS Date), CAST(N'2023-02-20' AS Date), N'Số 20, Đường Trần Thái Tông, Quận Đống Đa, Hà Nội', N'0976543876')
GO
INSERT [dbo].[Gallery] ([Id], [Title], [Description]) VALUES (1, N'Các loài chó cưng', N'Hình ảnh của các chú chó cưng đáng yêu.')
INSERT [dbo].[Gallery] ([Id], [Title], [Description]) VALUES (2, N'Các loài mèo cưng', N'Những bức ảnh đáng yêu của những chú mèo cưng.')
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 46.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (2, 3, 2145.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (3, 18, 1800.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (4, 19, 500.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (8, 14, 100.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (9, 16, 860.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10, 13, 165.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11, 8, 100.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (13, 5, 800.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14, 19, 250.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (15, 10, 50.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16, 17, 300.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (19, 1, 23.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (20, 9, 80.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (21, 14, 200.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (29, 22, 17.5000, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (1, N'Cus01     ', N'Emp01     ', CAST(N'2023-05-29' AS Date), CAST(N'2023-06-02' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (2, N'Cus01     ', N'Emp01     ', CAST(N'2023-05-29' AS Date), CAST(N'2023-06-02' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (3, N'Cus01     ', N'Emp02     ', CAST(N'2023-05-29' AS Date), CAST(N'2023-06-05' AS Date), N'Cancel')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (4, N'Cus01     ', N'Emp02     ', CAST(N'2023-05-29' AS Date), CAST(N'2023-06-03' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (8, N'Cus01     ', N'Emp03     ', CAST(N'2023-05-28' AS Date), CAST(N'2023-06-03' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (9, N'Cus01     ', N'Emp03     ', CAST(N'2023-05-28' AS Date), CAST(N'2023-06-02' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (10, N'Cus01     ', N'Emp03     ', CAST(N'2023-06-25' AS Date), CAST(N'2023-06-27' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (11, N'Cus01     ', N'Emp05     ', CAST(N'2023-05-26' AS Date), CAST(N'2023-05-29' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (13, N'Cus01     ', N'Emp05     ', CAST(N'2023-05-10' AS Date), CAST(N'2023-05-14' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (14, N'Cus01     ', N'Emp05     ', CAST(N'2023-05-03' AS Date), CAST(N'2023-05-07' AS Date), N'Delivered')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (15, N'Cus01     ', N'Emp03     ', CAST(N'2023-06-23' AS Date), CAST(N'2023-06-28' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (16, N'Cus01     ', N'Emp03     ', CAST(N'2023-06-28' AS Date), CAST(N'2023-06-28' AS Date), N'Complete')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (19, N'Cus01     ', N'Emp01     ', CAST(N'2023-06-27' AS Date), CAST(N'2023-06-29' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (20, N'Cus02     ', N'Emp01     ', CAST(N'2023-06-27' AS Date), CAST(N'2023-07-25' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (21, N'Cus03     ', N'Emp01     ', CAST(N'2023-06-27' AS Date), CAST(N'2023-06-28' AS Date), N'Complete')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [OrderStatus]) VALUES (29, N'ASNGQWX4TX', NULL, CAST(N'2023-07-25' AS Date), CAST(N'2023-08-01' AS Date), N'Future')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (1, 1)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (3, 2)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (5, 3)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (8, 4)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (9, 5)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (10, 6)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (13, 7)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (14, 8)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (15, 9)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (16, 10)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (17, 11)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (18, 12)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (19, 13)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (20, 14)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (22, 15)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (23, 16)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (24, 17)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (25, 18)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (27, 19)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (28, 20)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (29, 21)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (31, 22)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (33, 23)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (35, 24)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (36, 25)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (37, 26)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (38, 27)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (39, 28)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (40, 29)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (41, 30)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (42, 31)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (43, 32)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (44, 33)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (45, 34)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (46, 40)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (47, 36)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (48, 37)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (49, 38)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (50, 39)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (51, 40)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (52, 41)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (53, 42)
INSERT [dbo].[Picture_Products] ([ProductId], [PictureId]) VALUES (66, 54)
GO
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (1, 1, N'Chó Bull Dog', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Bulldog_inglese.jpg/1200px-Bulldog_inglese.jpg                                                                                                ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (2, 1, N'Chó Poodle', N'https://cdn.tgdd.vn/Files/2021/04/15/1343612/tim-hieu-giong-cho-poodle-nguon-goc-dac-diem-cach-nuoi-bang-gia-202104151500136042.jpg                                                                     ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (3, 1, N'Chó Corgi', N'https://vb.1cdn.vn/2023/04/02/cho-corgi-gia-re-duoi-1-trieu-leading.jpg                                                                                                                                 ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (4, 1, N'Chó Husky', N'https://toiyeucho.com/wp-content/uploads/2020/02/cho-husky-hong-phan.jpg                                                                                                                                ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (5, 2, N'Mèo Ba Tư', N'https://petmaster.vn/petroom/wp-content/uploads/2020/04/meo-ba-tu-2.jpg                                                                                                                                 ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (6, 2, N'Mèo Munchkin', N'https://cdn.tgdd.vn/Files/2021/04/23/1345766/meo-munchkin-chan-ngan-nguon-goc-dac-diem-gia-ban-202104231643494747.jpg                                                                                   ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (7, 2, N'Mèo Maine Coon', N'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2021/05/d1fd3656-meo-maine-coon-thumb.jpeg                                                                                                      ')
INSERT [dbo].[PictureGallery] ([PicId], [Id], [Caption], [Picture]) VALUES (8, 2, N'Mèo Anh Lông Ngắn', N'https://cdn.tgdd.vn/Files/2021/04/22/1345443/dac-diem-nhan-dien-cach-nuoi-meo-anh-long-ngan-202104221529108326.jpg                                                                                      ')
GO
SET IDENTITY_INSERT [dbo].[PictureProducts] ON 

INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (1, N'https://product.hstatic.net/200000264739/product/pate_lechat_917ea6b224b44c20a4982605d9af722a_master.jpg                                                                                                ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (2, N'http://cdn-img-v2.webbnc.net/uploadv2/web/12/12107/product/2019/10/18/10/41/1571395307_medium-pp-4kg.jpg?v=4                                                                                            ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (3, N'https://cf.shopee.vn/file/f94145f8ed70bb716fe787382f579f9d                                                                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (4, N'https://www.vietpet.net/wp-content/uploads/2020/01/bang-gac-y-te-cho-cho-meo-andover-healthcare-petflex-bitter-no-chew-dog-cat-small-animal-bandage.jpg                                                 ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (5, N'https://cdn-images.kiotviet.vn/petnow/785b5bd2640f435fa248fcb71a481f57.png                                                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (6, N'https://miluxinh.com/wp-content/uploads/2022/05/204-thu-nhoi-bong-3-600x600.jpg                                                                                                                         ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (7, N'https://s.alicdn.com/@sc04/kf/Hd4bc6dad133c4043875b0f3baf7f05cdH.jpg_960x960.jpg                                                                                                                        ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (8, N'https://cdn-download.kiotviet.vn/kiotvietimages/richiepetshop/247dd0a417ab4af9b69a9bade1e77964.jpeg                                                                                                     ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (9, N'https://cdn-download.kiotviet.vn/kiotvietimages/richiepetshop/b11d9fcb7bf94a7ca3dd602c1134a9f6.jpg                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (10, N'https://cdn-images.kiotviet.vn/richiepetshop/727c62cf93eb46e792072d5d36b96946.jpg                                                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (11, N'https://cdn-download.kiotviet.vn/kiotvietimages/richiepetshop/b7e051f5aa2b444eb0ccd32d357bafa1.jpg                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (12, N'https://cdn-images.kiotviet.vn/richiepetshop/833edf1d513c4be39f35e88fa08c4024.png                                                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (13, N'https://cdn-images.kiotviet.vn/richiepetshop/de1a7112f8364bb7b306b6e6447df0c8.png                                                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (14, N'https://paddy.vn/cdn/shop/products/pate-tuoi-cho-meo-the-pet.jpg?v=1679653183                                                                                                                           ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (15, N'https://paddy.vn/cdn/shop/files/1_78c33f70-06c0-46ef-b797-ee0902a8c6c0.png?v=1682400862                                                                                                                 ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (16, N'https://paddy.vn/cdn/shop/products/1_0562d429-4113-4776-9813-444346768fca.jpg?v=1668769797                                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (17, N'https://paddy.vn/cdn/shop/products/pate-meowow-ca-ngu-trang-cho-meo-moi-lua-tuoi-lon-80g-paddy-3.jpg?v=1683386824                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (18, N'https://paddy.vn/cdn/shop/products/minipuppy800g.jpg?v=1687183713                                                                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (19, N'https://paddy.vn/cdn/shop/products/hat-pedigree-puppy-cho-cho-con-vi-ga-and-trung-paddy-1.jpg?v=1660972323                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (20, N'https://paddy.vn/cdn/shop/products/hat-royal-canin-cho-cho-chihuahua-nho-chihuahua-puppy-paddy.jpg?v=1687183940                                                                                         ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (21, N'https://paddy.vn/cdn/shop/products/hat-smartheart-puppy-vi-bo-and-sua-cho-cho-con-paddy-3.jpg?v=1662875895                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (22, N'https://paddy.vn/cdn/shop/products/vien-nhai-tri-ve-xo-giun-ngua-ghe-cho-cho-nexgard-spectra-paddy-7.jpg?v=1660975353                                                                                   ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (23, N'https://paddy.vn/cdn/shop/products/5-1673107471204.jpg?v=1673424008                                                                                                                                     ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (24, N'https://paddy.vn/cdn/shop/files/00eeecde1134744ff691578a59275d31.jpg?v=1685441443                                                                                                                       ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (25, N'https://paddy.vn/cdn/shop/products/vong-co-chong-ran-ngan-ngua-va-diet-ve-ran-bo-chet-cho-cho-bioline-paddy-1.jpg?v=1660975439                                                                          ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (26, N'https://bizweb.dktcdn.net/100/362/345/products/51b4bzkoygl-sl1500.jpg?v=1568923741940                                                                                                                   ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (27, N'https://bizweb.dktcdn.net/100/362/345/products/3de65b61cb2ab27614b5a8988613f9e1.jpg?v=1569720162707                                                                                                     ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (28, N'https://paddy.vn/cdn/shop/products/11_38b042c6-9509-45fd-aa62-9d127169be48.jpg?v=1670487868                                                                                                             ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (29, N'https://paddy.vn/cdn/shop/products/1_2a42b578-a2eb-4345-99f8-80021abff8d4.jpg?v=1669700917                                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (30, N'https://paddy.vn/cdn/shop/products/ao-thun-3-lo-cute-cho-cho-meo-paddy-4.jpg?v=1670488219                                                                                                               ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (31, N'https://paddy.vn/cdn/shop/products/thu-bong-djo-choi-cho-cho-paddy-4.jpg?v=1681897299                                                                                                                   ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (32, N'https://paddy.vn/cdn/shop/products/chuong-bam-tron-huan-luyen-cho-meo-paddy-1.jpg?v=1662875528                                                                                                          ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (33, N'https://paddy.vn/cdn/shop/products/can-cau-meo-djinh-chuong-long-vu-paddy-1.jpg?v=1662875263                                                                                                            ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (34, N'https://paddy.vn/cdn/shop/products/7_32605fca-511d-4096-a405-0e7fbc280a59.jpg?v=1666172189                                                                                                              ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (35, N'https://paddy.vn/cdn/shop/products/luoc-chai-long-cho-meo-pakeway-co-nut-bam-tach-long-tien-loi-paddy-1.jpg?v=1660972960                                                                                ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (36, N'https://paddy.vn/cdn/shop/products/day-dat-cho-meo-yem-thoang-khi.jpg?v=1679026975                                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (37, N'https://paddy.vn/cdn/shop/files/den-led-gan-vong-co-cho-meo-Laroo.jpg?v=1685786779                                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (38, N'https://paddy.vn/cdn/shop/products/kem-cat-mong-tay-co-djen-led-tien-dung-cho-cho-meo-paddy-2.jpg?v=1662875907                                                                                          ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (39, N'https://paddy.vn/cdn/shop/products/ta-quan-cho-cho-cai-altimate-diaper-hong-paddy.jpg?v=1660974995                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (40, N'https://paddy.vn/cdn/shop/files/balo-cho-meo-1.jpg?v=1687410321                                                                                                                                         ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (41, N'https://paddy.vn/cdn/shop/products/balo-cho-meo-gogo.jpg?v=1670476109                                                                                                                                   ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (42, N'https://paddy.vn/cdn/shop/products/chuong-quay-cho-meo-6-tam-ghep.jpg?v=1679026193                                                                                                                      ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (52, N'https://bizweb.dktcdn.net/100/346/633/files/thuc-a…a-ngu-whiskas-junior-tuna-85g.png?v=1557281433899                                                                                                    ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (53, N'https://product.hstatic.net/200000264739/product/hat_anf_-6_free_adult_cat_cho_meo_33534b3bfe9145cd8be500085ed96378_master.jpg                                                                          ')
INSERT [dbo].[PictureProducts] ([PictureId], [Picture]) VALUES (54, N'https://bizweb.dktcdn.net/100/346/633/files/thuc-an-cho-meo-con-vi-ca-ngu-whiskas-junior-tuna-85g.png?v=1557281433899                                                                                   ')
SET IDENTITY_INSERT [dbo].[PictureProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (1, N'Pate Lechat Exellence Mousse Rich', 1, 4, 23.0000, 0, N'Pate Lechat Exellence Mousse Rich 85g là thức ăn nổi tiếng dạng mousse dành cho mèo từ Ý với những thành phần tươi ngon nhất, tuyệt hảo nhất.', 1, NULL, CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (3, N'Hạt Royal Canin Medium Puppy 4kg ', 2, 20, 715.0000, 0, N'Những giống chó kích cỡ Medium trong khoảng 11 - 25kg được biết đến có nguồn năng lượng dồi dào vì đa số giống chó này được sử dụng hỗ trợ trong các công việc của con người từ rất lâu. Cho dù giống chó size Medium này được nuôi trong nhà hay dành thời gian hoạt động ngoài trời, với  thức ăn cho chó ROYAL CANIN Medium Puppy sẽ giúp chúng duy trì khả năng phòng thủ tự nhiên tốt hơn, đồng thời cung cấp năng lượng cân bằng cho giống chó này giúp duy trì trọng lượng khỏe mạnh', 1, NULL, CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (5, N'Viên uống hỗ trợ khử mùi giải độcNatural', 6, 20, 400.0000, 0, N'Ba mẹ thường chỉ lo lắng khi thấy vật cưng của mình ăn uống kém, không đòi ăn. Chứ ít khi nghĩ vật cưng đang ăn, uống thức ăn không phù hợp với sinh lý và cũng để xảy ra nhiều lý do khác dẫn tới sự tiêu hóa kém, táo bón, mà như vậy đường ruột không được tẩy sạch và không loại thải hết độc tố. Các chất độc không bị loại thải ra khỏi cơ thể, tích tụ lâu ngày, chúng sẽ gây nên các bệnh mãn tính, dị ứng, lông da đặc biệt làm suy yếu các cơ quan gan - tụy, thận, tim mạch.', 1, CAST(N'2023-05-25' AS Date), CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (8, N'Băng gạc y tế', 8, 1000, 50.0000, 0, N'Băng gạc y tế không dính, được sử dụng để băng bó vết thương và vết cắt nhỏ.', 1, CAST(N'2023-05-25' AS Date), CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (9, N'Áo hai dây gấu và que kem', 9, 10, 80.0000, 0, N' khi shop ghi chất liệu là NỈ / LÔNG/ NHUNG / .... thì các chất vải này ÍT CO GIÃN nên khi bé của bạn bắp tay to / bụng béo / lưng dài / chân lùn ngắn/....thì nên cân nhắc lên thêm 1 size hoặc chỉ nên mua các loại vải thun để mặc

𝒔𝒐̂́ đ𝒐:  theo thứ tự size áo / vòng ngực/ chiều dài / số cân ước lượng
XS 30 / 20 / 500gr - 1.5kg
S 35 / 25 / 1.6 - 2.5kg
M 40 / 30/ 2.6kg - 4kg
L 45 / 35 / 4kg - 5.5kg
XL 50 / 38 / 5.6kg - 7.5kg
XXL 55 / 42 / 7.6kg - 10kg', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (10, N'Đồ chơi cao su hình ngôi sao cho chó', 10, 20, 25.0000, 0, N'Việc cho chó chơi đồ chơi là một giải pháp tuyệt vời giúp cún cưng của bạn trở nên nhanh nhẹn, hoạt bát hơn. Không những thế nó còn giúp cún cưng hạn chế cắn phá các vật dụng trong nhà. Chúng sẽ trở nên ngoan ngoãn và vâng lời hơn. Nếu bạn đang băn khoăn chưa biết lựa chọn loại đồ chơi nào phù hợp trong vô vàng các sản phẩm đa dạng mẫu mã trên thị trường hiện nay. Thì trong bài viết này Miluxinh sẽ xin gợi ý đến bạn món đồ chơi chó ngôi sao cao su đặc nhiều màu. Chắc chắn đây là sẽ món đồ chơi mà khiến thú cưng của bạn mê mẩn suốt ngày.  ', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (13, N'Bàn chải tắm silicon gấu trúc', 11, 30, 55.0000, 0, N'Bàn chải silicon mềm mại giúp làm sạch chó mèo, không gây đau rát', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (14, N'Sữa tắm Yoko cao cấp 55ml', 13, 10, 50.0000, 0, N'Với sự kết hợp tinh tế từ những hương thơm dịu nhẹ của hoa cỏ, YOKO tin rằng sẽ đem lại cảm giác tươi mát, năng động nhưng xen lẫn một chút ấm áp, giúp thú cưng luôn thoải mái và thơm tho mọi lúc mọi nơi.

Lấy cảm hứng từ mùa Xuân, Hạ, Thu, Đông, sữa tắm YOKO tin rằng sẽ đem đến trải nghiệm khó quên theo từng mùa trong năm. Đồng thời với các dưỡng chất thiên nhiên kết hợp vitamin giúp nuôi dưỡng da và lông mềm mượt, khử mùi, kháng khuẩn, lưu hương lâu và đặc biệt an toàn với thú cưng của bạn.

Cảm ơn bạn đã là những khách hàng đầu tiên trải nghiệm và tin chọn YOKO. Đừng quên cùng YOKO lan tỏa yêu thương và chăm sóc đặc biệt nhất dành cho thú cưng của bạn thời gian tới nữa nha!', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (15, N'Xịt Bioline khử trùng', 13, 30, 120.0000, 0, N'Xịt khử trùng kháng khuẩn Bioline 500ml
Chai xịt làm sạch mùi hôi diệt khuẩn, diệt mầm bệnh, sát trùng không gian
Tinh dầu thông mang lại cảm giác mát lạnh, sạch sẽ.
Khử mùi tuyệt đối mùi khó chịu của chó mèo
Giúp triệt tiêu vi khuẩn, giữ không gian trong lành, mát mẻ
Tiêu diệt vi khuẩn trong không gian sống, không gian ở của thú cưng ở
Tiêu diệt virus, nấm, trong chuồng nuôi hay các nơi dơ bẩn
Hdsd: Xịt trực tiếp vào vị trí muốn xịt hoặc trên cơ thể vật nuôi', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (16, N'Nhà vệ sinh cho mèo cửa tròn', 13, 10, 430.0000, 0, N'1. Trọng lượng: 1.7kg
2. Chất liệu: nhựa PP an toàn, không gây kích ứng
3. Xuất xứ: Thượng Hải
4. Kích thước: 34*41*38CM
5. Thiết kế rộng rãi có thể dùng được cho mèo trên 10kg
ƯU ĐIỂM NHÀ VỆ SINH CHO MÈO
- Dễ dàng lắp ráp
- Thiết kế 2 cửa tiện lợi tuỳ theo sở thích mọi bé mèo

- Thiết kế keo khay cát, dễ dàng dọn dẹp thay cát. Không cần mở nắp

- Có cửa ngăn giúp hạn chế phát tán mùi hôi và tránh văng cát khi mèo lấp

- Bệ ra vào thiết kế lổ tròn: trong quá trình mèo ra vào, cát vệ sinh dính vào lòng bàn tay chân sẽ rơi ra tại đây. Giúp mèo giữ gìn vệ sinh, không bị liếm phải cát, và hạn chế viêm da

- Mèo nhỏ vẫn có thể sử dụng dễ dàng. 

Nhà vệ sinh vừa với mèo trên 10kg', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (17, N'Cát đậu nành Cature Domestic 6L ', 13, 20, 150.0000, 0, N'Đặc biệt: Giá thành của sản phẩm này mềm hơn so với thị trường rất nhiều 
😘Đương nhiên không vì thế mà chất lượng kém đi đâu ạ, thậm chí còn rất được ưa chuộng vì những tính năng và công dụng tuyệt vời 👍 của sản phẩm: 
😍Đầu tiên, phải nói đến sự thấm hút đỉnh cao và khử mùi siêu siêu tốt, khóa chặt "chất thải vệ sinh" cực tốt. Vón cục nhanh trong vòng 3s. Tính năng này thì ẻm là lựa chọn số 1️⃣
😍Thành phần hoàn toàn tự nhiên, không gây kích ứng với những bé mèo nhạy cảm. 
😍Hoàn toàn thân thiện với môi trường, có thể xả trong toilet, phân hủy sinh học. 
😍Ngoài ra, cát hoàn toàn không gây bụi và không dính chân mèo, không lo bẩn nhà nhé các Sen ơi
👉Có 2 dòng sản phẩm: 
💛Màu vàng: Cát đậu nành, hoàn toàn tự nhiên, khử mùi và vi khuẩn cực tốt', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (18, N'Chuồng mèo hai tầng Petland', 15, 5, 1800.0000, 0, N'Chuồng mèo siêu cao cấp kích thước lớn, có tầng để mèo thoải mái leo trèo và hoạt động. Một ngôi nhà an toàn và hoàn hảo cho mèo khi bạn phải ra ngoài không có thời gian chăm giữ bé. Kích thước: M - 75*54*170cm

Ngoài ra, lồng có bánh xe và khay nhựa dễ dàng vệ sinh chỉ với vài thao tác tháo lắp đơn giản

Chất liệu khung sắt tĩnh điện kết hợp với nhựa PVC cao cấp, chắc chắn, màu sắc bắt mắt, sang trọng', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (19, N'Dung dịch vệ sinh tai TropiClean', 13, 10, 250.0000, 0, N'Ệ SINH TAI CHÓ MÈO SIÊU DỄ CHỈ 1’30S
Với vệ sinh tai không cồn Ear Wash.
---
Tai của các con là vùng khó vệ sinh, thường bị:

- Nước đọng sau khi tắm
- Lông tai bết do ráy tai tích tụ
- Ẩm ướt nên vi khuẩn dễ làm tổ.
- Để lâu có thể gây #mùi_hôi tai, ve rận kí sinh, bé bị viêm tai và ngứa ngáy!', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (20, N'Pate TƯƠI The Pet Cho Chó Mèo Biếng Ăn', 1, 100, 95.0000, 0, N'Pate Tươi Cho Mèo Hỗn Hợp cho Chó Mèo Biếng Ăn được làm từ hỗn hợp cá biển và gan gà tươi nguyên chất thích hợp dùng cho Chó Mèo.

CHẤP HẾT TẤT CẢ MÈO BIẾNG ĂN, KHÓ ĂN, KÉN MỌI LOẠI THỨC ĂN.
💯 100% nguyên liệu tự nhiên, không độn rau củ, chứa độ ẩm & đạm tự nhiên cao từ 60-84%.
💯 Năng lượng cao hơn vượt trội so với các dòng sản phẩm khác trên thị trường (trung bình ở mức 400kcal/kg).
💯 Công thức siêu cấp nước, giúp ngăn ngừa sỏi thận.
💯 Với giá chỉ từ 8k/bữa ăn là Boss đã có được bữa ăn thơm ngon, tốt cho sức khỏe.
💯 Chỉ cần bảo quản sản phẩm trong ngăn mát, không cần chế biến hay hâm nóng.

Paddy có sẵn có 2 mùi vị thơm ngon #BestSeller, hấp dẫn các bé kén ăn
✅ Hỗn Hợp Gà - cho Chó & Mèo
✅ Hỗn Hợp Cá - cho Mèo
✅ Hỗn Hợp Gà - cho Chó & Mè', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (22, N'Pate Cho Mèo Dạng Thạch Nekko', 1, 999, 17.5000, 0, N'1. Giới thiệu về pate Nekko cho mèo 70g:
Pate Nekko được làm từ 100% thực thịt và cá thật, chất lượng cao và đã được lựa chọn là tốt. Những chú mèo rất thích hương vị của cá, thịt và phô mai trong các loại pate Nekko. Sản phẩm chứa các vitamin và khoáng chất cần thiết cho con mèo yêu quý của bạn.

2. Công dụng và ưu điểm của pate Nekko:
- Nuôi dưỡng làn da và duy trì một lớp lông mượt cho mèo.
- Nuôi dưỡng mắt và hệ thần kinh của mèo', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (23, N'Pate Mèo Kings Pet Cá Ngừ', 1, 1000, 25.0000, 0, N'- Sản phẩm Pate cá ngừ Jelly King’s Pet By với 70% là cá ngừ thịt trắng được đánh bắt tại vùng biển miền Nam Việt Nam.
- Cá được đánh bắt và chế biến trong ngày theo tiêu chuẩn sản xuất khép kín từ thuyền đến xưởng sản xuất nhằm giữ nguyên độ tươi ngon của cá.
- Khi mở nắp hộp Pate cá ngừ Jelly King’s Pet sẽ cảm nhận rõ ràng được mùi thơm tươi mới của thành phần khác biệt so với mùi tanh như các dòng sản phẩm thông thường.
- Cam kết 100% cá ngừ tươi đi thẳng từ vùng biển đánh bắt đến nhà máy, không qua quá trình đông lạnh hay bảo quản dài ngày.
- Đồng thời nguyên liệu tươi ngon còn giúp sản phẩm tuyệt đối không cần dùng thêm các loại phụ liệu hóa học, chất độn hay mùi hương nhân tạo để kích thích vị giác của mèo.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (24, N'Pate Mèo Meowow Súp Cá Ngừ', 1, 1000, 25.0000, 0, N'Cá ngừ thịt trắng đóng hộp Tuna White Meat là món ăn nhẹ giàu dinh dưỡng, hỗ trợ cho sự phát triển toàn diện của mèo, đồng thời được mix vị với nhiều loại thịt khác để tăng hàm lượng dinh dưỡng cũng như hương vị thơm ngon.

- Sử dụng thịt cá ngừ trắng tươi, miếng cá mềm, kích thước nhỏ vừa ăn. Các thành phần mix cùng như tôm tươi nguyên con, cá cơm sữa Nhật Bản, thịt cua, cá hồi nguyên thớ và gà xé sasami.

- Dành cho mọi lứa tuổi, kể cả mèo con, mèo lớn tuổi và mèo có hệ tiêu hóa nhạy cảm.

- Giàu DHA, omega-3, giúp mèo sáng mắt, mượt lông.

- Bổ sung taurin, tốt cho tim mạch và trí não.

- Cấp nước cho chế độ ăn hằng ngày, đặc biệt phù hợp với những chú mèo ít uống nước.

- Hộp nhôm hút chân không hiện đại, giữ sản phẩm tươi ngon.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (25, N'Hạt Royal Canin Mini Puppy Cho Chó', 2, 200, 215.0000, 0, N'Thức ăn cho chó RC Mini Puppy LÀ SẢN PHẨM THỨC ĂN KHÔ CHO CHÓ CON CỠ NHỎ DƯỚI 10 THÁNG TUỔI CÓ TRỌNG LƯỢNG 4 - 10KG - Vì khả năng tiêu hóa của giống chó nhỏ phát triển khá chậm nên sử dụng Thức ăn cho chó RC Mini Puppy cung cấp năng lượng cao trong thời kỳ phát triển ngắn ngủi mạnh mẽ. Thức ăn cho chó RC Mini Puppy đã kết hợp các nguồn dinh dưỡng từ các protein dễ tiêu hóa với các men vi sinh giúp tăng cường hệ tiêu hóa tối ưu, giúp cơ thể dễ hấp thu chất dinh dưỡng, hỗ trợ tiêu hóa Thêm vào đó, Mini Puppy còn giúp tăng sức đề kháng tự nhiên của chó con với hợp chất chống oxy hóa chứa trong các hạt thức ăn chó hình dạng 3 góc giúp giảm hình thành cao răng. Đối Tượng Sử Dụng:Chó con cỡ nhỏ dưới 10 tháng tuổi có trọng lượng từ 4 - 10kg (9 – 22 lbs).', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (27, N'Hạt Pedigree Puppy Cho Chó Con', 2, 200, 118.0000, 0, N'Hương vị gà và trứng thơm ngon với nhân sữa bên trong, giúp cún ăn ngon miệng.
Cung cấp đủ vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giiúp cún cưng phát triển khỏe mạnh,
Bổ sung DHA và Choline rất cần thiết cho sự phát triển của não bộ, để cún thật thông minh, lanh lợi.
Sản phẩm chứa nhiều canxi và phốt pho, giúp cho răng và xương cún chắc khỏe.
Hạt nhỏ, vỏ mỏng giòn, nhân sữa thơm ngon giúp cún với hàm răng nhỏ chưa phát triển cứng cáp cũng có thể ăn dễ dàng.
Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa.
Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị,
Nhiều định lượng để bạn lựa chọn tùy theo nhu cầu của cún.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (28, N'Hạt Royal Canin Cho Chó Chihuahua', 2, 100, 165.0000, 0, N'Sản phẩm dinh dưỡng dành riêng cho giống chó Chihuahua với hình dáng hạt được thiết kế dành riêng cho giống chó này. Nguồn dinh dưỡng đặc biệt được các nhà khoa học nghiên cứu và dựa trên kinh nghiệm từ các nhà nhân giống thế giới.

Kích thích sự thèm ăn
Hình dạng nhỏ gọn nhỏ gọn thích hợp cho hàm nhỏ
Giảm phân và mùi hôi
Hỗ trợ sức khỏe hệ miễn dịch
100% dinh dưỡng cân bằng
100% đảm bảo an toàn
Thức ăn cho chó ROYAL CANIN CHIHUAHUA PUPPY được thiết kế dành riêng cho giống chó Chihuahua từ 8 tuần đến 8 tháng.
Hình dáng hạt', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (29, N'Hạt Smartheart Puppy Vị Bò & Sữa', 2, 1000, 30.0000, 0, N'Thức ăn hạt cho chó con Smartheart Puppy vị bò & sữa

Công dụng của Smartheart Puppy:

- Tăng cường phát triển trí não

- Giúp tim mạch khỏe mạnh

- Đẹp da, mượt lông

- Tăng cường hệ thống miễn dịch

- Hệ thống tiêu hóa khỏe mạnh

- Xương và răng chắc khỏe

Thành phần: Gạo, thịt heo, đậu nành, mỡ gà, bột củ cải, dầu cá, chất thay thế sữa, dầu cá, DHA, omega 3…

Xuất xứ: Thái Lan', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (31, N'NexGard Trị Ve Rận Cho Chó', 6, 10, 120.0000, 0, N'Với công dụng trừ ve rận bọ chét và ghẻ Demodex, Sarcoptes, Viên Nhai diệt ve rận NexGard Phòng & Trị Ve, Rận, Ghẻ Cho Chó có tác dụng kéo dài lên đến 30 ngày, chủ nuôi sẽ thấy hiệu quả ngay sau 24-36 giờ sử dụng. Ve rận bọ chét sẽ chết khô trên da và dễ dàng loại bỏ sau những lần tắm. Vết ngứa và mẩn đỏ da do ghẻ sẽ thuyên giảm hẳn sau lần sử dụng thuốc đầu tiên.

NexGard giúp Phòng & Trị Ve, Rận, Ghẻ Cho Chó có 4 loại bao gồm:

chó 2-4kg

chó 4-10kg

chó 10-25kg

chó 25-50kg,

Dễ dàng cho chủ nuôi lựa chọn loại phù hợp với cân nặng của chó. Hộp thuốc có 6 viên được đóng bao bì riêng lẻ cho từng viên, rất tiện dụng cho việc sử dụng và bảo quản thuốc', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (33, N'Viên Nhai Spirit Bổ Sung Dưỡng Chất', 6, 200, 130.0000, 0, N'- Nên dùng vào buổi sáng sớm, kết hợp phơi nắng trước 8h sáng giúp cún chắc khỏe xương, phòng ngừa các bệnh về da. Canxi cần kết hợp với Vitamin D từ ánh sáng mặt trời mới giúp hấp thụ tốt vào cơ thể.

- Phòng ngừa thiếu hụt canxi, hạ bàn, bại liệt, chân yếu ở chó...

VIÊN SPIRIT BỔ SUNG KHOÁNG CHẤT

- Bổ sung chất khoáng cần thiết cho cơ thể các bé cún. - Những bé cún thiếu khoáng thường có biểu hiện ăn cỏ, ăn đất, ăn phân, ăn vôi tường... cần bổ sung thêm viên vitamin và viên khoáng chất cho cún.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (35, N'Bột Mỡ Bò Grau', 6, 30, 599.0000, 0, N'Mỡ Bò GRAU Nhập khẩu Đức với hàm lượng dinh dưỡng cao cho chó Mèo Hay còn được gọi theo tên tiếng Việt cho dễ hiểu là mỡ bò, là sản phẩm giàu Protein. Protein giúp cơ thể mèo phát triển cơ bắp và chắc khoẻ nang lông, nhờ đó có một bộ lông mượt, xốp và hạn chế gẫy rụng. Hiệu quả nhhất là mấy đứa biếng ăn, lớn phổng lên như thánh gióng luôn ạ Sản phẩm vô cùng cần thiết cho chó mèo chuẩn bị mang thai, đang mang thai và cho con bú', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (36, N'Vòng Cổ Diệt Ve Rận Bọ Chét', 8, 30, 60.0000, 0, N'Các thành phần hoạt động đặc biệt là hoạt chất margosa được tiết ra liên tục và lan truyền qua các lông và da khi đeo, hoạt động như một thay thế tự nhiên với các dược phẩm hóa học giúp phòng, chống ve, rận, bọ chét và các ký sinh trùng hiệu quả. Sản phẩm thích hợp với vật nuôi 12 tuần tuổi trở lên. Hiệu quả sử dụng kéo dài đến 2 tháng và an toàn với sức khỏe thú nuôi.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (37, N'Nẹp Chân Cún Mèo [Chân Sau]', 8, 2, 2200.0000, 0, N'Các thành phần hoạt động đặc biệt là hoạt chất margosa được tiết ra liên tục và lan truyền qua các lông và da khi đeo, hoạt động như một thay thế tự nhiên với các dược phẩm hóa học giúp phòng, chống ve, rận, bọ chét và các ký sinh trùng hiệu quả. Sản phẩm thích hợp với vật nuôi 12 tuần tuổi trở lên. Hiệu quả sử dụng kéo dài đến 2 tháng và an toàn với sức khỏe thú nuôi.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (38, N'Dụng Cụ Cạo Vôi Răng', 8, 10, 80.0000, 0, N'Các thành phần hoạt động đặc biệt là hoạt chất margosa được tiết ra liên tục và lan truyền qua các lông và da khi đeo, hoạt động như một thay thế tự nhiên với các dược phẩm hóa học giúp phòng, chống ve, rận, bọ chét và các ký sinh trùng hiệu quả. Sản phẩm thích hợp với vật nuôi 12 tuần tuổi trở lên. Hiệu quả sử dụng kéo dài đến 2 tháng và an toàn với sức khỏe thú nuôi.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (39, N'Áo Cho Chó Mèo Trắng Đỏ', 9, 100, 50.0000, 1, N'🐾 CHẤT LIỆU
- Chất vải nỉ êm ái, ấm áp cho thú cưng

🐾 GỢI Ý CHỌN SIZE
RỘNG NGỰC*DÀI LƯNG (Trọng lượng của bé)
- S: 25cm*35cm (1~2.5kg)
- M: 30cm*40cm (2.5~4kg)
- L: 35cm*45cm (4~5kg)
- XL: 40cm*50cm (5~7kg)


***Với áo lẻ: tham khảo độ rộng vòng ngực
***Với set áo kèm quần: tham khảo độ dài lưng
', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (40, N'Khăn Len Noel Santa', 9, 2, 69.0000, 1, N'Khăn Len Noel Santa Cho Chó Mèo nằm trong bộ sưu tập Noel của Paddy 2022

Sản phầm phù hợp với hâu hết các giống chó mèo

Chỉ có màu đỏ hình Santa', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (41, N'
Áo Cho Chó Mèo Vải Thun 3 Lỗ', 9, 10, 45.0000, 1, N'🐾 CHẤT LIỆU
- Vải thun cotton mỏng nhẹ in hình ảnh sắc nét, chất vải êm ái, thoáng mát

🐾 GỢI Ý CHỌN SIZE
RỘNG NGỰC*DÀI LƯNG (Trọng lượng của bé)
- XS : 20cm*30cm (0.3~0.5kg)
- S: 25cm*35cm (1.5~2.5kg)
- M: 30cm*40cm (2.5~4kg)
- L: 35cm*45cm (4.5~5kg)
- XL: 40cm*50cm (5.5~7kg)
- 2XL: 45cm*55cm (7~9.5kg)
***Với áo lẻ: tham khảo độ rộng vòng ngực
***Với set áo kèm quần: tham khảo độ dài lưng
', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (42, N'Thú Bông Có Tiếng Kêu', 10, 10, 30.0000, 1, N'Thú Nhồi Bông Dễ Thương Đồ Chơi Nhai Gặm Cho Chó

- Thú bông nhiều mẫu mã dễ thương dành cho chó cưng
- Có âm thanh thu hút Boss chơi đùa, tăng khả năng vận động và giảm stress.

Chất liệu: polyester, cotton', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (43, N'Chuông Bấm Tròn Huấn Luyện Chó Mèo', 10, 10, 40.0000, 1, N'Chuông Clicker Huấn Luyện Chó Mèo


Giúp các sen dễ dàng dạy các bé cún hoặc mèo làm theo hiệu lệnh

Hướng dẫn sử dụng:

- Dạy các bé làm theo hiệu lệnh, có treat thưởng mỗi khi các bé thực hiện đúng hiệu lệnh

- Thời gian đầu tập, các bố mẹ nên cầm tay các bé để các bé có thể biết được hành động cần làm', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (44, N'Cần Câu Mèo Đính Chuông Lông Vũ', 10, 5, 30.0000, 1, N'Đồ chơi cần câu Mèo bằng thép gắn lông dành cho mèo
- Cần với chất liệu thép dẻo bền, có thể uốn cong mà không gây gãy
- Thép dẻo tạo độ chuyển động tự nhiên kích thích mèo của bạn chơi đùa vận động
- Đồ chơi cho mèo cần câu mèo có tác dụng kích thích vận động ở mèo, giúp chúng giải tỏa căng thẳng, mệt mỏi, từ đó
giúp phát triển sức khỏe cũng như não bộ.
- Đối với những chú mèo nghịch ngợm thì swing cat còn có sức hút kéo chúng khỏi việc cào cắn đồ đạc trong nhà', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (45, N'
Banh Lồng Chuột Đồ Chơi Cho Mèo', 10, 2, 45.0000, 1, N'Mô Tả Sản Phẩm Bóng Lồng Sắt Có Chuột Cho Mèo

– Mèo sinh ra đã có tập tính vờn bắt, nên việc mua cho bé nhà mình một món đồ chơi như Bóng Lồng Sắt Có Chuột Cho Mèo là sự lựa chọn hoàn hảo

– Bạn không cần bỏ ra quá nhiều thời gian chơi cùng với các bé, chỉ cần một quả bóng mèo nhà bạn có thể tự chơi

– Chất liệu: Kim loại tốt. Không làm ảnh hưởng răng của thú cưng khi cắn/ngoạm.

– Đường kính bóng: ~6cm

– Màu sắc đa dạng, kích thích sự tò mò cũng như làm thú cưng của bạn hứng thú hơn khi chơi.

– Bạn cũng có thể sử dụng sản phẩm để chơi đùa cùng thú cưng, huấn luyện cho thú cưng cách bắt/tha đồ.

– Sản phẩm sẽ là một dụng cụ xả stress lý tưởng cho bạn, cũng như thú cưng

– Sản phẩm được làm bằng chất liệu cao cấp nên rất an toàn cho bé yêu nhà bạn', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (46, N'Lược Chải Lông Chó Mèo Pakeway', 11, 30, 135.0000, 0, N'- Làm bằng chất liệu tốt, bền. Dễ dàng lấy đi phần lông rụng nhưng vẫn tạo nên cảm giác thoải mái, dễ chịu cho thú cưng của bạn.

- Màu sắc đa dạng, bắt mắt. Sẽ làm thú cưng của bạn sẽ muốn được chải chuốt nhiều hơn nữa.

- Lược chải với đầu chải làm bằng nhựa được bo tròn ở các đầu chải tránh gây đau cho thú cưng của bạn.

- Thiết kế nút bấm phía trên lược giúp bạn dễ dàng loại bỏ lông còn dính trên đầu lược.

- Thao tác dễ dàng, đơn giản, ai cũng có thể dùng ^^ .

- Dễ dàng vệ sinh phần lược, giúp sau mỗi lần chải lông sẽ càng làm thú cưng của bạn thoải mái hơn nhiều.', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (47, N'Dây Dắt Yếm Thoáng Khí Diamond', 11, 100, 175.0000, 0, N'Dây Dắt Yếm Thoáng Khí Diamond Cho Chó Mèo

Set gồm 1 dây dắt + 1 đai yếm màu sắc ngẫu nhiên

Số 1 (1-3kg)
Số 2 (3-5kg)
Số 3 (5-7kg)', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (48, N'Đèn LED Rời Gắn Vòng Cổ Chó Mèo', 11, 100, 80.0000, 0, N'1. Ba chế độ sáng
2. Có thế gắn lên vòng cổ, dây dắt, yếm và nhiều chỗ khác
3. Chống thấm nước', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (49, N'Kềm Cắt Móng Tay Có Đèn LED', 11, 8, 150.0000, 0, N'Chất liệu: Nhựa + Đầu dao cắt bằng thép không gỉ, có đèn led giúp dễ dàng cắt móng cho thú

Kích thước:

Có hộp: 15 * 4.3cm
Xám Cam - Không hộp: 14 * 5.5cm', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (50, N'Tã Quần Cho Chó Cái Altimate Diaper', 13, 1000, 150.0000, 0, N'• Hiệu quả hút nước cao, hút nước thần tốc, có thể hút nước tiểu trong chớp mắt, nhanh chóng mở rộng bề mặt, ngăn cản thấm lại hiệu quả.
• Bên ngoài có một lớp màng chống nước, chống chảy ra kinh ngạc, lớp màng mỏng gần ra mặt sau, tầng đáy thoát nước polyethylene, ngăn nước tiểu chảy ra.
• Phòng ngừa vi khuẩn sinh sôi. Quần tã giấy sử dụng kỹ thuật công nghệ cai, hút nước tiểu, phòng ngừa nước tiểu sinh sôi vi khuẩn và chống mùi lạ

Size:
20 Miếng - Dưới 3.6kg
18 Miếng - 4-7 kg
13 Miếng - 7-15kg', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (51, N'Balo Phi Hành Gia Trong Suốt Vận Chuyển', 15, 20, 200.0000, 0, N'Balo phi hành gia cho thú cưng, balo phi hành gia trong suốt vận chuyển chó mèo

- Chất liệu: Nhựa cao cấp PVC
- Kích thước: 43*33*28cm
- Thích hợp với thú cưng dưới 7kg', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (52, N'
Balo Vải Vận Chuyển Chó Mèo Gogo', 15, 10, 200.0000, 0, N'Thông tin sản phẩm: 

- Balo chất lượng đảm bảo: độ thông gió cần thiết, an toàn và không gian rộng rãi với kích thước lớn có thể đựng được nhiều pet và pet nặng dưới 9kg.

- Thiết kế phong cách phối màu đáng yêu

- Nhiều lưới thoáng khí hai bên và trên trần balo giúp thú cưng không ngộp.

- Quai đeo chắc chắn và tỉ mỉ có đệm giúp sen không bị đau vai.

- Khóa kéo trượt êm ái.

- Kích thước: Cao 42 x Ngang 32cm x Rộng 22cm

 ', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (53, N'Bộ Chuồng Chó Mèo Quây Ghép', 15, 100, 450.0000, 1, N'Đặc điểm nổi bật của quây chó mèo sơn tĩnh điện
Thiết kế thông thoáng, không gian rộng sẽ tạo cho pet yêu của bạn cảm giác thoải mái, không cảm thấy bức bí. Bạn cũng có thể đặt thêm các dụng cụ khác như đồ chơi để chúng chơi hay tấm lót bên trong để có thể chúng không cảm thấy lạnh hoặc đơn giản cho sạch hơn, cũng sẽ rất tiện lợi.

Linh động, dễ dàng gấp gọn: Lồng quây được thiết kế có thể gấp gọn được, bởi vậy khi không cần sử dụng đến, hay khi di chuyển chúng ta có thể gấp gọn gàng lại được một cách rất dễ dàng, vừa ngăn nắp, vừa tiện lợi .

Công nghệ sơn tĩnh điện: Lồng quây này sử dụng công nghệ sơn tĩnh điện mang lại cho sản phẩm cực nhiều ưu điểm như: không dẫn điện, không sợ kim loại bị ăn mòn, ion hóa khi sử dụng nhiều ở ngoài trời, độ bền của sản phẩm cao hơn sơn thường rất nhiều, dễ dàng lau chùi, vệ sinh

Thiết kế thông minh - cơ động: có thể chủ động thu nhỏ diện tích lúc chó mèo còn nhỏ hoặc không gian hẹp', 1, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [Discontinued], [Description], [Status], [CreateDate], [UpdateDate]) VALUES (66, N'Pate Cho Mèo Con Whiskas Vị Cá Ngừ', 1, 100, 12.0000, 0, N'Pate Cho Mèo Con Whiskas Vị Cá Ngừ 85g là thức ăn dạng Pate đóng gói vị cá ngừ cho mèo, thơm ngon bổ dưỡng, nhập khẩu chính hãng từ Thái. Pate Cho Mèo Con Whiskas Vị Cá Ngừ 85g cung cấp dinh dưỡng hoàn chỉnh cho mèo nhỏ của bạn, được phát triển độc quyền cho nhu cầu năng lượng và dinh dưỡng cao hơn của mèo con. 

Pate Cho Mèo Con Whiskas Vị Cá Ngừ 85g có sẵn và được bán giá tốt nhất tại siêu thị thú cưng FamiPet.

Xuất Xứ Pate Cho Mèo Con Whiskas Vị Cá Ngừ
Chắc hẳn các "sen" không còn xa lạ gì với thương hiệu Whiskas nữa rồi! Nhãn hiệu thức ăn cho mèo màu tím này đã chinh phục được các "boss khó tính" nhất! Pate Cho Mèo Con Whiskas Vị Cá Ngừ 85g là sản phẩm của Whiskas. Sản phẩm lựa chọn những thành phần tươi ngon, đảm bảo an toàn cho mèo. Đồng thời cũng cung cấp hàm lượng dinh dưỡng dồi dào cho chú mèo của bạn. Với nguồn gốc xuất xứ rõ ràng, bạn hoàn toàn có thể an tâm về chất lượng sản phẩm. ', 1, CAST(N'2023-07-25' AS Date), CAST(N'2023-07-25' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Ship] ON 

INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (1, N'Số 10, Đường Trần Duy Hưng, Quận Cầu Giấy, Hà Nội', N'Hà Nội', N'Nguyễn Văn Anh', 50.0000, 1, 1, N'0987678975')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (2, N' Số 5, Đường Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội', N'Hà Nội', N'Nguyễn Thế Cảnh', 10.0000, 1, 2, N'0987679832')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (3, N'Số 20, Đường Trần Thái Tông, Quận Đống Đa, Hà Nội', N'Hà Nội', N'Nguyễn Văn Anh', 0.0000, 2, 3, N'0983565777')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (4, N'Số 211, Đường Trần Thái Tông, Quận Đống Đa, Hà Nội', N'Hà Nội', N'Lê Việt Hoàng', 0.0000, 1, 4, N'0866344343')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (5, N'Số 15, Đường Lê Đức Thọ, Quận Nam Từ Liêm, Hà Nội', N'Hà Nội', N'Trần Thế Gia Phong', 0.0000, 1, 8, N'0354646464')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (6, N'Số 7, Đường Nguyễn Văn Cừ, Quận Long Biên, Hà Nội', N'Hà Nội', N'Nguyễn Văn Anh', 0.0000, 3, 9, N'0334654646')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (7, N'Số 46, Đường Cầu Giấy,Hà Nội', N'Hà Nội', N'Nguyễn Thế Bảo', 10.0000, 1, 10, N'0944564566')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (8, N'Số 101, Xuân Thủy, Cầu Giấy,Hà Nội', N'Hà Nội', N'Nguyễn Thế Bảo', 10.0000, 1, 11, N'0925356677')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (9, N'Số 15, Ngõ Linh Quang, Đống Đa, Hà Nội', N'Hà Nội', N'Lê Tiến', 0.0000, 1, 13, N'0967889999')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (10, N'Số 31, Xã Đàn, Đống Đa, Hà Nội', N'Hà Nội', N'Lê Thế Bảo', 0.0000, 1, 14, N'0865454554')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (11, N'Số 300, Giải Phóng, Hà Nội', N'Hà Nội', N'Nguyễn Văn Tỉnh', 0.0000, 1, 15, N'0987656656')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (12, N'Số 10, Ngõ 322/90, Nhân Mỹ, Mỹ Đình, Hà Nội', N'Hà Nội', N'Lê Hữu TIến', 0.0000, NULL, 16, N'0934654666')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (1014, N'Số 45, Ngõ 78, Đường Láng, Đống Đa, Hà Nội', N'Hà Nội', N'Nguyễn Bảo Ngọc', 10.0000, 1, 19, N'0867784569')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (1015, N'Số 20, Ngõ 132, Đường Trần Đăng Ninh, Cầu Giấy, Hà Nội', N'Hà Nội', N'Lê Vĩnh Ngọc', 0.0000, 1, 20, N'0325467535')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (1016, N'Số 10, Ngõ 25, Đường Phố Huế, Hai Bà Trưng, Hà Nội', N'Hà Nội', N'Nguyễn Thế Anh', 0.0000, NULL, 21, N'0965763244')
INSERT [dbo].[Ship] ([ShipId], [ShipAddress], [ShipCity], [ShipContact], [Freight], [ShipperId], [OrderID], [PhoneContact]) VALUES (1020, N'phúc tiến ', N'Thành phố Hà Nội', N'linh', 0.0000, NULL, 29, N'0979276001')
SET IDENTITY_INSERT [dbo].[Ship] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (1, N'Nguyễn Văn Hưng', N'0987654321', N'Từ Liên', N'Hà Nội', N'Trương Định', N'Số 20, Ngõ 123, Đường Trần Khát Chân, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (2, N'Trần Văn Quyết', N'0987654321', N'Ba Đình', N'Hà Nội', N'Liễu Giai', N'Số 15, Ngõ 456, Đường Kim Mã, Ba Đình, Hà Nội')
INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (3, N'Nguyễn Văn Cương', N'0987654326', N'Đống Đa', N'Hà Nội', N'Trung Liệt', N'Số 18, Ngõ 888, Đường Thái Hà, Đống Đa, Hà Nội')
INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (4, N'Lương Sơn Bá', N'0987574343', N'Nam Từ Liêm', N'Hà Nội', N'Mễ Trì', N'Số 8, Ngõ 222, Đường Phạm Hùng, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (5, N'Nguyễn Văn An', N'0979276002', N'Huyện Thanh Trì', N'Thành phố Hà Nội', N'Thị trấn Văn Điển', N'Tân Triều , Thanh trì , Hà Nội ')
INSERT [dbo].[Shipper] ([ShipperId], [Name], [Phone], [District], [Province], [Wards], [Address]) VALUES (6, N'Nguyễn Văn Tĩnh', N'0979276003', N'Huyện Mèo Vạc', N'Tỉnh Hà Giang', N'Thị trấn Mèo Vạc', N'Xã Niên Tòng huyện Mèo Vạc tỉnh Hà Giang')
SET IDENTITY_INSERT [dbo].[Shipper] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Employees]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Shipper] FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shipper] ([ShipperId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Shipper]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Picture_Products]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Products_PictureProducts] FOREIGN KEY([PictureId])
REFERENCES [dbo].[PictureProducts] ([PictureId])
GO
ALTER TABLE [dbo].[Picture_Products] CHECK CONSTRAINT [FK_Picture_Products_PictureProducts]
GO
ALTER TABLE [dbo].[Picture_Products]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Products_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Picture_Products] CHECK CONSTRAINT [FK_Picture_Products_Products]
GO
ALTER TABLE [dbo].[PictureGallery]  WITH CHECK ADD  CONSTRAINT [FK_PictureGallery_Gallery] FOREIGN KEY([Id])
REFERENCES [dbo].[Gallery] ([Id])
GO
ALTER TABLE [dbo].[PictureGallery] CHECK CONSTRAINT [FK_PictureGallery_Gallery]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Reason_Cancel]  WITH CHECK ADD  CONSTRAINT [FK_Reason_Cancel_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Reason_Cancel] CHECK CONSTRAINT [FK_Reason_Cancel_Orders]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_Orders]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_Shipper] FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shipper] ([ShipperId])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_Shipper]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
