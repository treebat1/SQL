set nocount on
go
select 'use AirGas' + char(10) + char(13) + 'Go'

select replace(replace(REPLACE(definition, 'Raider7\I1', 'RaiderSQL7\I7'),'create','ALTER'), 'Template', 'AirGas') + ' GO'
from sys.sql_modules m
join sys.objects o on m.object_id = o.object_id
where m.definition like '%Raider7\I1%' and o.type_desc = 'View'
