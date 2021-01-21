sp_helpdb tempdb


declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 15
BEGIN
	set @sql = N'dbcc shrinkfile (temp' 
					+ cast(@i as nvarchar(3)) + ', 45817)'
	print @sql
	
	set @i = @i + 1
end



USE tempdb
go
dbcc shrinkfile (tempdev, 45817)
dbcc shrinkfile (temp2, 45817)
dbcc shrinkfile (temp3, 45817)
dbcc shrinkfile (temp4, 45817)
dbcc shrinkfile (temp5, 45817)
dbcc shrinkfile (temp6, 45817)
dbcc shrinkfile (temp7, 45817)
dbcc shrinkfile (temp8, 45817)
dbcc shrinkfile (temp9, 45817)
dbcc shrinkfile (temp10, 45817)
dbcc shrinkfile (temp11, 45817)
dbcc shrinkfile (temp12, 45817)
dbcc shrinkfile (temp13, 45817)
dbcc shrinkfile (temp14, 45817)
dbcc shrinkfile (temp15, 45817)

--alter database tempdb modify file (name = templog, FILENAME = 'E:\SQLLog\Templog.ldf')



