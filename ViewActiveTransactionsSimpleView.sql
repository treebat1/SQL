--ViewActiveTransactions

select *
from sys.dm_tran_database_transactions tdt
where DB_NAME(tdt.database_id) = 'tempdb' 


select *
from sys.dm_tran_active_transactions tat
order by transaction_begin_time


select transaction_begin_time, session_id, tdt.*, tat.*, tst.*
from sys.dm_tran_database_transactions tdt
left join sys.dm_tran_active_transactions tat on tdt.transaction_id = tat.transaction_id
left join sys.dm_tran_session_transactions tst on tst.transaction_id = tdt.transaction_id
where DB_NAME(tdt.database_id) = 'tempdb'
order by tat.transaction_begin_time

--kill 56


select *
from sys.dm_tran_session_transactions



--select count(1) ActiveTransactions
--from sys.dm_tran_database_transactions tdt
--where DB_NAME(tdt.database_id) = 'Staples' 
