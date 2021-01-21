--select o.*, cl.*, t.*

sp_help 'stage_icrs_expanded_rerating_upcoming_past_due_13'

--An Alternate Way to Do This
select *
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'stage_dim_commercial_organization_05_prep'
--and column_name = 'Item_ID'

SELECT COL_LENGTH('Recommendation_List', 'Item_ID')

/*
--An Alternate Way to Do This
SELECT cl.system_type_id, cl.user_type_id, cl.max_length, cl.*
from sys.objects o 
join sys.columns cl on o.object_id = cl.object_id
join sys.types t on cl.user_type_id = t.user_type_id
where o.name = 'Recommendation_List'
and cl.name = 'Item_ID'
*/



