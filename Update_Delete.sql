
---Update

---~/image/Foto.png

select * from musicallyapp.dbo.GEN_PERSONA
where RUTA_FOTO Is null and CEDULA = '0913609285'

select * from musicallyapp.dbo.GEN_PERSONA
where CEDULA = '0913609285'


select * from musicallyapp.dbo.GEN_ESTADO_CIVIL

update musicallyapp.dbo.GEN_PERSONA 
set RUTA_FOTO = '~/image/Foto.png', USUARIO_ACT = 'VPR', FECHA_ACT = GETDATE()
where RUTA_FOTO Is null and CEDULA = '0913609285'


select 
a.OBSERVACION
,*
from musicallyapp.dbo.GEN_PERSONA a
inner join musicallyapp.dbo.GEN_ESTADO_CIVIL b on b.ID_ESTADO_CIVIL = a.ID_ESTADO_CIVIL
where a.ID_ESTADO_CIVIL = 1


update a
set a.OBSERVACION = CONCAT(b.DESCRIPCION,'-', b.ID_ESTADO_CIVIL )
from musicallyapp.dbo.GEN_PERSONA a
inner join musicallyapp.dbo.GEN_ESTADO_CIVIL b on b.ID_ESTADO_CIVIL = a.ID_ESTADO_CIVIL
where a.ID_ESTADO_CIVIL = 1


---Select columna from tabla1 a, tabla2 b where a.idTabla1 = b.idTabla2



-----Delete

select * from musicallyapp.dbo.GEN_PERSONA  where ID_ESTADO_CIVIL = 0
and CEDULA = '111111111'

delete from musicallyapp.dbo.GEN_PERSONA where ID_ESTADO_CIVIL = 0
and CEDULA = '111111111'

select * from musicallyapp.dbo.GEN_PERSONA  where ID_ESTADO_CIVIL = 0

select * from musicallyapp.dbo.GEN_PERSONA where CEDULA =  '1111111'

delete from musicallyapp.dbo.GEN_PERSONA where CEDULA =  '1111111'

select 
a.OBSERVACION
,*
from musicallyapp.dbo.GEN_PERSONA a
inner join musicallyapp.dbo.GEN_ESTADO_CIVIL b on b.ID_ESTADO_CIVIL = a.ID_ESTADO_CIVIL
where a.ID_ESTADO_CIVIL = 4

delete a
from musicallyapp.dbo.GEN_PERSONA a
inner join musicallyapp.dbo.GEN_ESTADO_CIVIL b on b.ID_ESTADO_CIVIL = a.ID_ESTADO_CIVIL
where a.ID_ESTADO_CIVIL = 4

select * from GEN_PERSONAS_BORRADAS

---tabla para los datos borrados
--USE musicallyapp
--go
--Create table GEN_PERSONAS_BORRADAS
--(
--	SECUENCIAL INT IDENTITY(1,1) PRIMARY KEY,
--	ID_PERSONA INT,
--	CEDULA VARCHAR(15),
--	FECHA_BORRADO DATETIME
--)
