

declare @yil int
declare @sql nvarchar(max)
set @yil = 1998
set @sql = 'Select * from Orders'
if(@yil>1990)
 set @sql = @sql + ' Where year(orderDate)='+convert(nvarchar,@yil) 
 print @sql
--exec sp_executesql @statement = @sql
Exec(@sql)
exec sys.sp_server_info
exec sys.sp_tables 

