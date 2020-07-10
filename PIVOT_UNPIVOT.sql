
--PIVOT
--UNPIVOT


--PIVOT
/*
	
	SELECT <COLUMM NAMES>
	FROM <TABLE>
	PIVOT
	(
		AGGREGATE FUNCTION(<COLUMN TO BE AGREGATED>)
		FOR PivotColumn in (<pivot to column values>)
	)as ALIAS

*/

use AdventureWorks2014
go
select
DaysToManufacture, AVG(StandardCost) as Cost
from Production.product
group by DaysToManufacture

/* Deseo realizar Pivot de esta forma
Cost			0      1
Promedio      $$$$     $$$$
*/

Select
'AverageCost' as Cost_by_production,
[0],[1],[2],[3],[4],[5]
from
(
	select
	DaysToManufacture, StandardCost
	from Production.product
) as TablaOrigen
pivot
(
	avg(StandardCost)
	for DaysToManufacture in ([0],[1],[2],[3],[4],[5])
)as PivotTable

---PIVOT count

select PurchaseOrderID, EmployeeID, VendorID 
from Purchasing.PurchaseOrderHeader

select 
VendorID, [250] as Emp1,[251] as Emp2,[256] as Emp3,[257] as Emp4,[260] as Emp5
from 
(
	select PurchaseOrderID, EmployeeID, VendorID 
	from Purchasing.PurchaseOrderHeader
)p
pivot
(
	count(PurchaseOrderID)
	for EmployeeID in ([250],[251],[256],[257],[260])
) as infoPivot
order by infoPivot.VendorID desc


---UNPIVOT

--create table pvt 
--(
--	vendorid int,
--	Emp1 int,
--	Emp2 int,
--	Emp3 int,
--	Emp4 int,
--	Emp5 int
--)

--insert into pvt values(1,4,3,5,4,4)
--insert into pvt values(2,4,1,5,5,5)
--insert into pvt values(3,4,3,5,4,4)
--insert into pvt values(4,4,2,5,5,4)
--insert into pvt values(5,5,1,5,5,5)

select * from pvt

---

select vendorid, Employee, Orders
from
(
	select vendorid, Emp1,Emp2,Emp3,Emp4,Emp5
	from pvt
)p
unpivot
(
	Orders for Employee in
		   (Emp1,Emp2,Emp3,Emp4,Emp5)
)as unpvt


---CTE
---expresion   
--columna
--CTE query

select
SalesPersonID, count(*)
from Sales.SalesOrderHeader
group by SalesPersonID


select 
SalesPersonID, sum(TotalDue) as TotalSales, Year(OrderDate) as SalesYear
from Sales.SalesOrderHeader
group by SalesPersonID, Year(OrderDate)


select 
BusinessEntityID, sum(SalesQuota) as SalesQuota, YEAR(QuotaDate) as SalesQuotaYear
from Sales.SalesPersonQuotaHistory
group by BusinessEntityID, YEAR(QuotaDate)
go

----aplicando CTE

with sales_cte(SalesPersonID, NumberOfOrders)
as
(
	select
	SalesPersonID, count(*)
	from Sales.SalesOrderHeader
	group by SalesPersonID
)
select AVG(NumberOfOrders) as 'Average'
from sales_cte;

go


---uniones de CTE

with Sales_CTE (SalesPersonID,TotalSales, SalesYear)
as
(
	select 
	SalesPersonID, sum(TotalDue) as TotalSales, Year(OrderDate) as SalesYear
	from Sales.SalesOrderHeader
	group by SalesPersonID, Year(OrderDate)
)
,
sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)
as
(
	select 
	BusinessEntityID, sum(SalesQuota) as SalesQuota, YEAR(QuotaDate) as SalesQuotaYear
	from Sales.SalesPersonQuotaHistory
	group by BusinessEntityID, YEAR(QuotaDate)
)

select SalesPersonID, TotalSales, SalesQuota , (TotalSales - SalesQuota) as Amount
from Sales_CTE
join sales_Quota_CTE on sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
					and sales_Quota_CTE.SalesQuotaYear = Sales_CTE.SalesYear
order by SalesPersonID, SalesYear


---OFFSET Y FETCH
--OFFSET ESPECIFICA CUANTO TIENE QUE SALTARSE DENTRO DEL RESULTADO QUE SE ESTA BUSCANDO
--FETCH ESPECIFICA CUANTOS REGISTROS DESDE ESE PUBTO EN ADELANTE TIENE QUE DEVOLVER

declare @number int

select @number = 200

SELECT * FROM Person.Person
order by BusinessEntityID asc
offset @number rows
fetch next @number rows only

--top(@number) 
--top(select count(*) from tbala)





