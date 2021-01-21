--filegroups missing files.
select f.name, df.name
from sys.filegroups f 
left join sys.database_files df on df.data_space_id = f.data_space_id
where df.name is null
order by f.name, df.name





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



/*

alter database Peapod
add file (name = Staging, filename =  'D:\SQLData\Peapod\Staging.NDF', size = 1000 MB, filegrowth = 1000 MB)
TO FILEGROUP Staging

*/

EXEC sp_helpdb 'Peapod'

SELECT *
FROM sys.database_files