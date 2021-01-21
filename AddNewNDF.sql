--Create new ndf file

use HomeDepot

SELECT
a.file_id,
LOGICAL_NAME = a.name,
PHYSICAL_FILENAME = a.physical_name,
FILEGROUP_NAME = b.name,
FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.size/128.000,2)),
SPACE_USED_MB = CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2)),
FREE_SPACE_MB = CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,'SpaceUsed'))/128.000,2))
FROM sys.database_files a 
LEFT OUTER JOIN sys.data_spaces b
ON a.data_space_id = b.data_space_id

alter database HomeDepot
add file (name = HomeDepot_Data_2, filename =  'D:\SQLData\I1\HomeDepot\HomeDepot_Data_2.ndf', size = 100000 MB, filegrowth = 1000 MB)

SELECT  *
FROM sys.filegroups



alter database HomeDepot
modify file (name = HomeDepot, filegrowth = 0 MB) 

sp_helpdb HomeDepot




--declare @i as int
--declare @sql as nvarchar(2000)

--set @i = 5

--while @i <= 25
--begin
--	set @sql = N'alter database tempdb add file (name = tempdev' 
--					+ cast(@i as nvarchar(3)) + ', FILENAME = ''h:\tempdb\tempdev' + cast(@i as nvarchar(3)) + '.ndf'', size = 1 GB, filegrowth = 4 GB)'
--	print @sql
	
--	set @i = @i + 1
--end






