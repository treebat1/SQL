

SELECT
a.file_id,
LOGICAL_NAME = a.name,
PHYSICAL_FILENAME = a.physical_name,
FILEGROUP_NAME = b.name,
FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.size/128.000,2)),
SPACE_USED_MB = CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2)),
FREE_SPACE_MB = CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,'SpaceUsed'))/128.000,2))
FROM sys.database_files a LEFT OUTER JOIN sys.data_spaces b
ON a.data_space_id = b.data_space_id


exec sp_helpdb WS_DataMart

dbcc shrinkfile (DM_Primary02, truncateonly)
--02:34 

--Shrink from 500,000MB to 439,000


--reduce by 
dbcc shrinkfile (Nissen, 6868990)
--


--sp_who2 active

SELECT name, log_reuse_wait, log_reuse_wait_desc
FROM sys.databases
WHERE name = 'Master_Log'
ORDER BY log_reuse_wait desc, log_reuse_wait_desc



CHECKPOINT 60



declare @i as int
declare @sql as nvarchar(2000)

set @i = 2

while @i <= 48
BEGIN
	--set @sql = N'dbcc shrinkfile (Nissen' 
					--+ cast(@i as nvarchar(3)) + ', 10)'
	set @sql = N'dbcc shrinkfile (Nissen' 
					+ cast(@i as nvarchar(3))+')'
	print @sql
	
	set @i = @i + 1
end