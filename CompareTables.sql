
SELECT DEV.name as DEV_ColumnName, 
PROD.name as PROD_ColumnName, 
DEV.is_nullable as DEV_is_nullable, 
PROD.is_nullable as PROD_is_nullable, 
DEV.system_type_name as DEV_Datatype, 
PROD.system_type_name as PROD_Datatype, 
DEV.is_identity_column as DEV_is_identity, 
PROD.is_identity_column as PROD_is_identity  
FROM sys.dm_exec_describe_first_result_set (N'SELECT * FROM ccar.ds_ccar_wholesale_frb_edits_cil', NULL, 0) DEV 
FULL OUTER JOIN  sys.dm_exec_describe_first_result_set (N'SELECT * FROM ws_datamart.ccar.ds_ccar_wholesale_frb_edits_cre', NULL, 0) PROD 
ON DEV.name = PROD.name 
GO



/*



select pc.table_name, pc.column_name
from [INFORMATION_SCHEMA].[COLUMNS] pc
where pc.table_name like '%ccar%'
and 
pc.table_schema = 'ccar'
order by 1,2



select *
from [INFORMATION_SCHEMA].[COLUMNS]
where table_name like '%ccar%'
and 
table_schema = 'ccar'
order by 1,2,3,4,5

*/