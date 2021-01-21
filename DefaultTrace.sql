--SELECT * FROM ::fn_trace_getinfo(0)



SELECT 
     loginname,
     loginsid,
     spid,
     hostname,
     applicationname,
     servername,
     databasename,
     objectName,
     e.category_id,
     cat.name as [CategoryName],
     textdata,
     starttime,
     eventclass,
     eventsubclass,--0=begin,1=commit
     e.name as EventName
     --min(starttime)
FROM ::fn_trace_gettable('C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Log\log_2623.trc',0)
     INNER JOIN sys.trace_events e
          ON eventclass = trace_event_id
     INNER JOIN sys.trace_categories AS cat
          ON e.category_id = cat.category_id
where DatabaseName = 'Staples'   
--and StartTime >= '4/25/2013 16:45'
--and (hostname <> 'criley-pc' or hostname is null)
AND cat.name = 'Objects'
--AND e.name = 'Object:Deleted'
ORDER BY StartTime desc

--and TextData like 'delete%'
--order by StartTime desc
--and OBJECTNAME = 'account_catalogs'