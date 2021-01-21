select top 10 der.granted_query_memory * 8 AS MemoryInKB, der.start_time, st.text, der.status, der.command, db_name(der.database_id) AS DatabaseName, der.session_id
, qp.query_plan
, qs.creation_time, qs.execution_count
, qs.total_rows, qs.last_rows
from sys.dm_exec_requests der
left join sys.dm_exec_query_stats qs on der.sql_handle = qs.sql_handle
CROSS APPLY sys.dm_exec_query_plan(der.plan_handle) qp
CROSS APPLY sys.dm_exec_sql_text(der.sql_handle)  st
order by der.granted_query_memory desc