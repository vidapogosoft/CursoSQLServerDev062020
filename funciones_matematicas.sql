
--Funciones Matematicas

--sum
--ceiling
--floor
--round
--AVG

select ImporteTotal, CEILING(ImporteTotal) as FCeiling ,* from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '1202071765'

select ImporteTotal, floor(ImporteTotal) as FFloor ,* from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '1202071765'

select ImporteTotal, round(ImporteTotal,1) as FRound ,* from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '1202071765'

select round((Subtotal + Iva),1) as Total,* from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '0940817588'

select sum(ImporteTotal) from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '0910799048'

select 
ClienteIdentificacion,
ClienteNombre,
AVG(ImporteTotal) MontoVendido 
from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '0910799048'
group by ClienteIdentificacion,ClienteNombre

select 
Year(FechaEmision) Anio,
AVG(ImporteTotal) MontoVendido from musicallyapp.dbo.ComprobanteFactura
group by Year(FechaEmision)



select 
ClienteIdentificacion,
ClienteNombre,
sum(ImporteTotal) MontoVendido 
from musicallyapp.dbo.ComprobanteFactura where ClienteIdentificacion = '0910799048'
group by ClienteIdentificacion,ClienteNombre


select 
Year(FechaEmision) Anio,
count(*) CantidadFacturas from musicallyapp.dbo.ComprobanteFactura
group by Year(FechaEmision)

select count(*) from musicallyapp.dbo.GEN_PERSONA

select count(CEDULA) from musicallyapp.dbo.GEN_PERSONA

select count(RUTA_FOTO) from musicallyapp.dbo.GEN_PERSONA


select 
Year(FechaEmision) Anio,
sum(ImporteTotal) MontoVendido from musicallyapp.dbo.ComprobanteFactura
group by Year(FechaEmision)


select 
Year(FechaEmision) Anio,
Month(FechaEmision) Mes,
sum(ImporteTotal) MontoVendido from musicallyapp.dbo.ComprobanteFactura
group by Year(FechaEmision), Month(FechaEmision)
order by Year(FechaEmision) desc , Month(FechaEmision) asc
