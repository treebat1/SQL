use master
go

DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(200) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempTableName
(idid int not null identity(1,1)
, TableName varchar(100))

insert into #tempTableName
(TableName)
select OBJECT_NAME(t.object_id)
from sys.tables t
join sys.dm_db_partition_stats p
on t.object_id = p.object_id
where t.name like 'ws%'
AND index_id IN (0,1)
and schema_name(t.schema_id) = 'dbo'
GROUP BY OBJECT_NAME(t.object_id)
having sum(row_count) > 0
order by OBJECT_NAME(t.object_id);


select @maxIdid = MAX(idid) from #tempTableName

print 'begin transaction'

set @i = 1
WHILE @i <= @maxIdid   
BEGIN   
	select @name = TableName from #tempTableName where idid = @i
	--print @name
		set @sql = N'select * into backupdb.dbo.bu_20190130_master_'+ @Name + ' from master.dbo.' + @name + '; drop table master.dbo.' + @Name
		print @sql
		--EXEC @Return = sp_executesql @sql
	set @i = @i + 1
END   

print 'commit transaction'

drop table #tempTableName
-----------


--Output is:

/*
begin transaction
select * into backupdb.dbo.bu_20190130_master_ws_dbc_connect from master.dbo.ws_dbc_connect; drop table master.dbo.ws_dbc_connect
select * into backupdb.dbo.bu_20190130_master_ws_dim_col from master.dbo.ws_dim_col; drop table master.dbo.ws_dim_col
select * into backupdb.dbo.bu_20190130_master_ws_dim_tab from master.dbo.ws_dim_tab; drop table master.dbo.ws_dim_tab
select * into backupdb.dbo.bu_20190130_master_ws_hie_header from master.dbo.ws_hie_header; drop table master.dbo.ws_hie_header
select * into backupdb.dbo.bu_20190130_master_ws_hie_link from master.dbo.ws_hie_link; drop table master.dbo.ws_hie_link
select * into backupdb.dbo.bu_20190130_master_ws_index_col from master.dbo.ws_index_col; drop table master.dbo.ws_index_col
select * into backupdb.dbo.bu_20190130_master_ws_index_header from master.dbo.ws_index_header; drop table master.dbo.ws_index_header
select * into backupdb.dbo.bu_20190130_master_ws_meta from master.dbo.ws_meta; drop table master.dbo.ws_meta
select * into backupdb.dbo.bu_20190130_master_ws_meta_db_functions from master.dbo.ws_meta_db_functions; drop table master.dbo.ws_meta_db_functions
select * into backupdb.dbo.bu_20190130_master_ws_meta_names from master.dbo.ws_meta_names; drop table master.dbo.ws_meta_names
select * into backupdb.dbo.bu_20190130_master_ws_meta_tables from master.dbo.ws_meta_tables; drop table master.dbo.ws_meta_tables
select * into backupdb.dbo.bu_20190130_master_ws_obj_action from master.dbo.ws_obj_action; drop table master.dbo.ws_obj_action
select * into backupdb.dbo.bu_20190130_master_ws_obj_object from master.dbo.ws_obj_object; drop table master.dbo.ws_obj_object
select * into backupdb.dbo.bu_20190130_master_ws_obj_type from master.dbo.ws_obj_type; drop table master.dbo.ws_obj_type
select * into backupdb.dbo.bu_20190130_master_ws_pro_header from master.dbo.ws_pro_header; drop table master.dbo.ws_pro_header
select * into backupdb.dbo.bu_20190130_master_ws_pro_line from master.dbo.ws_pro_line; drop table master.dbo.ws_pro_line
select * into backupdb.dbo.bu_20190130_master_ws_scr_header from master.dbo.ws_scr_header; drop table master.dbo.ws_scr_header
select * into backupdb.dbo.bu_20190130_master_ws_scr_line from master.dbo.ws_scr_line; drop table master.dbo.ws_scr_line
select * into backupdb.dbo.bu_20190130_master_ws_table_attributes from master.dbo.ws_table_attributes; drop table master.dbo.ws_table_attributes
select * into backupdb.dbo.bu_20190130_master_ws_typ_act_map from master.dbo.ws_typ_act_map; drop table master.dbo.ws_typ_act_map
select * into backupdb.dbo.bu_20190130_master_ws_user_adm from master.dbo.ws_user_adm; drop table master.dbo.ws_user_adm
commit transaction
*/