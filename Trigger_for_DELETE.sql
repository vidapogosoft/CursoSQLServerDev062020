use musicallyapp
go
Create trigger DelPersonas
on GEN_PERSONA
FOR DELETE
as
begin
	
	DECLARE @IdPersona int, @Cedula varchar(15)

	Select @IdPersona = ID_PERSONA, @Cedula = CEDULA from deleted

	insert into GEN_PERSONAS_BORRADAS (ID_PERSONA, CEDULA, FECHA_BORRADO)
	values(@IdPersona, @Cedula, GETDATE() )

end