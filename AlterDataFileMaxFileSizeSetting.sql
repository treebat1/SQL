SELECT
a.file_id,
LOGICAL_NAME = a.name,
PHYSICAL_FILENAME = a.physical_name,
FILEGROUP_NAME = b.name,
FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.size/128.000,2)),
MAX_FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.max_size/128.000,2)),
SPACE_USED_MB = CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2)),
FREE_SPACE_MB = CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,'SpaceUsed'))/128.000,2))
FROM sys.database_files a 
LEFT OUTER JOIN sys.data_spaces b
ON a.data_space_id = b.data_space_id
order by [FILEGROUP_NAME]

--Need to expand DataStore1.
--Old Max_File_Size_MB = 768000

alter database WS_Datamart
modify file (name = DataStore2, maxsize = 800000 MB) 




--alter database tempdb
--modify file (name = , filegrowth = 0 MB) 


---------------------------------------------------------
/*
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
*/


/*
SELECT *
FROM WS_DataMart.sys.database_files 
where growth < 128000
*/
