-- Purpose: Report active transactions by space or duration.
-- Do not lock anything, and do not get held up by any locks.
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
-- What SQL statements are currently using the transaction logs?
SELECT tst.session_id
  , es.original_login_name
  , DB_NAME(tdt.database_id) AS DatabaseName
  , DATEDIFF(SECOND, tat.transaction_begin_time, GETDATE()) AS [TransDuration(s)]
  , tdt.database_transaction_log_record_count AS SpaceUsed
  , CASE tat.transaction_state
      WHEN 0 THEN 'The transaction has not been completely initialized yet'
      WHEN 1 THEN 'The transaction has been initialized but has not started'
      WHEN 2 THEN 'The transaction is active'
      WHEN 3 THEN 'The transaction has ended'
      WHEN 4 THEN 'The commit process has been initiated on the distributed tran'
      WHEN 5 THEN 'The transaction is in a prepared state and waiting resolution'
      WHEN 6 THEN 'The transaction has been committed'
      WHEN 7 THEN 'The transaction is being rolled back'
      WHEN 8 THEN 'The transaction has been rolled back'
      ELSE 'Unknown'
  END AS TransactionState
  , SUBSTRING(TXT.text, ( er.statement_start_offset / 2 ) + 1,
       ( ( CASE WHEN er.statement_end_offset = -1
                     THEN LEN(CONVERT(NVARCHAR(MAX), TXT.text)) * 2
                     ELSE er.statement_end_offset
              END - er.statement_start_offset ) / 2 ) + 1) AS CurrentQuery
  , TXT.text AS ParentQuery
  , es.host_name
  , CASE tat.transaction_type
      WHEN 1 THEN 'Read/Write Transaction'
      WHEN 2 THEN 'Read-Only Transaction'
      WHEN 3 THEN 'System Transaction'
              WHEN 4 THEN 'Distributed Transaction'
              ELSE 'Unknown'
  END AS TransactionType
  , tat.transaction_begin_time AS StartTime
FROM sys.dm_tran_session_transactions AS tst
       INNER JOIN sys.dm_tran_active_transactions AS tat
              ON tst.transaction_id = tat.transaction_id
       INNER JOIN sys.dm_tran_database_transactions AS tdt
              ON tst.transaction_id = tdt.transaction_id
       INNER JOIN sys.dm_exec_sessions es
              ON tst.session_id = es.session_id
       INNER JOIN sys.dm_exec_requests er
              ON tst.session_id = er.session_id
       CROSS APPLY sys.dm_exec_sql_text(er.sql_handle) TXT
--where DB_NAME(tdt.database_id) = 'HomeDepot' 
--and es.original_login_name = 'Resonance'
--ORDER BY tdt.database_transaction_log_record_count DESC -- log space size.
ORDER BY [TransDuration(s)] DESC -- transaction duration.

/*
2016-07-13 18:32:40.297
update Item_Info set   Text5=    df.[image-large-background],   Text6=    df.[Image-small-background]  from Item_Info   
inner join Items   on items.Item_ID = Item_Info.Item_ID   
inner join (select dfps.collection, dfcs.[default], dfcs.[image-large-background], dfcs.[Image-small-background], dfcs.inventory
,   row_number() over (partition by dfps.collection order by dfps.collection,    case when dfcs.[default] = 'Y' and dfcs.inventory > 0 then 999999 else dfcs.inventory end    desc) as rownumber  
from data_feed_abercrombiec01_parent_single_attributes dfps  inner join data_feed_abercrombiec01_parent_child dfpc  on dfps.collection = dfpc.id  
inner join data_feed_abercrombiec01_child_single_attributes dfcs  on dfpc.sku = dfcs.skushort) df   on Items.Account_Item_ID = df.collection   and Items.Account_ID = @account_id   
and Items.Catalog_ID = @catalog_id  where rownumber=1
*/



----For One Database
--SELECT 
--cast(ROUND(s.last_elapsed_time/1000.0,0) as int) AS LastExecutionDuration_MS
----, DB_NAME(s.database_id) [DatabaseName]
--FROM sys.dm_exec_procedure_stats s
--WHERE OBJECT_NAME(s.object_id,s.database_id)='Get_Subject_Profile' 
--AND OBJECT_SCHEMA_NAME(s.object_id,s.database_id)='dbo' 
--and s.last_elapsed_time > 0
--and s.last_execution_time > dateadd(minute,-1,getdate())
--and DB_NAME(s.database_id) = 'Staples'