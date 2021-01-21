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
select schema_name(t.schema_id) + '.' + OBJECT_NAME(t.object_id)
from sys.tables t
join sys.dm_db_partition_stats p
on t.object_id = p.object_id
where t.name like 'ws%'
AND index_id IN (0,1)
and schema_name(t.schema_id) = 'dbo'
GROUP BY schema_name(t.schema_id), OBJECT_NAME(t.object_id)
having sum(row_count) = 0
order by OBJECT_NAME(t.object_id);


select @maxIdid = MAX(idid) from #tempTableName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = TableName from #tempTableName where idid = @i
	--print @name
		set @sql = N'drop table master.' + @Name
		print @sql
		--EXEC @Return = sp_executesql @sql
	set @i = @i + 1
END   

drop table #tempTableName
-----------


--Output is:

/*
drop table master.dbo.ws_agg_col
drop table master.dbo.ws_agg_col_v
drop table master.dbo.ws_agg_tab
drop table master.dbo.ws_agg_tab_v
drop table master.dbo.ws_app_obj
drop table master.dbo.ws_cube_db
drop table master.dbo.ws_cube_dim
drop table master.dbo.ws_cube_dim_v
drop table master.dbo.ws_cube_drill
drop table master.dbo.ws_cube_drill_v
drop table master.dbo.ws_cube_hie
drop table master.dbo.ws_cube_hie_v
drop table master.dbo.ws_cube_level
drop table master.dbo.ws_cube_level_member
drop table master.dbo.ws_cube_level_member_v
drop table master.dbo.ws_cube_level_v
drop table master.dbo.ws_cube_mea
drop table master.dbo.ws_cube_mea_v
drop table master.dbo.ws_cube_part
drop table master.dbo.ws_cube_part_v
drop table master.dbo.ws_cube_src
drop table master.dbo.ws_cube_tab
drop table master.dbo.ws_cube_tab_v
drop table master.dbo.ws_dbc_connect_v
drop table master.dbo.ws_dbc_target
drop table master.dbo.ws_dbc_target_v
drop table master.dbo.ws_dim_col_v
drop table master.dbo.ws_dim_tab_v
drop table master.dbo.ws_doc_glossary
drop table master.dbo.ws_export_col
drop table master.dbo.ws_export_col_v
drop table master.dbo.ws_export_tab
drop table master.dbo.ws_export_tab_v
drop table master.dbo.ws_fact_col
drop table master.dbo.ws_fact_col_v
drop table master.dbo.ws_fact_kpi
drop table master.dbo.ws_fact_kpi_v
drop table master.dbo.ws_fact_tab
drop table master.dbo.ws_fact_tab_v
drop table master.dbo.ws_file_sequence
drop table master.dbo.ws_hie_header_v
drop table master.dbo.ws_hie_link_v
drop table master.dbo.ws_index_col_v
drop table master.dbo.ws_index_header_v
drop table master.dbo.ws_job_pro_map
drop table master.dbo.ws_join_col
drop table master.dbo.ws_join_col_v
drop table master.dbo.ws_join_tab
drop table master.dbo.ws_join_tab_v
drop table master.dbo.ws_language
drop table master.dbo.ws_language_trans
drop table master.dbo.ws_load_act
drop table master.dbo.ws_load_act_v
drop table master.dbo.ws_load_col
drop table master.dbo.ws_load_col_v
drop table master.dbo.ws_load_tab
drop table master.dbo.ws_load_tab_v
drop table master.dbo.ws_meta_admin
drop table master.dbo.ws_meta_doc
drop table master.dbo.ws_meta_wizard_name
drop table master.dbo.ws_meta_wizard_set
drop table master.dbo.ws_meta_wizard_type
drop table master.dbo.ws_normal_col
drop table master.dbo.ws_normal_col_v
drop table master.dbo.ws_normal_tab
drop table master.dbo.ws_normal_tab_v
drop table master.dbo.ws_obj_checkout
drop table master.dbo.ws_obj_checkout_history
drop table master.dbo.ws_obj_group
drop table master.dbo.ws_obj_maps
drop table master.dbo.ws_obj_pro_map
drop table master.dbo.ws_obj_project
drop table master.dbo.ws_obj_seq
drop table master.dbo.ws_obj_versions
drop table master.dbo.ws_ods_col
drop table master.dbo.ws_ods_col_v
drop table master.dbo.ws_ods_tab
drop table master.dbo.ws_ods_tab_v
drop table master.dbo.ws_olap_cube
drop table master.dbo.ws_olap_cube_act
drop table master.dbo.ws_olap_cube_act_drill
drop table master.dbo.ws_olap_cube_act_drill_v
drop table master.dbo.ws_olap_cube_act_par
drop table master.dbo.ws_olap_cube_act_par_v
drop table master.dbo.ws_olap_cube_act_v
drop table master.dbo.ws_olap_cube_calc
drop table master.dbo.ws_olap_cube_calc_v
drop table master.dbo.ws_olap_cube_dim
drop table master.dbo.ws_olap_cube_dim_att
drop table master.dbo.ws_olap_cube_dim_att_v
drop table master.dbo.ws_olap_cube_dim_hie
drop table master.dbo.ws_olap_cube_dim_hie_v
drop table master.dbo.ws_olap_cube_dim_v
drop table master.dbo.ws_olap_cube_kpi
drop table master.dbo.ws_olap_cube_kpi_v
drop table master.dbo.ws_olap_cube_mgp
drop table master.dbo.ws_olap_cube_mgp_mea
drop table master.dbo.ws_olap_cube_mgp_mea_v
drop table master.dbo.ws_olap_cube_mgp_v
drop table master.dbo.ws_olap_cube_v
drop table master.dbo.ws_olap_db
drop table master.dbo.ws_olap_db_v
drop table master.dbo.ws_olap_dim
drop table master.dbo.ws_olap_dim_att
drop table master.dbo.ws_olap_dim_att_rel
drop table master.dbo.ws_olap_dim_att_rel_v
drop table master.dbo.ws_olap_dim_att_src
drop table master.dbo.ws_olap_dim_att_src_v
drop table master.dbo.ws_olap_dim_att_v
drop table master.dbo.ws_olap_dim_hie
drop table master.dbo.ws_olap_dim_hie_level
drop table master.dbo.ws_olap_dim_hie_level_v
drop table master.dbo.ws_olap_dim_hie_v
drop table master.dbo.ws_olap_dim_v
drop table master.dbo.ws_olap_mgp
drop table master.dbo.ws_olap_mgp_dim
drop table master.dbo.ws_olap_mgp_dim_att
drop table master.dbo.ws_olap_mgp_dim_att_v
drop table master.dbo.ws_olap_mgp_dim_v
drop table master.dbo.ws_olap_mgp_mea
drop table master.dbo.ws_olap_mgp_mea_v
drop table master.dbo.ws_olap_mgp_part
drop table master.dbo.ws_olap_mgp_part_v
drop table master.dbo.ws_olap_mgp_v
drop table master.dbo.ws_olap_perspect
drop table master.dbo.ws_olap_perspect_obj
drop table master.dbo.ws_olap_perspect_obj_v
drop table master.dbo.ws_olap_perspect_v
drop table master.dbo.ws_olap_src
drop table master.dbo.ws_olap_src_v
drop table master.dbo.ws_olap_trans
drop table master.dbo.ws_olap_trans_obj
drop table master.dbo.ws_olap_trans_obj_v
drop table master.dbo.ws_olap_trans_v
drop table master.dbo.ws_pro_gro_map
drop table master.dbo.ws_pro_header_v
drop table master.dbo.ws_pro_line_v
drop table master.dbo.ws_rep_diagram
drop table master.dbo.ws_retro_col
drop table master.dbo.ws_retro_col_v
drop table master.dbo.ws_retro_tab
drop table master.dbo.ws_retro_tab_v
drop table master.dbo.ws_scr_header_v
drop table master.dbo.ws_scr_line_v
drop table master.dbo.ws_script_sequence
drop table master.dbo.ws_sec_pol_line
drop table master.dbo.ws_sec_pol_table
drop table master.dbo.ws_sec_pol_user
drop table master.dbo.ws_sec_policy
drop table master.dbo.ws_sec_role
drop table master.dbo.ws_sec_role_table
drop table master.dbo.ws_sec_role_user
drop table master.dbo.ws_sec_table
drop table master.dbo.ws_stage_col
drop table master.dbo.ws_stage_col_v
drop table master.dbo.ws_stage_tab
drop table master.dbo.ws_stage_tab_v
drop table master.dbo.ws_table_attributes_v
drop table master.dbo.ws_table_joins
drop table master.dbo.ws_tem_header
drop table master.dbo.ws_tem_header_v
drop table master.dbo.ws_tem_line
drop table master.dbo.ws_tem_line_v
drop table master.dbo.ws_tran_model
drop table master.dbo.ws_user_work
drop table master.dbo.ws_user_work_sequence
drop table master.dbo.ws_version_sequence
drop table master.dbo.ws_view_col
drop table master.dbo.ws_view_col_v
drop table master.dbo.ws_view_repl
drop table master.dbo.ws_view_repl_v
drop table master.dbo.ws_view_tab
drop table master.dbo.ws_view_tab_v
drop table master.dbo.ws_wrk_audit_log
drop table master.dbo.ws_wrk_dependency
drop table master.dbo.ws_wrk_dependency_run
drop table master.dbo.ws_wrk_error_log
drop table master.dbo.ws_wrk_job_ctrl
drop table master.dbo.ws_wrk_job_dependency
drop table master.dbo.ws_wrk_job_dependency_run
drop table master.dbo.ws_wrk_job_log
drop table master.dbo.ws_wrk_job_mon
drop table master.dbo.ws_wrk_job_publish
drop table master.dbo.ws_wrk_job_run
drop table master.dbo.ws_wrk_job_thread
drop table master.dbo.ws_wrk_mon_db
drop table master.dbo.ws_wrk_mon_job
drop table master.dbo.ws_wrk_mon_log
drop table master.dbo.ws_wrk_mon_notify
drop table master.dbo.ws_wrk_mon_run
drop table master.dbo.ws_wrk_mon_status
drop table master.dbo.ws_wrk_msg_type
drop table master.dbo.ws_wrk_scheduler
drop table master.dbo.ws_wrk_sequence
drop table master.dbo.ws_wrk_tab_publish
drop table master.dbo.ws_wrk_task_ctrl
drop table master.dbo.ws_wrk_task_log
drop table master.dbo.ws_wrk_task_run
drop table master.dbo.ws_wrk_task_scr_hdr
drop table master.dbo.ws_wrk_task_scr_line
*/