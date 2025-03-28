USE [master]
GO
/****** Object:  Database [BANTIEN]    Script Date: 12/24/2022 11:51:17 AM ******/
CREATE DATABASE [BANTIEN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BANTIEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BANTIEN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BANTIEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BANTIEN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BANTIEN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BANTIEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BANTIEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BANTIEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BANTIEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BANTIEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BANTIEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [BANTIEN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BANTIEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BANTIEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BANTIEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BANTIEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BANTIEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BANTIEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BANTIEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BANTIEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BANTIEN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BANTIEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BANTIEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BANTIEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BANTIEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BANTIEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BANTIEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BANTIEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BANTIEN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BANTIEN] SET  MULTI_USER 
GO
ALTER DATABASE [BANTIEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BANTIEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BANTIEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BANTIEN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BANTIEN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BANTIEN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BANTIEN] SET QUERY_STORE = OFF
GO
USE [BANTIEN]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAD] [int] IDENTITY(1,1) NOT NULL,
	[HoAD] [nvarchar](10) NULL,
	[TenAD] [nvarchar](30) NULL,
	[UsernameAD] [varchar](50) NULL,
	[GioiTinh] [char](1) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[AnhDaiDien] [varchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaTien]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaTien](
	[MaTien] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[NoiDungDanhGia] [nvarchar](200) NULL,
	[ThoiGianDang] [datetime] NULL,
 CONSTRAINT [PK_DanhGiaTien] PRIMARY KEY CLUSTERED 
(
	[MaTien] ASC,
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaTien] [int] NULL,
	[SoLuong] [int] NULL,
	[Thoigian] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[MaDH] [int] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayLapHD] [datetime] NULL,
	[TongTien] [float] NULL,
	[TenKhach] [nvarchar](50) NULL,
	[SDTDatHang] [char](10) NULL,
	[EmailXacNhan] [varchar](50) NULL,
	[DiaChiNhanHang] [nvarchar](200) NULL,
	[GiamGia] [int] NULL,
	[TongThanhToan] [float] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[NgayNhanHang] [date] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoKH] [nvarchar](20) NULL,
	[TenKH] [nvarchar](30) NULL,
	[UsernameKH] [varchar](50) NULL,
	[GioiTinh] [char](1) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[AnhDaiDien] [varchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [date] NULL,
	[GiamGia] [int] NULL,
	[SoLanHuyDon] [smallint] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTien]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTien](
	[MaLoai] [varchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiTien_1] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaTien] [int] IDENTITY(1,1) NOT NULL,
	[TenTien] [nvarchar](100) NULL,
	[MoTaTien] [varchar](50) NULL,
	[TheLoai] [varchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[AnhMinhHoa] [varchar](60) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaTien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/24/2022 11:51:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[Role] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Latest_Login] [datetime] NULL,
	[block] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAD], [HoAD], [TenAD], [UsernameAD], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh]) VALUES (2, N'Nguyễn', N'Tính', N'tinhne', N'M', N'Đắk Lắk', N'/images/tinh.png', N'0347933844', CAST(N'2001-05-26' AS Date))
