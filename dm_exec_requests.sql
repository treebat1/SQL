select Percent_Complete
, DATEDIFF(minute, start_time, GETDATE()) AS Minutes_Running
, (DATEDIFF(minute, start_time, GETDATE())/percent_complete) * (100 - percent_complete) AS Minutes_Left
, ((DATEDIFF(minute, start_time, GETDATE())/percent_complete)/60) * (100 - percent_complete) AS Hours_Left
, (DATEDIFF(minute, start_time, GETDATE())/percent_complete) AS Minutes_Per_Percentage
, ((DATEDIFF(minute, start_time, GETDATE())/percent_complete)/60) AS Hours_Per_Percentage
, Start_Time
, Command
, last_wait_type
, db_name(database_id) [Database]
from sys.dm_exec_requests
where 
--command LIKE '%alter%'
--command like 'dbcc%' 
--or 
--command like 'backup%' 
--or 
--command like 'restore%'
--or 
command like 'create%' 
--or 
--command like 'update%' 
--or
--command like 'select%'
--or
--command LIKE '%rollback%'
--or
--command like '%backup%'
--AND database_id = 27




/*
select Percent_complete, start_time, command, db_name(database_id) [Database], last_wait_type, dop
from sys.dm_exec_requests
where command like '%create%'
*/








