
sp_helpdb WS



ALTER DATABASE
MODIFY FILE (NAME = Behavior_Events_2017, FILEGROWTH = 300 MB)


---------------------------------------------------------

declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 90
begin
	set @sql = N'alter database tempdb modify file (name = tempdev' 
					+ cast(@i as nvarchar(3)) + ', filegrowth = 100 MB)'
	print @sql
	
	set @i = @i + 1
end

