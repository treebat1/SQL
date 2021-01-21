sp_helpdb tempdb

alter database tempdb modify file (name = tempdev, size = 100000 KB)


sp_who2 active




declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 48
BEGIN
	set @sql = N'alter database tempdb modify file (name = tempdev' 
					+ cast(@i as nvarchar(3)) + ', size = 10240 KB)'
	print @sql
	
	set @i = @i + 1
end



alter database tempdb modify file (name = tempdev, size = 10240 KB)
alter database tempdb modify file (name = tempdev2, size = 10240 KB)
alter database tempdb modify file (name = tempdev3, size = 10240 KB)
alter database tempdb modify file (name = tempdev4, size = 10240 KB)
alter database tempdb modify file (name = tempdev5, size = 10240 KB)
alter database tempdb modify file (name = tempdev6, size = 10240 KB)
alter database tempdb modify file (name = tempdev7, size = 10240 KB)
alter database tempdb modify file (name = tempdev8, size = 10240 KB)
alter database tempdb modify file (name = tempdev9, size = 10240 KB)
alter database tempdb modify file (name = tempdev10, size = 10240 KB)
alter database tempdb modify file (name = tempdev11, size = 10240 KB)
alter database tempdb modify file (name = tempdev12, size = 10240 KB)
alter database tempdb modify file (name = tempdev13, size = 10240 KB)
alter database tempdb modify file (name = tempdev14, size = 10240 KB)
alter database tempdb modify file (name = tempdev15, size = 10240 KB)
alter database tempdb modify file (name = tempdev16, size = 10240 KB)
alter database tempdb modify file (name = tempdev17, size = 10240 KB)
alter database tempdb modify file (name = tempdev18, size = 10240 KB)
alter database tempdb modify file (name = tempdev19, size = 10240 KB)
alter database tempdb modify file (name = tempdev20, size = 10240 KB)
alter database tempdb modify file (name = tempdev21, size = 10240 KB)
alter database tempdb modify file (name = tempdev22, size = 10240 KB)
alter database tempdb modify file (name = tempdev23, size = 10240 KB)
alter database tempdb modify file (name = tempdev24, size = 10240 KB)
alter database tempdb modify file (name = tempdev25, size = 10240 KB)
alter database tempdb modify file (name = tempdev26, size = 10240 KB)
alter database tempdb modify file (name = tempdev27, size = 10240 KB)
alter database tempdb modify file (name = tempdev28, size = 10240 KB)
alter database tempdb modify file (name = tempdev29, size = 10240 KB)
alter database tempdb modify file (name = tempdev30, size = 10240 KB)
alter database tempdb modify file (name = tempdev31, size = 10240 KB)
alter database tempdb modify file (name = tempdev32, size = 10240 KB)
alter database tempdb modify file (name = tempdev33, size = 10240 KB)
alter database tempdb modify file (name = tempdev34, size = 10240 KB)
alter database tempdb modify file (name = tempdev35, size = 10240 KB)
alter database tempdb modify file (name = tempdev36, size = 10240 KB)
alter database tempdb modify file (name = tempdev37, size = 10240 KB)
alter database tempdb modify file (name = tempdev38, size = 10240 KB)
alter database tempdb modify file (name = tempdev39, size = 10240 KB)
alter database tempdb modify file (name = tempdev40, size = 10240 KB)
alter database tempdb modify file (name = tempdev41, size = 10240 KB)
alter database tempdb modify file (name = tempdev42, size = 10240 KB)
alter database tempdb modify file (name = tempdev43, size = 10240 KB)
alter database tempdb modify file (name = tempdev44, size = 10240 KB)
alter database tempdb modify file (name = tempdev45, size = 10240 KB)
alter database tempdb modify file (name = tempdev46, size = 10240 KB)
alter database tempdb modify file (name = tempdev47, size = 10240 KB)
alter database tempdb modify file (name = tempdev48, size = 10240 KB)

