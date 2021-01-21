--Top 20 Queries Needing Maintenance


DECLARE @db_id SMALLINT;

SET @db_id = DB_ID(N'easycare');


SELECT TOP 20
    a.object_id AS objectid,QUOTENAME(object_name(a.object_id)) as objectname,
    a.index_id AS indexid,
    indexname = QUOTENAME(b.name),
	schemaname=QUOTENAME(d.name),
    partition_number AS partitionnum,
    avg_fragmentation_in_percent AS frag
FROM sys.dm_db_index_physical_stats (@db_id,Null, NULL, NULL, 'LIMITED') AS a
JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
join sys.objects AS c on a.object_id= c.object_id
JOIN sys.schemas as d ON d.schema_id = c.schema_id
where isnull(objectproperty(a.object_id,'IsUserTable'),0) = 1 AND isnull(a.index_id,0) > 0
and avg_fragmentation_in_percent>10.0 and a.page_count  > 1000