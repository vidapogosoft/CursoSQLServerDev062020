
--while
--Print
--waitfor
--delay

DECLARE @site_value INT

set @site_value = 0


Print getdate()

while @site_value <= 10
begin
	
	Print 'DENTRO DEL WHILE'
	
	select @site_value = @site_value + 1

	if(@site_value = 9)
	begin
		
		--tiempo de espera
		--waitfor delay '00:00:03'

		--tiempo de reanudar la espera
		waitfor time '19:14:20'

		Print getdate()
	end

end


