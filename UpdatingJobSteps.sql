
--Microsoft SPs
sp_update_jobstep



--Direct system table change method.
SELECT j.Name, Command AS OldCommand, REPLACE(command, 'chdc-cls-dhsql9','NewServer') AS NewCommand
FROM msdb.dbo.sysjobsteps js
JOIN msdb.dbo.sysjobs j ON js.job_id = j.job_id
WHERE 
command LIKE '%chdc-cls-dhsql9%'
AND name LIKE '%Load%'


/*
update msdb.dbo.sysjobsteps
set command = REPLACE(command, 'chdc-cls-dhsql9','NewServer')
FROM msdb.dbo.sysjobsteps js
JOIN msdb.dbo.sysjobs j ON js.job_id = j.job_id
WHERE 
command LIKE '%chdc-cls-dhsql9%'
AND name LIKE '%Load%'
*/



--select command
--from msdb.dbo.sysjobsteps js
--where command like '%msdb.dbo.sp_send_dbmail%'