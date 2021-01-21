
EXEC sp_estimate_data_compression_savings 'capmarket', 'fact_life_of_loan', 0, NULL, 'row' ;
GO

EXEC sp_estimate_data_compression_savings 'capmarket', 'fact_life_of_loan', 0, NULL, 'page' ;
GO

sp_helpindex fact_ucl_servicing

sp_spaceused fact_ucl_servicing

SELECT t.name AS Table_Name, t.lock_escalation, i.name AS Index_Name, i.index_id, i.filter_definition, c.name AS Column_Name, ic.partition_ordinal, ic.is_included_column
FROM sys.tables t
JOIN sys.indexes i ON t.object_id = i.object_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c ON ic.object_id = c.object_id and ic.column_id = c.column_id 
WHERE i.name = 'IX_Timestamp'
AND t.name = 'fact_ucl_servicing'


SELECT *
FROM sys.indexes i
WHERE i.name = 'PK_fact_ucl_servicing'

SELECT *
FROM sys.index_columns ic

SELECT *
FROM sys.columns c


select d.name [database_name], object_name(ius.object_id) [object_name], i.object_id, i.name [index_name], i.index_id
, user_seeks, user_scans, user_lookups, user_updates, last_user_seek, last_user_scan, last_user_lookup, last_user_update, system_seeks, system_scans, last_system_seek, last_system_scan
from sys.dm_db_index_usage_stats ius
join sys.databases d on ius.database_id = d.database_id
join sys.indexes i on ius.object_id = i.object_id and ius.index_id = i.index_id
where d.name = 'HomeDepotCA' AND object_name(ius.object_id) = 'fact_ucl_servicing'
--and user_seeks = 0 and user_scans = 0 and user_lookups = 0 
--and user_updates > 10
order by user_updates desc, object_name(ius.object_id), i.name