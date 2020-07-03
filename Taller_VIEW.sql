
---VIEW - Vistas
use musicallyapp
go

Create view VistaFacturas
as
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
