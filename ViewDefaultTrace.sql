--SELECT * FROM ::fn_trace_getinfo(0)

SELECT t.starttime
, e.name
, cat.name
, t.ObjectName
, t.textdata
, t.HostName
, t.ApplicationName
, t.LoginName
, t.DatabaseName
, t.DBUserName
, t.SessionLoginName
, t.FileName
--, *
FROM ::fn_trace_gettable('D:\Program Files\Microsoft SQL Server\MSSQL13.DATAMARTPROD\MSSQL\Log\log_43.trc',0) t
     INNER JOIN sys.trace_events e
          ON t.eventclass = trace_event_id
     INNER JOIN sys.trace_categories AS cat
          ON e.category_id = cat.category_id
where LoginName = 'uboc-ad\ub69843'
ORDER BY 1 desc
--ObjectName like 'ws%'
--TargetLoginName like 'Corp\CTG%'
--and 
--cat.name = 'Security Audit'
--t.DatabaseName = 'tempdb'--
--DatabaseName = 'WS_DataMart'   
--and
--StartTime >= '08/14/2018 03:35:00' and StartTime < '08/14/2018 06:35:00'
--and (NTUserName not in ('svc_tav') or NTUserName is null)
--and (hostname <> 'criley-pc' or hostname is null)
--and 
--AND 
--cat.name = 'Objects'
--AND 
--(e.name like '%Login%')  
--and
--e.name like '%Created%'
--or 
--and 
--(t.TextData like '%mua2g7n%')
--order by StartTime desc
--and OBJECTNAME = 'subscription'
