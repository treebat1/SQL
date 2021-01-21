sp_helpdb tempdb


declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 63
BEGIN

	set @sql = N'alter database tempdb remove file tempdev' 
					+ cast(@i as nvarchar(3))
	print @sql
	
	set @i = @i + 1
END


alter database tempdb remove file tempdev32
alter database tempdb remove file tempdev33
alter database tempdb remove file tempdev34
alter database tempdb remove file tempdev35
alter database tempdb remove file tempdev36
alter database tempdb remove file tempdev37
alter database tempdb remove file tempdev38
alter database tempdb remove file tempdev39
alter database tempdb remove file tempdev40
alter database tempdb remove file tempdev41
alter database tempdb remove file tempdev42
alter database tempdb remove file tempdev43
alter database tempdb remove file tempdev44
alter database tempdb remove file tempdev45
alter database tempdb remove file tempdev46
alter database tempdb remove file tempdev47
alter database tempdb remove file tempdev48
alter database tempdb remove file tempdev49
alter database tempdb remove file tempdev50
alter database tempdb remove file tempdev51
alter database tempdb remove file tempdev52
alter database tempdb remove file tempdev53
alter database tempdb remove file tempdev54
alter database tempdb remove file tempdev55
alter database tempdb remove file tempdev56
alter database tempdb remove file tempdev57
alter database tempdb remove file tempdev58
alter database tempdb remove file tempdev59
alter database tempdb remove file tempdev60
alter database tempdb remove file tempdev61
alter database tempdb remove file tempdev62
alter database tempdb remove file tempdev63
