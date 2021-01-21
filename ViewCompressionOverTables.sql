SELECT SCHEMA_NAME([schema_id]) AS [schema_name]
      ,t.[name] AS [table_name]
      ,i.index_id
	  ,i.[name] AS [index_name]
      ,i.[type_desc] AS [index_type]
	  ,p.partition_number
      ,p.[rows] AS [partition_rows]
      ,p.[data_compression_desc]
	  ,CONVERT(DECIMAL(12,2),ROUND(au.total_pages/128.000,2)) as size_MB
	  ,fg.name as [filegroup_name]
FROM sys.tables t
INNER JOIN sys.partitions p ON p.[object_id] = t.[object_id]
INNER JOIN sys.allocation_units au ON au.container_id = p.hobt_id 
INNER JOIN sys.filegroups fg ON fg.data_space_id = au.data_space_id 
INNER JOIN sys.indexes i ON p.[object_id] = i.[object_id]
                           AND p.[index_id] = i.[index_id]
where --t.name = 'fact_ucl_servicing'
t.name like '%fact%'
and p.data_compression_desc = 'NONE'
and CONVERT(DECIMAL(12,2),ROUND(au.total_pages/128.000,2)) < 100
and CONVERT(DECIMAL(12,2),ROUND(au.total_pages/128.000,2)) > 10
GROUP BY SCHEMA_NAME([schema_id])
        ,t.[name]
        ,i.index_id
		,i.[name]
        ,i.[type_desc]
        ,p.[partition_number]
        ,p.[rows]		
		,CONVERT(DECIMAL(12,2),ROUND(au.total_pages/128.000,2))
        ,p.[data_compression_desc]
		,fg.name
ORDER BY SCHEMA_NAME([schema_id])
        ,t.[name]
        ,i.index_id
		,i.[name];


--select *
--from sys.partitions


--sp_helpindex 'dw.FactInteractiveSessionRec'


/*
select *
from sys.indexes
where fill_factor not in (0,100)
*/

/*

1.  Lack of page compression.
2.  Index not aligned.


*/
