
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


-----

Create table Clientes
(
	IdCliente int identity(1,1) not null,
	IdentificacionCliente varchar(14) not null,
	NombreCliente varchar(100) not null,

	constraint PK_IdCliente primary key clustered (IdCliente desc)

)on  musicallyapp_data_2
