use [UBSP_Content_CL_Bi]
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

checkpoint

dbcc shrinkfile (2, truncateonly)
--

use msdb
go
sp_start_job 'DatabaseBackup - USER_DATABASES - LOG'
go



--sp_who2 active


sp_helpdb ubsp_content_cl_bi


/* First, here's how the log is divided into VLFs. Each "chunk" that is added, is divided into VLFs at the time the log growth (regardless of whether this is a manual or auto-grow addition) 
and it's all dependant on the size that is ADDED not the size of the log itself. So, take a 10MB log that is extended to 50MB, here a 40MB chunk is being added. This 40MB chunk will be 
divided into 4 VLFs. Here's the breakdown for chunksize:

chunks less than 64MB and up to 64MB = 4 VLFs

chunks larger than 64MB and up to 1GB = 8 VLFs

chunks larger than 1GB = 16 VLFs */

----Set Auto Grow as Backup at 1100 MB.
alter database ClientDB
modify file (name = ClientDB, filegrowth = 1100 MB) 

SELECT name, log_reuse_wait, log_reuse_wait_desc
FROM sys.databases
WHERE name = 'ClientDB'
ORDER BY log_reuse_wait desc, log_reuse_wait_desc


--CHECKPOINT 60