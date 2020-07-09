use musicallyapp
go

Create procedure HolaMundo
as
begin
	
	select 'Hola Mundo'

end

--drop procedure HolaMundoç

---Fucnionamiento

exec HolaMundo
go

use musicallyapp
go
---Procedures con parametros
--Create procedure ConsPersona 
Alter procedure ConsPersona 
@Cedula varchar(15)
as
begin
	
	if(len(@Cedula)>=10)
	begin
		Select * from GEN_PERSONA where CEDULA = @Cedula
	end

end
go

----Funcionamiento

exec ConsPersona '09191725551'

go
---procedure con output parameter

use musicallyapp
go
Create procedure InsCliente
@Identificacion varchar(13),
@Nombres varchar(200),
@Secuencial int output
as
begin
	insert into Clientes(IdentificacionCliente, NombreCliente)
	values (@Identificacion, @Nombres)

	select @Secuencial = SCOPE_IDENTITY()

end


--Funcionamiento
select * from Clientes where IdentificacionCliente = '0924258130002'

declare @IdCliente int

exec  RegistroCliente '0924258130002', 'VPR', @IdCliente output

SELECT @IdCliente

select * from Clientes where IdentificacionCliente = '0924258130002'


-----Renombrar procedures
sp_rename 'InsCliente', 'RegistroCliente'
go

alter procedure ConsPersonasTipoIdentificacion
as
begin

	declare @IdCliente int

	exec  RegistroCliente '0924258130003', 'VPR-3', @IdCliente output

	SELECT @IdCliente

	--se puede invocar a funciones
	select * from PersonaTipoIdentificacion()
end


---funcionamiento
exec ConsPersonasTipoIdentificacion

