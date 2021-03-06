USE [master]
GO
/****** Object:  Database [Logueo]    Script Date: 30/9/2021 17:51:12 ******/
CREATE DATABASE [Logueo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Logueo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.JOAQUIN\MSSQL\DATA\Logueo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Logueo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.JOAQUIN\MSSQL\DATA\Logueo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Logueo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Logueo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Logueo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Logueo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Logueo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Logueo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Logueo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Logueo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Logueo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Logueo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Logueo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Logueo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Logueo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Logueo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Logueo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Logueo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Logueo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Logueo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Logueo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Logueo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Logueo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Logueo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Logueo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Logueo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Logueo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Logueo] SET  MULTI_USER 
GO
ALTER DATABASE [Logueo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Logueo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Logueo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Logueo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Logueo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Logueo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Logueo] SET QUERY_STORE = OFF
GO
USE [Logueo]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](80) NULL,
	[precio] [decimal](18, 0) NULL,
	[idRubro] [int] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Facturas]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Facturas](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idFactura] [int] NULL,
	[idArticulo] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[fechaEmision] [datetime] NULL,
	[idMozo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locales]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locales](
	[idLocal] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](80) NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mozos]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mozos](
	[idMozo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[comision] [int] NULL,
	[idLocal] [int] NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMozo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubros]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubros](
	[idRubro] [int] IDENTITY(1,1) NOT NULL,
	[nombreRubro] [varchar](50) NULL,
	[activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[tipoDoc] [nvarchar](50) NOT NULL,
	[numDoc] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[tipoUser] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulos] ON 

INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (1, N'Pritty 2L', CAST(140 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (2, N'Coca Cola 2L', CAST(200 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (3, N'Fanta 2L', CAST(150 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (4, N'Papas Fritas Porcion', CAST(350 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (5, N'Hamburguesa Americana ', CAST(500 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (6, N'Corona 1L', CAST(200 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (7, N'7UP 2L', CAST(200 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (8, N'Fernet Branca 750cc', CAST(400 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (9, N'Cynnar 1L', CAST(400 AS Decimal(18, 0)), 1, 1)
INSERT [dbo].[Articulos] ([idArticulo], [descripcion], [precio], [idRubro], [activo]) VALUES (10, N'Gomitas Mogul Tiburones', CAST(50 AS Decimal(18, 0)), 1, 1)
SET IDENTITY_INSERT [dbo].[Articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Facturas] ON 

INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1, 1, 4, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (2, 1, 4, 5)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (3, 3, 4, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (4, 3, 4, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (5, 4, 4, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (6, 4, 4, 4)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (7, 5, 3, 323)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (8, 5, 3, 323)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (9, 6, 3, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (10, 6, 4, 5)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (11, 10, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (13, 11, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (14, 11, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (16, 12, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (17, 15, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (18, 17, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (19, 19, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (20, 21, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (21, 22, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (22, 22, 4, 4)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (23, 23, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (24, 23, 4, 4)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (25, 23, 4, 45)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (26, 24, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (27, 24, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (28, 36, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (29, 37, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (34, 39, 1, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (36, 41, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (37, 42, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (44, 43, 3, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (45, 43, 3, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (51, 45, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (52, 45, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (53, 48, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (54, 48, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (56, 49, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (57, 49, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (60, 50, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (61, 50, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (63, 51, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (64, 51, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (74, 52, 5, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (75, 52, 5, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (76, 53, 5, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (82, 55, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (83, 55, 4, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (84, 55, 5, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (86, 56, 1, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1002, 1002, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1003, 1002, 1, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1004, 1002, 4, 32)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1005, 1002, 4, 32)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1006, 1003, 2, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1007, 1003, 4, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1008, 1003, 3, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1009, 1003, 6, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1010, 1003, 7, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1011, 1003, 8, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1012, 1003, 9, 3)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1018, 1006, 3, 34)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1019, 1007, 2, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1020, 1007, 2, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1021, 1007, 4, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1022, 1008, 4, 1)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1023, 1008, 4, 2)
INSERT [dbo].[Detalle_Facturas] ([idDetalle], [idFactura], [idArticulo], [cantidad]) VALUES (1024, 1008, 4, 8)
SET IDENTITY_INSERT [dbo].[Detalle_Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1, CAST(N'2021-09-21T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (2, CAST(N'2021-09-21T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (3, CAST(N'2021-09-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (4, CAST(N'2021-09-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (5, CAST(N'2021-09-27T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (6, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (7, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (8, CAST(N'2021-09-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (9, CAST(N'2021-09-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (10, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (11, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (12, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (13, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (14, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (15, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (16, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (17, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (18, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (19, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (20, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (21, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (22, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (23, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (24, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (25, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (26, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (27, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (28, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (29, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (30, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (31, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (32, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (33, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (34, CAST(N'2021-10-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (35, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (36, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (37, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (38, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (39, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (40, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (41, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (42, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (43, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (44, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (45, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (46, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (47, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (48, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (49, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (50, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (51, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (52, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (53, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (54, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (55, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (56, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (57, CAST(N'2021-09-28T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1002, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1003, CAST(N'2021-09-29T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1004, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1005, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1006, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1007, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Facturas] ([idFactura], [fechaEmision], [idMozo]) VALUES (1008, CAST(N'2021-09-30T00:00:00.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Locales] ON 

INSERT [dbo].[Locales] ([idLocal], [direccion], [activo]) VALUES (1, N'La pampa 1186', 1)
SET IDENTITY_INSERT [dbo].[Locales] OFF
GO
SET IDENTITY_INSERT [dbo].[Mozos] ON 

INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (1, N'Ignacio', N'Pedrosa', 10, 1, 1)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (2, N'Maxi', N'Farias', 20, 1, 0)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (3, N'Nico', N'Rodriguez', 25, 1, 0)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (4, N'Valen', N'Cequeira', 5, 1, 1)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (5, N'Julio', N'Di Salvo', 20, 1, 0)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (6, N'Agus', N'Nicolas', 2, 1, 0)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (7, N'Robert', N'Escaleno', 18, 1, 1)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (8, N'Pedro', N'Capo', 12, 1, 0)
INSERT [dbo].[Mozos] ([idMozo], [nombre], [apellido], [comision], [idLocal], [activo]) VALUES (9, N'Juan Ignacio', N'Olmos', 50, 1, 1)
SET IDENTITY_INSERT [dbo].[Mozos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rubros] ON 

INSERT [dbo].[Rubros] ([idRubro], [nombreRubro], [activo]) VALUES (1, N'Bebidas', 1)
INSERT [dbo].[Rubros] ([idRubro], [nombreRubro], [activo]) VALUES (2, N'Comida', 1)
INSERT [dbo].[Rubros] ([idRubro], [nombreRubro], [activo]) VALUES (3, N'Postres', 1)
INSERT [dbo].[Rubros] ([idRubro], [nombreRubro], [activo]) VALUES (4, N'Postres', 0)
SET IDENTITY_INSERT [dbo].[Rubros] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [tipoDoc], [numDoc], [email], [usuario], [contraseña], [tipoUser]) VALUES (3010, N'Joaquin', N'Gual', N'DNI', N'41152547', N'joa@gmail.com', N'JGUAL', N'111', 1)
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [tipoDoc], [numDoc], [email], [usuario], [contraseña], [tipoUser]) VALUES (3012, N'Nacho', N'Pedrosa', N'DNI', N'1', N'nacho@gmail.com', N'NPEDROSA', N'111', 0)
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [tipoDoc], [numDoc], [email], [usuario], [contraseña], [tipoUser]) VALUES (3014, N'Pedro', N'Aznar', N'DNI', N'3', N'joa', N'PAZNAR', N'111', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [fk_Articulos_Rubros] FOREIGN KEY([idRubro])
REFERENCES [dbo].[Rubros] ([idRubro])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [fk_Articulos_Rubros]
GO
ALTER TABLE [dbo].[Detalle_Facturas]  WITH CHECK ADD  CONSTRAINT [fk_Detalle_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([idArticulo])
GO
ALTER TABLE [dbo].[Detalle_Facturas] CHECK CONSTRAINT [fk_Detalle_Articulos]
GO
ALTER TABLE [dbo].[Detalle_Facturas]  WITH CHECK ADD  CONSTRAINT [fk_DetalleF_Facturas] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Facturas] ([idFactura])
GO
ALTER TABLE [dbo].[Detalle_Facturas] CHECK CONSTRAINT [fk_DetalleF_Facturas]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fk_Mozos_Facturas] FOREIGN KEY([idMozo])
REFERENCES [dbo].[Mozos] ([idMozo])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fk_Mozos_Facturas]
GO
ALTER TABLE [dbo].[Mozos]  WITH CHECK ADD  CONSTRAINT [fk_Mozos_Locales] FOREIGN KEY([idLocal])
REFERENCES [dbo].[Locales] ([idLocal])
GO
ALTER TABLE [dbo].[Mozos] CHECK CONSTRAINT [fk_Mozos_Locales]
GO
/****** Object:  StoredProcedure [dbo].[actualizarArticulo]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[actualizarArticulo]
@idArticulo int,
@descripcion varchar(80),
@precio float,
@idRubro int,
@activo bit
as
  update Articulos set descripcion = @descripcion , precio = @precio, idRubro = @idRubro , activo = @activo
  where idArticulo = @idArticulo
GO
/****** Object:  StoredProcedure [dbo].[actualizarMozo]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[actualizarMozo]
  @idMozo int,
  @nombre varchar(80),
  @apellido varchar (80),
  @comision int,
  @idLocal int,
  @activo bit
  as
  update Mozos set nombre = @nombre , apellido = @apellido, comision = @comision , idLocal = @idLocal , activo = @activo
  where idMozo = @idMozo
GO
/****** Object:  StoredProcedure [dbo].[actualizarRubro]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[actualizarRubro]
@idRubro int,
@nombreRubro varchar(80),
@activo bit
as
  update Rubros set nombreRubro = @nombreRubro , activo = @activo
  where idRubro = @idRubro
GO
/****** Object:  StoredProcedure [dbo].[agregarArticulo]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[agregarArticulo]
@descripcion varchar(80),
@precio float,
@idRubro int,
@activo bit
as
insert into Articulos (descripcion,precio,idRubro,activo) values (@descripcion,@precio,@idRubro,@activo)
GO
/****** Object:  StoredProcedure [dbo].[agregarDetalle]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[agregarDetalle]
@idFactura int,
@idArticulo int,
@cantidad int
as
insert into Detalle_Facturas (idFactura,idArticulo,cantidad) values (@idFactura,@idArticulo,@cantidad)
GO
/****** Object:  StoredProcedure [dbo].[agregarFactura]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[agregarFactura]
@fechaEmision datetime,
@idMozo int
as
insert into Facturas (fechaEmision,idMozo) values (@fechaEmision,@idMozo)
select @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[agregarMozo]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[agregarMozo]
@Nombre varchar(80),
@Apellido varchar (80),
@Comision float,
@idLocal int,
@Activo bit
as
insert into Mozos (nombre,apellido,comision,idLocal,activo) values (@nombre,@apellido,@comision,@idLocal ,@activo)
GO
/****** Object:  StoredProcedure [dbo].[agregarRubro]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[agregarRubro]
@nombreRubro varchar(80),
@activo bit
as
insert into Rubros (nombreRubro,activo) values (@nombreRubro,@activo)
GO
/****** Object:  StoredProcedure [dbo].[agregarUsuario]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[agregarUsuario]
@Nombre varchar(50),
@Apellido varchar(50),
@TipoDocumento varchar(50),
@NumeroDocumento varchar(50),
@Email varchar(50),
@User varchar(50),
@Pass varchar(50),
@TipoUser bit
as

insert into Usuarios (nombre,apellido,tipoDoc,numDoc,email,usuario,contraseña,tipoUser) values (@Nombre,@Apellido,@TipoDocumento,@NumeroDocumento,@Email,@User,@Pass,@TipoUser)
GO
/****** Object:  StoredProcedure [dbo].[bajaArticulos]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaArticulos]
@id int
as
update Articulos set activo = 0 where idArticulo = @id
GO
/****** Object:  StoredProcedure [dbo].[bajaMozos]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaMozos]
@id int
as
update Mozos set activo = 0 where idMozo = @id
GO
/****** Object:  StoredProcedure [dbo].[bajaRubro]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaRubro]
@id int
as

update Rubros set activo = 0 where idRubro = @id
GO
/****** Object:  StoredProcedure [dbo].[calcularTotal]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[calcularTotal]
@id int
as

select  isNull(sum(a.precio * df.cantidad),0) as 'Total'
from Articulos a join Detalle_Facturas df on a.idArticulo = df.idArticulo
where df.idFactura = @id
GO
/****** Object:  StoredProcedure [dbo].[detallePorId]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[detallePorId]
@idFactura int
as
select df.idDetalle as 'Detalle', df.cantidad as 'Cantidad' , a.descripcion as 'Descripcion', a.precio as 'Precio'
from Detalle_Facturas df join Articulos a on a.idArticulo = df.idArticulo
where df.idFactura = @idFactura
GO
/****** Object:  StoredProcedure [dbo].[eliminarDetalle]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarDetalle]
@idDetalle int
as
delete from Detalle_Facturas
where idDetalle = @idDetalle
GO
/****** Object:  StoredProcedure [dbo].[eliminarUsuarios]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarUsuarios]
@id int
as
delete from Usuarios
where id =  @id
GO
/****** Object:  StoredProcedure [dbo].[totalPorDia]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[totalPorDia]
@fecha datetime
as
set dateformat dmy
select isNull(sum(a.precio* df.cantidad),0) 'Total'
from Articulos a join Detalle_Facturas df on a.idArticulo = df.idArticulo join Facturas f on f.idFactura = df.idFactura
where f.fechaEmision = @fecha
GO
/****** Object:  StoredProcedure [dbo].[traerNumeroFactura]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerNumeroFactura]
as
SELECT TOP 1 idFactura FROM Facturas  
ORDER BY idFactura DESC; 
GO
/****** Object:  StoredProcedure [dbo].[validarUsuario]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validarUsuario]
@User varchar(50),
@Pass varchar(50)
as 
select * from Usuarios u
where u.usuario = @User and u.contraseña = @Pass
GO
/****** Object:  StoredProcedure [dbo].[ventasPorDia]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ventasPorDia]
@fecha datetime 
as
set dateformat dmy
select a.idArticulo as 'Articulo',a.descripcion 'Descripcion' ,sum(df.cantidad) 'Cantidad',sum(df.cantidad * a.precio) 'Importe'
from Articulos a join Detalle_Facturas df on df.idArticulo = a.idArticulo join Facturas f on f.idFactura = df.idFactura
where f.fechaEmision = @fecha
group by a.idArticulo,a.descripcion
GO
/****** Object:  StoredProcedure [dbo].[ventasXMXD]    Script Date: 30/9/2021 17:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ventasXMXD]
@fecha datetime
as
select	m.nombre + ' ' + m.apellido as 'Mozo', sum(df.cantidad) 'Cantidad' , sum(df.cantidad * a.precio) 'Total' , m.comision 'Comision' , ((sum(df.cantidad * a.precio) * m.comision) / 100) as 'Pago' 
from Articulos a join Detalle_Facturas df on a.idArticulo = df.idArticulo join Facturas f on f.idFactura = df.idFactura join Mozos m on m.idMozo = f.idMozo
where f.fechaEmision = @fecha
group by m.nombre + ' ' + m.apellido,m.comision
GO
USE [master]
GO
ALTER DATABASE [Logueo] SET  READ_WRITE 
GO
