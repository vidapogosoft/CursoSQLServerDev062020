
use musicallyapp
go

select Identificacion, Cliente, f.Email ,NumeroComprobante from VistaFacturas vwf
inner join Factura f on f.NumeroFactura = vwf.NumeroComprobante
where AnioAutorizacion = 2019


select * from musicallyapp..Factura
