--SELECT  *
--FROM    sys.sysdatabases


SELECT *
FROM sys.master_files

--SELECT * 
--FROM sys.dm_io_virtual_file_stats(NULL, NULL) vfs

--summary file version.
SELECT  top 100 d.name
		, REPLACE(CONVERT(varchar(20), (CAST(SUM(vfs.size_on_disk_bytes) AS money)), 1), '.00', '')  AS [TotalSizeOnDiskBytes] 
		, SUM(vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS TotalReadWriteBytes
		, SUM(CAST((vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS FLOAT) / CAST(vfs.size_on_disk_bytes AS FLOAT)) AS TotalBusyToSizeMetric
FROM    master.sys.dm_io_virtual_file_stats(NULL, NULL) vfs
        JOIN master.sys.databases d ON vfs.database_id = d.database_id
        JOIN master.sys.master_files f ON vfs.database_id = f.database_id
                                   AND vfs.file_id = f.file_id
WHERE f.physical_name LIKE 'H%'
and f.physical_name not like '%log%'
GROUP BY d.name
ORDER BY SUM(CAST((vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS FLOAT) / CAST(vfs.size_on_disk_bytes AS FLOAT))

--individual file version
SELECT  d.name
        ,f.physical_name
		, REPLACE(CONVERT(varchar(20), (CAST(vfs.size_on_disk_bytes AS money)), 1), '.00', '') AS [Size On Disk Bytes]
		, vfs.num_of_bytes_written + vfs.num_of_bytes_read AS ReadWriteBytes
		, CAST((vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS FLOAT) / CAST(vfs.size_on_disk_bytes AS FLOAT) AS BusyToSizeMetric
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) vfs
        JOIN sys.databases d ON vfs.database_id = d.database_id
        JOIN sys.master_files f ON vfs.database_id = f.database_id
                                   AND vfs.file_id = f.file_id
WHERE f.physical_name LIKE 'H%' --AND vfs.size_on_disk_bytes > 2000000000
ORDER BY CAST((vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS FLOAT) / CAST(vfs.size_on_disk_bytes AS FLOAT) desc


-------------------------------------------------------------

SELECT  d.name
        ,f.physical_name
		,vfs.size_on_disk_bytes 
		, vfs.num_of_bytes_written + vfs.num_of_bytes_read AS TotalReadWriteBytes
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) vfs
        JOIN sys.databases d ON vfs.database_id = d.database_id
        JOIN sys.master_files f ON vfs.database_id = f.database_id
                                   AND vfs.file_id = f.file_id
WHERE   d.name = 'tempdb' AND f.physical_name NOT LIKE '%log%'
ORDER BY vfs.num_of_bytes_written + vfs.num_of_bytes_read DESC
--order by d.name
--order by vfs.size_on_disk_bytes


SELECT  SUM(vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS TotalReadWriteBytesLogs
, REPLACE(CONVERT(varchar(20), (CAST(SUM(vfs.size_on_disk_bytes) AS money)), 1), '.00', '')  AS [TotalSizeOnDiskBytes] 
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) vfs
        JOIN sys.databases d ON vfs.database_id = d.database_id
        JOIN sys.master_files f ON vfs.database_id = f.database_id
                                   AND vfs.file_id = f.file_id
WHERE   f.physical_name LIKE '%log%'
and f.physical_name like 'H%'


SELECT  SUM(vfs.num_of_bytes_written + vfs.num_of_bytes_read) AS TotalReadWriteBytesDataFiles
, REPLACE(CONVERT(varchar(20), (CAST(SUM(vfs.size_on_disk_bytes) AS money)), 1), '.00', '')  AS [TotalSizeOnDiskBytes] 
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) vfs
        JOIN sys.databases d ON vfs.database_id = d.database_id
        JOIN sys.master_files f ON vfs.database_id = f.database_id
                                   AND vfs.file_id = f.file_id
WHERE   f.physical_name NOT LIKE '%log%'
and f.physical_name like 'H%'


/*
1. I determined that H drive log files will fit on E and F drives.
2. I think that the E and the F drives should have enough IO capacity for the H drive log files.

Here's the list of clients to migrate:

CoffeeBean
SevenJeans
TechForLess
Splendid
KitchenKrafts
*/



