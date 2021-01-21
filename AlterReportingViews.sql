
use BathAndBodyWorks
set nocount on
go
select 'use BathAndBodyWorks' + char(10) + char(13) + 'Go'
SELECT REPLACE(REPLACE(definition, 'Raidersql10\I10', 'Raider14\i1'),'create','ALTER') + '
' + ' GO'
from sys.sql_modules m
join sys.objects o on m.object_id = o.object_id
where 
m.definition like '%Raidersql10\I10%'
AND 
o.type_desc = 'View'

-- sp_who

--select *
--select 
--from sys.sql_modules m
--join sys.objects o on m.object_id = o.object_id

