


SELECT max_workers_count
FROM sys.dm_os_sys_info


SELECT
resource_associated_entity_id,
request_mode,
request_status,
request_session_id
FROM sys.dm_tran_locks
WHERE resource_database_id = DB_ID('ThreadPoolWaits')
AND resource_type = 'OBJECT'
GO


SELECT
r.command,
r.sql_handle,
r.plan_handle,
r.wait_type,
r.wait_resource,
r.wait_time,
r.session_id,
r.blocking_session_id
FROM sys.dm_exec_requests r
INNER JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
WHERE s.is_user_process = 1
GO












SELECT DATEPART(hour, timestamp), DATEPART(minute, timestamp), COUNT(1)
FROM dbo.clickstreams WITH (NOLOCK)
WHERE timestamp > '2013/12/09'
GROUP BY DATEPART(hour, timestamp), DATEPART(minute, timestamp)
ORDER BY DATEPART(hour, timestamp) desc, DATEPART(minute, timestamp) DESC

SELECT DATEPART(hour, timestamp), DATEPART(minute, timestamp), COUNT(1)
FROM dbo.clickstreams WITH (NOLOCK)
WHERE timestamp >= '2013/12/06' AND timestamp <= '12/7/2013'
GROUP BY DATEPART(hour, timestamp), DATEPART(minute, timestamp)
ORDER BY DATEPART(hour, timestamp) desc, DATEPART(minute, timestamp) desc


SELECT DATEPART(year, timestamp), DATEPART(month, timestamp), DATEPART(day, timestamp), COUNT(1)
FROM dbo.clickstreams WITH (NOLOCK)
WHERE timestamp > '2013/12/09'
GROUP BY DATEPART(year, timestamp), DATEPART(month, timestamp), DATEPART(day, timestamp)
ORDER BY DATEPART(year, timestamp), DATEPART(month, timestamp), DATEPART(day, timestamp)


--RAISERROR (50001, 11, 1) WITH LOG



