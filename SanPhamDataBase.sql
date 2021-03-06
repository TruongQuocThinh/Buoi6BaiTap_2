USE [master]
GO
/****** Object:  Database [SanPhamDB]    Script Date: 28-Aug-21 12:33:25 PM ******/
CREATE DATABASE [SanPhamDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SanPhamDB', FILENAME = N'T:\Lap trinh Window\MSSQL15.SQLEXPRESS\MSSQL\DATA\SanPhamDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SanPhamDB_log', FILENAME = N'T:\Lap trinh Window\MSSQL15.SQLEXPRESS\MSSQL\DATA\SanPhamDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SanPhamDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SanPhamDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SanPhamDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SanPhamDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SanPhamDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SanPhamDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SanPhamDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SanPhamDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SanPhamDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SanPhamDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SanPhamDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SanPhamDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SanPhamDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SanPhamDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SanPhamDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SanPhamDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SanPhamDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SanPhamDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SanPhamDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SanPhamDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SanPhamDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SanPhamDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SanPhamDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SanPhamDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SanPhamDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SanPhamDB] SET  MULTI_USER 
GO
ALTER DATABASE [SanPhamDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SanPhamDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SanPhamDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SanPhamDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SanPhamDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SanPhamDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SanPhamDB] SET QUERY_STORE = OFF
GO
USE [SanPhamDB]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 28-Aug-21 12:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[SoHoaDon] [nvarchar](20) NOT NULL,
	[NgayDatHang] [datetime] NOT NULL,
	[NgayGiaoHang] [datetime] NOT NULL,
	[GhiChu] [nvarchar](255) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 28-Aug-21 12:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHoaDon] [nvarchar](20) NOT NULL,
	[STT] [int] NOT NULL,
	[MaSanPham] [nvarchar](20) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[DonViTinh] [nvarchar](20) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHoaDon] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 28-Aug-21 12:33:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](20) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
	[GiaMua] [decimal](18, 0) NULL,
	[GiaBan] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([SoHoaDon], [NgayDatHang], [NgayGiaoHang], [GhiChu]) VALUES (N'HDX001', CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Giao hàng trước 9h')
INSERT [dbo].[ChiTietHoaDon] ([SoHoaDon], [NgayDatHang], [NgayGiaoHang], [GhiChu]) VALUES (N'HDX002', CAST(N'2019-10-02T00:00:00.000' AS DateTime), CAST(N'2019-10-02T00:00:00.000' AS DateTime), N'Gọi điện trước khi giao')
INSERT [dbo].[ChiTietHoaDon] ([SoHoaDon], [NgayDatHang], [NgayGiaoHang], [GhiChu]) VALUES (N'HDX003', CAST(N'2019-10-02T00:00:00.000' AS DateTime), CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Giao từ 1-3h')
GO
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX001', 1, N'Product1', N'Sản phẩm 1', N'Cái', CAST(120000 AS Decimal(18, 0)), 20)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX001', 2, N'Product2', N'Sản phẩm 2', N'Cái', CAST(120000 AS Decimal(18, 0)), 4)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX001', 3, N'Product4', N'Sản phẩm 4', N'Hộp', CAST(300000 AS Decimal(18, 0)), 10)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX002', 1, N'Product4', N'Sản phẩm 1', N'Hộp', CAST(300000 AS Decimal(18, 0)), 10)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX002', 2, N'Product2', N'Sản phẩm 3', N'Cái', CAST(300000 AS Decimal(18, 0)), 12)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX003', 1, N'Product1', N'Sản phẩm 1', N'Cái', CAST(120000 AS Decimal(18, 0)), 40)
INSERT [dbo].[HoaDon] ([SoHoaDon], [STT], [MaSanPham], [TenSanPham], [DonViTinh], [DonGia], [SoLuong]) VALUES (N'HDX003', 4, N'Product2', N'Sản phẩm 2', N'Cái', CAST(120000 AS Decimal(18, 0)), 60)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonViTinh], [GiaMua], [GiaBan]) VALUES (N'Product1', N'Sản phẩm 1', N'Cái', CAST(100000 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonViTinh], [GiaMua], [GiaBan]) VALUES (N'Product2', N'Sản phẩm 2', N'Cái', CAST(90000 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonViTinh], [GiaMua], [GiaBan]) VALUES (N'Product3', N'Sản phẩm 3', N'Cái', CAST(40000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [DonViTinh], [GiaMua], [GiaBan]) VALUES (N'Product4', N'Sản phẩm 4', N'Hộp', CAST(200000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_ChiTietHoaDon] FOREIGN KEY([SoHoaDon])
REFERENCES [dbo].[ChiTietHoaDon] ([SoHoaDon])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_ChiTietHoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_SanPham]
GO
USE [master]
GO
ALTER DATABASE [SanPhamDB] SET  READ_WRITE 
GO
