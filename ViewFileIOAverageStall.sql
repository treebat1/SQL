--Overall Time
SELECT  
    DB_NAME(vfs.database_id) [db_name]
    ,io_stall_read_ms / NULLIF(num_of_reads, 0) avg_read_latency
    ,io_stall_write_ms / NULLIF(num_of_writes, 0) avg_write_latency
	,physical_name [file_name]
    ,io_stall / NULLIF(num_of_reads + num_of_writes, 0) avg_total_latency
	, num_of_reads
	, num_of_writes
FROM    
        sys.dm_io_virtual_file_stats(NULL, NULL) AS vfs 
    JOIN sys.master_files AS mf 
                ON vfs.database_id = mf.database_id AND vfs.FILE_ID = mf.FILE_ID 
ORDER BY 
        --avg_total_latency DESC;
physical_name


