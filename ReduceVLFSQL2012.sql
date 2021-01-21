SET NOCOUNT ON 



----------------------------------

use ToysRUs

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


/*  Steps to Fix Problems */

--Total Space =   MB

--Run checkpoint
CHECKPOINT
--Truncate Log
dbcc shrinkfile (ToysRUs_LOG, truncateonly)

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

use msdb
go
sp_start_job 'DatabaseBackup - USER_DATABASES - LOG'
go


--backup log Auto_Anything_DW
--to disk =  '\\us1-airwfs-m01\US1-ECOSQL-T21\US1-AIRDBX-T01\Transactional\Auto_Anything_DW_extra.trn' 
--with compression


--Manually Grow Log File to the size of the space used
--Start growing with small increments and work way up to 5GB increments?
--alter database cal_Log
--modify file (name = cal_Log_log, size =  41000 MB)  


sp_helpdb ToysRUs


/* First, here's how the log is divided into VLFs. Each "chunk" that is added, is divided into VLFs at the time the log growth (regardless of whether this is a manual or auto-grow addition) 
and it's all dependant on the size that is ADDED not the size of the log itself. So, take a 10MB log that is extended to 50MB, here a 40MB chunk is being added. This 40MB chunk will be 
divided into 4 VLFs. Here's the breakdown for chunksize:

chunks less than 64MB and up to 64MB = 4 VLFs

chunks larger than 64MB and up to 1GB = 8 VLFs

chunks larger than 1GB = 16 VLFs */

--OLTP:  Set Auto Grow as Backup at 1500 MB.
alter database Auto_Anything_DW
modify file (name = Auto_Anything_DW_log, filegrowth = 1500 MB) 



--Reporting:  Set Auto Grow as Backup at 700 MB.
alter database ToysRUs
modify file (name = ToysRUs_LOG, filegrowth = 700 MB) 