--search fields for text, ntext and image



select c.name as field_name, object_name(c.object_id) as table_name, t.name as data_type
from sys.columns c
join sys.types t on c.system_type_id = t.system_type_id
where t.name in ('text', 'ntext', 'image')
order by t.name