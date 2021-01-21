SELECT *
FROM sys.views
WHERE name = 'v_Referring_Domain'
AND schema_id = 1


SELECT *
FROM sys.sql_modules
where definition like '%View%'

select *
from sys.objects
where type = 'v'

select *
from sys.objects
order by name