INSERT [dbo].[Admin] ([MaAD], [HoAD], [TenAD], [UsernameAD], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh]) VALUES (3, N'Phạm', N'Tú', N'tune', N'M', N'TP HCM', N'/images/tu.png', N'0326246343', CAST(N'2001-01-31' AS Date))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (24, 1, 3, 3, CAST(N'2022-10-25T17:32:38.253' AS DateTime), 60000, 7)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (25, 10, 3, 1, CAST(N'2022-10-25T17:34:08.853' AS DateTime), 20000, 8)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (26, 10, 3, 1, CAST(N'2022-10-25T17:34:12.023' AS DateTime), 20000, 8)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (27, 1, 3, 1, CAST(N'2022-10-25T22:22:15.783' AS DateTime), 20000, NULL)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (28, 1, 1, 1, CAST(N'2022-11-21T01:51:38.210' AS DateTime), 600000, NULL)
INSERT [dbo].[GioHang] ([MaGH], [MaKH], [MaTien], [SoLuong], [Thoigian], [ThanhTien], [MaDH]) VALUES (29, 11, 1, 1, CAST(N'2022-11-21T02:02:43.720' AS DateTime), 600000, NULL)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLapHD], [TongTien], [TenKhach], [SDTDatHang], [EmailXacNhan], [DiaChiNhanHang], [GiamGia], [TongThanhToan], [TrangThai], [NgayNhanHang]) VALUES (7, 1, CAST(N'2022-10-25T17:32:46.527' AS DateTime), 54000, N'Nguyễn Văn Đức Tính', N'0316848645', N'ngtinh@gmail.com', N'Đắk Lắk', 10, 69000, N'Đã giao hàng', CAST(N'2022-12-20' AS Date))
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLapHD], [TongTien], [TenKhach], [SDTDatHang], [EmailXacNhan], [DiaChiNhanHang], [GiamGia], [TongThanhToan], [TrangThai], [NgayNhanHang]) VALUES (8, 10, CAST(N'2022-10-25T17:34:39.110' AS DateTime), 39200, N'Phạm Lê Anh Tú', N'0111222222', N'tupham@gmail.com', N'Hồ Chí Minh', 2, 54200, N'Đã nhận đơn', CAST(N'2022-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (1, N'Ng', N'Tính', N'tinh', N'M', N'Ho Chi Minh', N'/images/User/ngtinh.png', N'0111111111', CAST(N'2001-05-26' AS Date), 10, 3)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (7, N'Ng', N'Tínhh', N'tinhh', N'M', N'Ho Chi Minh', N'/images/User/tupham.png', N'0111111111', CAST(N'2001-06-26' AS Date), 10, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (8, N'Ng', N'Tínhhh', N'tinhhh', N'M', N'Ho Chi Minh', N'/images/avatar_icon.png', N'0111222222', CAST(N'2001-01-01' AS Date), 10, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (10, N'Ng', N'Tínhhhh', N'tinhhhh', N'M', N'Đắk Lăk', N'/images/User/tune.png', N'0111222222', CAST(N'2001-12-13' AS Date), 2, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (11, NULL, NULL, N'Nhu', N'F', NULL, N'/images/avatar_icon.png', NULL, CAST(N'0001-01-01' AS Date), 5, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoKH], [TenKH], [UsernameKH], [GioiTinh], [DiaChi], [AnhDaiDien], [DienThoai], [NgaySinh], [GiamGia], [SoLanHuyDon]) VALUES (12, N'Nguyen', NULL, N'Kara', N'F', NULL, N'/images/avatar_icon.png', N'0987678912', CAST(N'2002-12-20' AS Date), 5, 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'THQ', N'Tiền Hàn Quốc')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TNB', N'Tiền Nhật Bản')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TQG', N'Tiền theo quốc gia')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TTB', N'Tiền theo bộ')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TTQ', N'Tiền Trung Quốc')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TVN1898', N'Giai đoạn 1898  - 1945')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TVN1945', N'Giai đoạnn 1945 - 1975')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TVN1975', N'Giai đoạn 1975 - 1994')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'TVNXu', N'Giai đoạn 1975 - 1994')
INSERT [dbo].[LoaiTien] ([MaLoai], [TenLoai]) VALUES (N'USD', N'Tiền 2 đô mỹ')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (1, N'Tiền 2 USD năm 1928', N'Ti?n cu quý hi?m', N'USD', 98, 600000, N'https://gdURL.com/yeD9')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (2, N'Tiền 2 USD năm 1953', N'Ti?n cu quý hi?m', N'USD', 100, 300000, N'https://gdURL.com/muWn')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (3, N'Tiền 2 USD năm 1976', N'Ti?n cu quý hi?m', N'USD', 100, 250000, N'https://gdURL.com/Eu-a')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (4, N'Tiền 2 USD 12 Bang', N'Ti?n 12 Bang c?a Châu Âu', N'USD', 100, 2500000, N'https://gdURL.com/vyAy')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (5, N'Tiền 2 USD năm 1917', N'Ti?n cu quý hi?m', N'USD', 100, 4000000, N'https://gdURL.com/g1st')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (6, N'Tiền 2 USD làm bằng vàng 24k', N'Ti?n quý hi?m', N'USD', 10, 1000000, N'https://gdURL.com/DM6F')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (7, N'Tiền 1000 won', N'Ti?n Hàn Qu?c', N'THQ', 100, 1000000, N'https://gdURL.com/UYii')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (8, N'Tiền 5000 won', N'Ti?n Hàn Qu?c', N'THQ', 100, 500000, N'https://gdURL.com/ZX0o')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (9, N'Tiền 5 won', N'Ti?n Hàn Qu?c', N'THQ', 100, 4500000, N'https://gdURL.com/J_Mh')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (10, N'Tiền 5000 won', N'Ti?n Hàn Qu?c cu', N'THQ', 100, 5000000, N'https://gdURL.com/uSbF')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (12, N'Tiền 50 won', N'Ti?n Hàn Qu?c', N'THQ', 100, 500000, N'https://gdURL.com/vqNn')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (13, N'Tiền 5000 won', N'Ti?n Hàn Qu?c', N'THQ', 100, 2000000, N'https://gdURL.com/IIbb')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (14, N'Tiền 100 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 40000, N'https://gdURL.com/TvGuQ')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (15, N'Tiền 100 Yên năm 1950', N'Ti?n Nh?t B?n', N'TNB', 100, 250000, N'https://gdURL.com/T4LS')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (16, N'Tiền 100 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 40000, N'https://gdURL.com/2iTi')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (17, N'Tiền 1 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 20000, N'https://gdURL.com/vMIn')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (18, N'Tiền 500 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 25000, N'https://gdURL.com/Gbww')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (19, N'Tiền 1000 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 400000, N'https://gdURL.com/njSH')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (20, N'Tiền 2000 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 800000, N'https://gdURL.com/aU2Q')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (21, N'Tiền 5000 Yên', N'Ti?n Nh?t B?n', N'TNB', 100, 10000000, N'https://gdURL.com/lFLt')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (22, N'Tiền 500 Won', N'Ti?n Hàn Qu?c', N'THQ', 100, 40000, N'https://gdURL.com/dwSZ')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (23, N'Tiền 28 Quốc gia', N'Ti?n 28 Qu?c gia', N'TTB', 10, 15000000, N'https://gdURL.com/ZSUX')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (24, N'Tiền 50 Quốc gia', N'Ti?n 50 Qu?c gia', N'TTB', 10, 30000000, N'https://gdURL.com/92aH')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (25, N'Tiền 100 Quốc gia', N'Ti?n 100 Qu?c gia', N'TTB', 10, 55000000, N'https://gdURL.com/1dYO')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (26, N'Tiền 100 BangCo', N'Ti?n BangCo', N'TQG', 100, 195000, N'https://gdURL.com/udyP')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (27, N'Tiền 20 Ma Cao', N'Ti?n Ma Cao', N'TQG', 100, 455000, N'https://gdURL.com/o4zX')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (28, N'Tiền 1 Malaysia năm 1998', N'Ti?n Malaysia ', N'TQG', 100, 350000, N'https://gdURL.com/k-Ey')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (29, N'Tiền 1 Oman', N'Ti?n Oman', N'TQG', 100, 400000, N'https://gdURL.com/h5zL')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (30, N'Tiền 20 Philip', N'Ti?n PhiLip', N'TQG', 100, 500000, N'https://gdURL.com/M_VR')
INSERT [dbo].[SanPham] ([MaTien], [TenTien], [MoTaTien], [TheLoai], [SoLuong], [DonGia], [AnhMinhHoa]) VALUES (31, N'Tiền 1 Thái Lan', N'Ti?n Thái Lan', N'TQG', 100, 200000, N'https://gdURL.com/v4W9')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'Kara', N'Kara1234', N'user', N'123qwe@gmail.com', CAST(N'2022-11-22T07:25:23.460' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'Nhu', N'Nhu123456', N'user', N'nhu123@gmail.com', CAST(N'2022-11-21T02:02:35.813' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'ThanhNgan', N'ThanhNgan123', N'admin', N'kara.nttn@gmail.com', CAST(N'2022-11-22T07:59:40.980' AS DateTime), NULL)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tinh', N'123', N'user', N'tinh@gmail.com', CAST(N'2022-11-21T01:51:31.213' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tinhh', N'123', N'user', N'tinhh@gmail.com', CAST(N'2022-10-25T22:22:07.433' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tinhhh', N'123', N'user', N'tinhhh@gmail.com', CAST(N'2022-12-09T15:26:46.430' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tinhhhh', N'123', N'user', N'tinhhhh@gmail.com', CAST(N'2022-10-25T17:34:03.127' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tinhne', N'1', N'admin', N'tinhne@gmail.com', CAST(N'2022-10-25T21:55:44.083' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tu', N'123', N'user', N'tu@gmail.com', CAST(N'2022-10-25T15:43:11.050' AS DateTime), 0)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [Role], [Email], [Latest_Login], [block]) VALUES (N'tune', N'1', N'admin', N'tune@gmail.com', CAST(N'2022-10-25T19:29:14.317' AS DateTime), 0)
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_TaiKhoan] FOREIGN KEY([UsernameAD])
REFERENCES [dbo].[TaiKhoan] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGiaTien]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaTien_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaTien] CHECK CONSTRAINT [FK_DanhGiaTien_KhachHang]
GO
ALTER TABLE [dbo].[DanhGiaTien]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaTien_SanPham] FOREIGN KEY([MaTien])
REFERENCES [dbo].[SanPham] ([MaTien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaTien] CHECK CONSTRAINT [FK_DanhGiaTien_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_HoaDon1] FOREIGN KEY([MaDH])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_HoaDon1]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([MaTien])
REFERENCES [dbo].[SanPham] ([MaTien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TaiKhoan] FOREIGN KEY([UsernameKH])
REFERENCES [dbo].[TaiKhoan] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiTien] FOREIGN KEY([TheLoai])
REFERENCES [dbo].[LoaiTien] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiTien]
GO
USE [master]
GO
ALTER DATABASE [BANTIEN] SET  READ_WRITE 
GO
