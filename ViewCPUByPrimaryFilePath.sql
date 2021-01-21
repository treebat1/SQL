select left(mf.physical_name,1) AS DriveLetter
, sum(qs.total_worker_time) AS CPUTime
, convert(varchar,
			convert(MONEY,100.0 * sum(qs.total_worker_time) / (SELECT SUM(sqs.total_worker_time) 
																	FROM sys.dm_exec_query_stats AS sqs 
																	CROSS APPLY (SELECT CONVERT(int, value) AS [DatabaseID] 
																					FROM sys.dm_exec_plan_attributes(sqs.plan_handle) 
																					WHERE attribute = N'dbid') AS sF_DB 
																	WHERE sf_db.DatabaseID > 4 
																	AND sf_db.DatabaseID <> 32767)
					)
		,1) + '%' AS CPUPercentage
from sys.dm_exec_query_stats AS qs
CROSS APPLY (SELECT CONVERT(int, value) AS [DatabaseID] 
              FROM sys.dm_exec_plan_attributes(qs.plan_handle)
              WHERE attribute = N'dbid') AS F_DB
join sys.master_files mf on mf.database_id = f_db.databaseid
WHERE DatabaseID > 4 -- system databases
AND DatabaseID <> 32767 -- ResourceDB
and mf.file_id = 1
group by left(mf.physical_name,1)
order by left(mf.physical_name,1)


--Raider7 Specific
select case when left(mf.physical_name,1) in ('C','D','G') then 'SAN' else 'DAS' end AS StorageType
, sum(qs.total_worker_time) AS CPUTime
, convert(varchar,
			convert(MONEY,100.0 * sum(qs.total_worker_time) / (SELECT SUM(sqs.total_worker_time) 
																	FROM sys.dm_exec_query_stats AS sqs 
																	CROSS APPLY (SELECT CONVERT(int, value) AS [DatabaseID] 
																					FROM sys.dm_exec_plan_attributes(sqs.plan_handle) 
																					WHERE attribute = N'dbid') AS sF_DB 
																	WHERE sf_db.DatabaseID > 4 
																	AND sf_db.DatabaseID <> 32767)
					)
		,1) + '%' AS CPUPercentage
from sys.dm_exec_query_stats AS qs
CROSS APPLY (SELECT CONVERT(int, value) AS [DatabaseID] 
              FROM sys.dm_exec_plan_attributes(qs.plan_handle)
              WHERE attribute = N'dbid') AS F_DB
join sys.master_files mf on mf.database_id = f_db.databaseid
WHERE DatabaseID > 4 -- system databases
AND DatabaseID <> 32767 -- ResourceDB
and mf.file_id = 1
group by case when left(mf.physical_name,1) in ('C','D','G') then 'SAN' else 'DAS' end
order by case when left(mf.physical_name,1) in ('C','D','G') then 'SAN' else 'DAS' end