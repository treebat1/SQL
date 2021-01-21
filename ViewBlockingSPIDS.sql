Use master
GO


SELECT   
t1.resource_type,  
t1.resource_database_id,  
t1.resource_associated_entity_id,  
t1.request_mode,  
t1.request_session_id,  
t2.blocking_session_id  
FROM sys.dm_tran_locks as t1  
INNER JOIN sys.dm_os_waiting_tasks as t2  
ON t1.lock_owner_address = t2.resource_address
WHERE resource_database_id = DB_ID('Ws_DataMart');


SELECT request_session_id, request_mode, request_status
FROM sys.dm_tran_locks 
WHERE resource_database_id = DB_ID('Ws_DataMart')



SELECT request_session_id 
FROM sys.dm_tran_locks 
WHERE resource_database_id = DB_ID('Ws_DataMart')

dbcc inputbuffer(76)







IF EXISTS(SELECT request_session_id FROM sys.dm_tran_locks WHERE resource_database_id = DB_ID('Model'))
	PRINT 'Model Database being used by some other session'
ELSE
	PRINT 'Model Database not used by other session'


SELECT request_session_id 
FROM sys.dm_tran_locks 
WHERE resource_database_id = DB_ID('Ws_DataMart')

/*
dbcc inputbuffer(63)
kill 61
kill 55
kill 63
*/