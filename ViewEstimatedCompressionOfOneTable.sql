--Run only for one table and one index

declare @schema_name sysname
declare @object_name sysname
declare @index_id int

set @schema_name = 'dbo'
set @object_name = 'ds_msp_user_defined'
set @index_id = 1  --0 = heap, 1 = clustered index, >=2 non-clustered index

IF OBJECT_ID('tempdb..#EstimatedDataCompression') IS NOT NULL DROP TABLE #EstimatedDataCompression

create table #EstimatedDataCompression 
([object_name] sysname
,[schema_name] sysname
,[index_id] int
,[partition_number] int
,[size_with_current_compression_setting(KB)]  bigint
,[size_with_requested_compression_setting(KB)] bigint
,field7 bigint
,field8 bigint
,compression_type varchar(100) null
)

insert into #EstimatedDataCompression
([object_name]
,[schema_name] 
,[index_id] 
,[partition_number] 
,[size_with_current_compression_setting(KB)]  
,[size_with_requested_compression_setting(KB)] 
,field7 
,field8
)
exec dbo.sp_estimate_data_compression_savings @schema_name, @object_name, @index_id, NULL, 'row'

update #EstimatedDataCompression
set compression_type = 'row'

insert into #EstimatedDataCompression
([object_name]
,[schema_name] 
,[index_id] 
,[partition_number] 
,[size_with_current_compression_setting(KB)]  
,[size_with_requested_compression_setting(KB)] 
,field7 
,field8
)
exec dbo.sp_estimate_data_compression_savings @schema_name, @object_name, @index_id, NULL, 'page'

update #EstimatedDataCompression
set compression_type = 'page'
where compression_type IS NULL


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
	  ,e.[size_with_requested_compression_setting(KB)]
	  ,e.compression_type
FROM sys.tables t
INNER JOIN sys.partitions p ON p.[object_id] = t.[object_id]
INNER JOIN sys.allocation_units au ON au.container_id = p.hobt_id 
INNER JOIN sys.filegroups fg ON fg.data_space_id = au.data_space_id 
INNER JOIN sys.indexes i ON p.[object_id] = i.[object_id]
                           AND p.[index_id] = i.[index_id]
inner join #EstimatedDataCompression e on e.[object_name] = t.[name]
										and e.[schema_name] = SCHEMA_NAME([schema_id])
										and e.index_id = i.index_id
										and e.partition_number = p.partition_number
where t.name = @object_name
and SCHEMA_NAME([schema_id]) = @schema_name
and p.data_compression_desc = 'NONE'
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
		,e.[size_with_requested_compression_setting(KB)]
		,e.compression_type
ORDER BY SCHEMA_NAME([schema_id])
        ,t.[name]
        ,i.index_id
		,i.[name];






		
--select *
--from sys.tables


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
