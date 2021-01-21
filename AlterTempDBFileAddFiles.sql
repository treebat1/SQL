sp_helpdb tempdb

alter database tempdb add file (name = temp9, SIZE = 3493760 KB, filegrowth = 65536 KB, FILENAME = 'G:\TempData\i1\tempdb_mssql_9.ndf')
alter database tempdb add file (name = temp10, SIZE = 3493760 KB, filegrowth = 65536 KB, FILENAME = 'G:\TempData\i1\tempdb_mssql_10.ndf')
alter database tempdb add file (name = temp11, SIZE = 3493760 KB , filegrowth = 65536 KB, FILENAME = 'G:\TempData\i1\tempdb_mssql_11.ndf')
alter database tempdb add file (name = temp12, SIZE = 3493760 KB , filegrowth = 65536 KB, FILENAME = 'G:\TempData\i1\tempdb_mssql_12.ndf')


declare @i as int
declare @sql as nvarchar(2000)

set @i = 13

while @i <= 16
BEGIN

	set @sql = N'alter database tempdb add file (name = tempdev' 
					+ cast(@i as nvarchar(3)) + ', SIZE = 5906432 KB, filegrowth = 65536 KB, FILENAME = ''Q:\TempData\i4\tempdb_mssql_' + cast(@i as nvarchar(3)) + '.ndf'')'
	print @sql
	
	set @i = @i + 1
END

alter database tempdb add file (name = tempdev17, SIZE = 5906432 KB, filegrowth = 65536 KB, FILENAME = 'Q:\TempData\i4\tempdb_mssql_17.ndf')
alter database tempdb add file (name = tempdev18, SIZE = 5906432 KB, filegrowth = 65536 KB, FILENAME = 'Q:\TempData\i4\tempdb_mssql_18.ndf')
alter database tempdb add file (name = tempdev19, SIZE = 5906432 KB, filegrowth = 65536 KB, FILENAME = 'Q:\TempData\i4\tempdb_mssql_19.ndf')
alter database tempdb add file (name = tempdev20, SIZE = 5906432 KB, filegrowth = 65536 KB, FILENAME = 'Q:\TempData\i4\tempdb_mssql_20.ndf')

