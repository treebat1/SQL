exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table object_lookup'')
END'
, N'?'
--done

exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_clickstreams'')
END'
, N'?'
--done


exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_clickstream_event_items'')
END'
, N'?'
--done


exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_recommendation_info'')
END'
, N'?'
--failed with error.  one db must be missing this table.
			

exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_recommendation_list'')
END'
, N'?'
--done		


exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_transactions'')
END'
, N'?'				
--done	

	
exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''truncate table olap_behavior_events'')
END'
, N'?'
--running


exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''TRUNCATE TABLE Olap_Current_Dimensions_Session'')
END'
, N'?'	


exec sp_MSforeachdb 
N'USE ? 
IF DB_ID(''?'') > 4
BEGIN
	EXEC (''TRUNCATE TABLE item_cost'')
END'
, N'?'		

				



--sp_MSforeachdb 'USE ? EXEC (''CREATE PROCEDURE TestProc AS BEGIN SELECT 1 END'')' 
--truncate table object_lookup

--select *
--from sysdatabases