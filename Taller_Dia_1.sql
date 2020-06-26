
/*
CREATE
ALTER
DROP
*/

/*TIENDA DE MUSICA - CD*/
--musicallyapp
--TABLAS INICIALES
/*
TIENDA
DISCOS
CATEGORIAS
BANDAS
PEDIDOS
CLIENTES
*/

USE master
go

Create database musicallyapp
on
(
	name = musicallyapp_data,
	filename = 'E:\SQLDATA16\musicallyappdata.mdf',
	size = 10,
	maxsize = 50,
	filegrowth = 5
)
log on
(
	name = musicallyapp_log,
	filename = 'E:\SQLDATA16\musicallyapplog.ldf',
	size = 10,
	maxsize = 50,
	filegrowth = 5
)

----- secundarios de base datos

alter database musicallyapp add filegroup musicallyapp_data_2

alter database musicallyapp
add file(
	
	name = musicallyappdata2,
	filename = 'E:\SQLDATA16\musicallyappdata2.ndf',
	size = 10,
	maxsize = 50,
	filegrowth = 5
)to filegroup musicallyapp_data_2


----

use musicallyapp
go

--- toda tabla debe contar con su primary key
--- toda tabla debe estar bien relacionada
--- acostumbrar a que los PK identity
--- identificar en que filegroup

Create Table Tienda
(
	IdTienda int identity(1,1) not null,
	IdentificacionTienda varchar(14) not null,
	NombreTienda varchar(100) not null,

	constraint PK_IdTienda primary key clustered (IdTienda desc)
)

---agregar mas campos
--FechaRegistro
--HorRegistro
--UsarioRegistro

alter table Tienda add FechaRegistro Date not null default(getdate())
alter table Tienda add HoraRegistro Time
alter table Tienda add UsuarioRegistro varchar(15)

-----

Create table Clientes
(
	IdCliente int identity(1,1) not null,
	IdentificacionCliente varchar(14) not null,
	NombreCliente varchar(100) not null,

	constraint PK_IdCliente primary key clustered (IdCliente desc)

)on  musicallyapp_data_2


----Restriciones en tablas

---unique

use musicallyapp
go

alter table Clientes add constraint UN_IdentificacionCliente UNIQUE 
(
	IdentificacionCliente
)
go


-- Check

alter table Clientes add constraint C_IdentificacionCliente 
check (len(IdentificacionCliente) >= 10)
go


----Integridad Referencial

Create table Categorias
(
	IdCategoria int identity(1,1),
	Descripcion varchar(100),

	constraint PK_Idcategoria primary key clustered (IdCategoria)
)

----FK
Create table Discos
(
	IdDisco int identity(1,1),
	Descripcion varchar(100),
	---IdCategoria int,
	constraint PK_IdDisco primary key clustered (IdDisco desc)
)

alter table Discos add IdCategoria int

---Crear FK 
alter table Discos
with check add constraint FK_IdCategoria_Discos foreign key (IdCategoria)
references Categorias (IdCategoria)


---bandas
Create table Banda
(
	IdBanda int identity(1,1),
	Nombre varchar(100),
	FechaRegistro Date not null default(getdate()),
	HoraRegistro Time,
	UsuarioRegistro varchar(15),

	constraint PK_IdBanda primary key clustered (IdBanda desc)
)


----banda - Disco
Create table DiscosPorBanda
(
	IdDiscoBanda int identity(1,1),
	IdBanda int,
	IdDisco int,
	FechaRegistro Date not null default(getdate()),
	HoraRegistro Time,
	UsuarioRegistro varchar(15),

	constraint PK_IdDiscoBanda primary key clustered (IdDiscoBanda)
)

---Crear FK 
alter table DiscosPorBanda
with check add constraint FK_IdDisco foreign key (IdDisco)
references Discos (IdDisco)

---Crear FK 
alter table DiscosPorBanda
with check add constraint FK_IdBanda foreign key (IdBanda)
references Banda (IdBanda)

