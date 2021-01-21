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
order by 4

--EXEC sp_spaceused '
--exec sp_helpdb 'WS_DataMart'


--dbcc updateusage (Client)
/*
alter database WS_DataMart
modify file (name = DM_Primary02, size = 500000 MB)
*/
--Start is 440,000 MB.  Target is 500,000 MB.  Increase by 60 GB.
--Drive has 534 GB free left.

/*

*/



--sp_spaceused 
/*

*/




--SELECT 100 - ((CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,'SpaceUsed')/128.000,2))/2000000)*100)
--		FROM sys.database_files a 
--		LEFT OUTER JOIN sys.data_spaces b
--		ON a.data_space_id = b.data_space_id
--		where a.name like '%Log'


