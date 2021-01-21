select j.name, command, step_id, step_name, subsystem, [database_name], last_run_date
from msdb.dbo.sysjobsteps js
join msdb.dbo.sysjobs j on js.job_id = j.job_id
where command like '%master.dbo%'
and command not like '%master.dbo.xp%'



select j.name, command, step_id, step_name, subsystem, last_run_date
from msdb.dbo.sysjobsteps js
join msdb.dbo.sysjobs j on js.job_id = j.job_id
where [database_name] = 'master'
and 
(command like '%insert%'
or command like '%update%'
or command like '%delete%'
or command like '%truncate%'
or command like '%into%'
)
and command not like '%ReportServer%'
and name like '%mth_Day%'
order by 1, 3