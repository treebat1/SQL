select fk.name [fk.object_name], object_name(fk.parent_object_id) [parent_object_name], object_name(fk.referenced_object_id) [referenced_object_name], c.name [column_name]
, fk.create_date, fk.modify_date
, fk.is_disabled
from sys.foreign_keys fk
join sys.foreign_key_columns fkc on fk.object_id = fkc.constraint_object_id
join sys.columns c on fkc.parent_object_id = c.object_id and fkc.parent_column_id = c.column_id
order by fk.name

select name, object_name(parent_object_id) [parent_object_name], create_date, modify_date, is_disabled, definition
from sys.check_constraints
order by name