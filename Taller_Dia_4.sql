
select * from musicallyapp..INV_PRODUCTO
select * from musicallyapp..INV_PROVEEDOR
select * from musicallyapp..Clientes

--substring
--convert
--len
--replicate
--replace

--JOIN = RELACION DIRECTA ENTRE TABLAS POR ELEMENTO COMUN

--ventas
select top 2 SUBSTRING(NumeroFactura,1,3) from musicallyapp..ComprobanteFactura
select top 2 len(NumeroFactura) from musicallyapp..ComprobanteFactura
select top 2 * from musicallyapp..ComprobanteFactura
select top 2 * from musicallyapp..Factura

select top 2 * from musicallyapp..ComprobanteComprobanteRetencion
select top 2 * from musicallyapp..CuentasXPagar

select
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroFactura,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroFactura,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroFactura,9,len(comprobante.NumeroFactura)) as SecuencialComprobante,
CONVERT(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
YEAR(comprobante.FechaAutorizacion) as AnioAutorizacion,
Month(comprobante.FechaAutorizacion) as MesAutorizacion,
comprobante.NumeroFactura as NumeroComprobante,
'VENTAS' as TipoComprobante
from musicallyapp..ComprobanteFactura comprobante
inner join musicallyapp..Factura factura on factura.NumeroFactura = comprobante.NumeroFactura 
union all
--compras
select
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroComprobanteRetencion,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroComprobanteRetencion,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroComprobanteRetencion,9,len(comprobante.NumeroComprobanteRetencion)) as SecuencialComprobante,
CONVERT(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
YEAR(comprobante.FechaAutorizacion) as AnioAutorizacion,
Month(comprobante.FechaAutorizacion) as MesAutorizacion,
comprobante.NumeroComprobanteRetencion as NumeroComprobante,
'COMPRAS' as TipoComprobante
from musicallyapp..ComprobanteComprobanteRetencion comprobante
join  musicallyapp..CuentasXPagar cp on cp.IdCuentasXPagar = comprobante.IdCuentasXPagar


----- Compras

--001-002-000006565
--001001000559

select top 2 * from musicallyapp..ComprobanteComprobanteRetencion
select top 2 * from musicallyapp..CuentasXPagar order by FechaCreacion desc

select top 2 REPLICATE('0',3)+NumeroDocumento from musicallyapp..CuentasXPagar order by FechaCreacion desc

select top 2 REPLACE(NumeroDocumento,'0','*') from musicallyapp..CuentasXPagar order by FechaCreacion desc


select
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroComprobanteRetencion,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroComprobanteRetencion,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroComprobanteRetencion,9,len(comprobante.NumeroComprobanteRetencion)) as SecuencialComprobante,
CONVERT(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
YEAR(comprobante.FechaAutorizacion) as AnioAutorizacion,
Month(comprobante.FechaAutorizacion) as MesAutorizacion,
comprobante.NumeroComprobanteRetencion as NumeroComprobante,
SUBSTRING(replace(cp.NumeroDocumento,'-',''),7,15) + REPLICATE('0',15-len(replace(cp.NumeroDocumento,'-',''))) as NumeroDocumentoRetenido,
'COMPRAS' as TipoComprobante
from musicallyapp..ComprobanteComprobanteRetencion comprobante
join  musicallyapp..CuentasXPagar cp on cp.IdCuentasXPagar = comprobante.IdCuentasXPagar

