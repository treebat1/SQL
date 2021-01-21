select *
from [INFORMATION_SCHEMA].[COLUMNS]
where column_name like '%scheduler%'
and table_schema = 'dbo'
order by 1,2,3,4,5