
--tablas temporales

---#temporal local fisica en tempdb
---##temporal global fisica
--@temporales de variable


---#temporal local fisica en tempdb
---Puede realizar creaciones de de index
--

begin try
	Drop table #DBRecovery
end try
begin catch

	Select 1

end catch

select NombreCliente
into #DBRecovery
from musicallyapp..Clientes where IdentificacionCliente = '0919172551'



---Variable tipo tabla
-- declare @NombreTabla tipo de dato de la variable  TABLE

declare @TablaMemoria table
(
	secuencial int
)

select * from @TablaMemoria

---Tablas Globales ##
create table ##DBRecoveryGlobal
(
	secuencial int
)

create table ##DBRecovery
(
	secuencial int
)
