USE [master]
GO
/****** Object:  Database [Logueo]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Articulos]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Detalle_Facturas]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Facturas]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Locales]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Mozos]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Rubros]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[actualizarArticulo]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[actualizarMozo]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[actualizarRubro]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarArticulo]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarDetalle]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarFactura]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarMozo]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarRubro]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarUsuario]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[bajaArticulos]    Script Date: 27/9/2021 18:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaArticulos]
@id int
as
update Articulos set activo = 0 where idArticulo = @id
GO
/****** Object:  StoredProcedure [dbo].[bajaMozos]    Script Date: 27/9/2021 18:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaMozos]
@id int
as
update Mozos set activo = 0 where idMozo = @id
GO
/****** Object:  StoredProcedure [dbo].[bajaRubro]    Script Date: 27/9/2021 18:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[bajaRubro]
@id int
as

update Rubros set activo = 0 where idRubro = @id
GO
/****** Object:  StoredProcedure [dbo].[calcularTotal]    Script Date: 27/9/2021 18:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[calcularTotal]
@id int
as

select sum(a.precio * df.cantidad) as 'Total'
from Articulos a join Detalle_Facturas df on a.idArticulo = df.idArticulo
where df.idFactura = @id
GO
/****** Object:  StoredProcedure [dbo].[detallePorId]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarDetalle]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarUsuarios]    Script Date: 27/9/2021 18:00:28 ******/
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
/****** Object:  StoredProcedure [dbo].[traerNumeroFactura]    Script Date: 27/9/2021 18:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[traerNumeroFactura]
as
SELECT TOP 1 idFactura FROM Facturas  
ORDER BY idFactura DESC; 
GO
/****** Object:  StoredProcedure [dbo].[validarUsuario]    Script Date: 27/9/2021 18:00:28 ******/
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
USE [master]
GO
ALTER DATABASE [Logueo] SET  READ_WRITE 
GO
