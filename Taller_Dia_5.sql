---XML
declare @x XML

select @x ='<Orders>
      <Order OrderID="13000" CustomerID="ALFKI" OrderDate="2006-09-20Z" EmployeeID="2">
         <OrderDetails ProductID="76" Price="123" Qty = "10"/>
         <OrderDetails ProductID="16" Price="3.23" Qty = "20"/>
      </Order>
      <Order OrderID="13001" CustomerID="VINET" OrderDate="2006-09-20Z" EmployeeID="1">
         <OrderDetails ProductID="12" Price="12.23" Qty = "1"/>
		 <OrderDetails ProductID="16" Price="10" Qty = "2"/>
      </Order>
    </Orders>'

---select @x

----Cabeceras
select
--Orderid = T.Item.value('@OrderID', 'int')
T.Item.value('@OrderID', 'int') as OrderId,
T.Item.value('@CustomerID', 'varchar(20)') as CustomerId,
T.Item.value('@EmployeeID', 'int') as EmployeeID
from @x.nodes('Orders/Order') as T (Item)


---Detalles
select
T.Item.value('../@OrderID', 'int') as OrderId,
T.Item.value('@ProductID', 'int') as ProductId
from @x.nodes('Orders/Order/OrderDetails') as T (Item)


---Convertir a XML
-- for XML auto

select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person for XML auto

select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person as Datos
for XML auto, root('Personas'),Elements

with xmlnamespaces(default 'http://www.w3.org/2005/Atom')
select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person as Datos
for XML auto, root('Personas'),Elements

--- JSON

declare @json varchar(max)

select @json = '{
*/

declare @json2 varchar(max)

select @json2 = '[  

--select @json2

select 

--Validar este json

if ISJSON(@json2) = 1
BEGIN
	print 'Formato Correcto'
END
else
begin
	print 'Formato InCorrecto'
end

----Construir un JSON

--cabeceras

select  top 8 personas.BusinessEntityID, personas.FirstName, personas.LastName 
from AdventureWorks2014.Person.Person as personas
for JSON auto, ROOT ('PersonaInfo')

-- detalles
select  top 8 personas.BusinessEntityID, personas.FirstName, personas.LastName, Emails.EmailAddress
from AdventureWorks2014.Person.Person as personas
inner join AdventureWorks2014.Person.EmailAddress as Emails on personas.BusinessEntityID = Emails.BusinessEntityID
for JSON auto, ROOT ('PersonasInfo')