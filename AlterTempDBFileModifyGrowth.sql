sp_helpdb tempdb


alter database tempdb modify file (name = tempdev, filegrowth = 0 MB)

declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 31
BEGIN
	set @sql = N'alter database tempdb modify file (name = tempdev' 
					+ cast(@i as nvarchar(3)) + ', filegrowth = 0 MB)'
	print @sql
	
	set @i = @i + 1
end


alter database tempdb modify file (name = tempdev1, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev2, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev3, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev4, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev5, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev6, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev7, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev8, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev9, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev10, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev11, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev12, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev13, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev14, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev15, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev16, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev17, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev18, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev19, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev20, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev21, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev22, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev23, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev24, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev25, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev26, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev27, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev28, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev29, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev30, filegrowth = 0 MB)
alter database tempdb modify file (name = tempdev31, filegrowth = 0 MB)
