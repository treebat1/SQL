use HomeDecorators
go

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

sp_helpdb HomeDecorators

dbcc shrinkfile (web_service_trace, truncateonly)
--


--reduce by 
dbcc shrinkfile (HomeDecorators, 360000)
--running

--sp_who2 active