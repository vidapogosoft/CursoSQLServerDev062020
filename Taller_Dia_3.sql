
--- Senetencia de Consulta

--- Select {campos,....} {*} from Tabla

use AdventureWorks2014
go

Select * from Person.Person-- todos los registros

Select BusinessEntityID,PersonType, FirstName, LastName, ModifiedDate from Person.Person

Select top 200 BusinessEntityID,PersonType, FirstName, LastName, ModifiedDate from Person.Person order by ModifiedDate desc

Select BusinessEntityID,PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType = 'IN'
order by ModifiedDate desc

Select BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType in ('IN','SC')

-- alias de columnas

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 
FirstName Nombres, LastName Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where PersonType in ('IN','SC')


Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 
isnull(Title,'N/D') as Tratamiento,
FirstName Nombres, LastName Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where PersonType in ('IN','SC')


Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where PersonType in ('IN','SC')

-----Contenido de datos

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where LastName like '%za%'  



Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where LastName like 'za%'



Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, UPPER(LastName) Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where UPPER(LastName) like 'ZA%'


Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, UPPER(LastName) Apellidos, ModifiedDate as FechaRegistro from Person.Person 
where UPPER(LastName) like 'A%A'


---Uniones de columnas

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

FirstName + ' ' + LastName NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 
where PersonType in ('IN','SC')

------CONCAT

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

order by LastName


--- Filtros

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

where PersonType = 'EM' and LastName like 'a%'


Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

where (PersonType = 'EM' or PersonType = 'SC' ) and LastName like 'a%'


---- aplicar rangos informacion
set dateformat mdy

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

where (PersonType = 'EM' or PersonType = 'SC' ) and LastName like 'a%'
and ModifiedDate between '2010-01-01 00:00:00.000'   and    '2011-12-31 00:00:00.000'

-----
Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

where (PersonType = 'EM' or PersonType = 'SC' ) and LastName like 'a%'
and year(ModifiedDate) between 2010  and  2011

---- 

Select BusinessEntityID as Codigo, PersonType as 'Tipo Persona', 

case when Title is null then 'N/D'
	 When Title = 'Mr.' then 'Sr.' 
	 When Title = 'Ms.' then 'Sra.'
	 else Title end as Tratamiento,

FirstName Nombres, LastName Apellidos, 

CONCAT(FirstName, SPACE(1), LastName) NombresCompletos,

ModifiedDate as FechaRegistro from Person.Person 

order by LastName


----- Agrupamiento de informacion

Select FirstName Nombres, LastName Apellidos
from Person.Person 
group by FirstName, LastName
order by LastName

----

Select FirstName Nombres, LastName Apellidos, count(*) Contador
from Person.Person 
group by FirstName, LastName
order by LastName


----

Select 
count(*)
from Person.Person 
where (PersonType = 'EM' or PersonType = 'SC' ) and LastName like 'a%'
and year(ModifiedDate) between 2010  and  2011

-----Union de tablas
select top 2 * from Person.Person where BusinessEntityID = 2170
select top 2 * from Person.EmailAddress where BusinessEntityID = 2170

select * from Person.Person where BusinessEntityID = 2170
select * from Person.EmailAddress where BusinessEntityID = 2170

select
CONCAT(a.FirstName, SPACE(1), a.LastName) NombresCompletos,
b.EmailAddress as Email, b.ModifiedDate Fecha
from Person.Person as a
inner join Person.EmailAddress as b on b.BusinessEntityID = a.BusinessEntityID
order by a.LastName

----
select
CONCAT(a.FirstName, SPACE(1), a.LastName) NombresCompletos,
b.EmailAddress as Email, b.ModifiedDate Fecha
from Person.Person as a
inner join Person.EmailAddress as b on b.BusinessEntityID = a.BusinessEntityID


select
CONCAT(a.FirstName, SPACE(1), a.LastName) NombresCompletos
from Person.Person a

select distinct
CONCAT(a.FirstName, SPACE(1), a.LastName) NombresCompletos
from Person.Person a

--- Row_number

--Kim Abercrombie	 1	kim2@adventure-works.com	2015-04-15 16:33:33.077
--Kim Abercrombie	 2	kim7@adventure-works.com	2009-11-29 00:00:00.000
--Kim Abercrombie	 3	kim1@adventure-works.com	2010-01-09 00:00:00.000
--Gustavo Achong	 1	gustavo0@adventure-works.com	2015-04-15 16:33:33.060

select
CONCAT(a.FirstName, SPACE(1), a.LastName) NombresCompletos,
ROW_NUMBER() over (partition by CONCAT(a.FirstName, SPACE(1), a.LastName) 
					order by  CONCAT(a.FirstName, SPACE(1), a.LastName) ) as CuantosEmails,
b.EmailAddress as Email, b.ModifiedDate Fecha
from Person.Person as a
inner join Person.EmailAddress as b on b.BusinessEntityID = a.BusinessEntityID


------------------
-- union elimino los repetidos

Select BusinessEntityID,PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType = 'IN'
union
Select BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType in ('SC')
union
Select BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType in ('GC')


-- union all (repite los datos)
Select BusinessEntityID,PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType = 'IN'
union all
Select BusinessEntityID, PersonType, FirstName, LastName, ModifiedDate from Person.Person 
where PersonType in ('SC')




