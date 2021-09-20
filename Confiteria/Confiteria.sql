create table Rubros(
idRubro int identity primary key,
nombreRubro varchar(50),
activo bit)

create table Articulos(
idArticulo int identity primary key,
descripcion varchar(80),
precio float,
idRubro int,
activo bit,
CONSTRAINT fk_Articulos_Rubros FOREIGN KEY (idRubro) REFERENCES Rubros (idRubro))

create table Locales(
idLocal int identity primary key,
direccion varchar(80),
activo bit)

create table Mozos(
idMozo int identity primary key,
nombre varchar(50),
apellido varchar (50),
comision float,
idLocal int,
activo bit,
CONSTRAINT fk_Mozos_Locales FOREIGN KEY (idLocal) REFERENCES Locales (idLocal))

create table facturas(
idFactura int identity primary key,
fechaEmision datetime,
idMozo int,
CONSTRAINT fk_Mozos_Facturas FOREIGN KEY (idMozo) REFERENCES Mozos (idMozo))

create table Detalle_Facturas(
idDetalle int identity primary key,
idFactura int,
idArticulo int,
cantidad int,
CONSTRAINT fk_Detalle_Articulos FOREIGN KEY (idArticulo) REFERENCES Articulos (idArticulo),
CONSTRAINT fk_DetalleF_Facturas FOREIGN KEY (idFactura) REFERENCES Facturas (idFactura))


create proc agregarMozo
@nombre varchar(80),
@apellido varchar (80),
@comision float,
@idLocal int,
@activo bit
as
insert into Mozos (nombre,apellido,comision,idLocal,activo) values (@nombre,@apellido,@comision,@idLocal ,@activo)


create proc bajaMozos
@id int
as
update Mozos set activo = 0 where idMozo = @id