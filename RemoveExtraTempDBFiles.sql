declare @i as int
declare @sql as nvarchar(2000)

set @i = 24

while @i <= 89
BEGIN
	--set @sql = N'alter database tempdb modify file (name = tempdev' 
					--+ cast(@i as nvarchar(3)) + ', FILENAME = ''F:\tempdb\tempdb' + cast(@i as nvarchar(3)) + '.mdf'', FILEGROWTH = 1024000KB)'
	set @sql = N'alter database tempdb REMOVE FILE' + cast(@i as nvarchar(3))
	print @sql
	
	set @i = @i + 1
end
