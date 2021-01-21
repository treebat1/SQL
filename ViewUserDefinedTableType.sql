USE sephora
go
SELECT *
FROM sys.objects
WHERE type = 'tt'
AND name LIKE '%Subject_Target_Session_Data%'

SELECT *
FROM sys.table_types
WHERE name = 'Subject_Target_Session_Data'


USE Nike
go
SELECT *
FROM sys.objects
WHERE type = 'tt'
AND name LIKE '%Subject_Target_Session_Data%'


SELECT *
FROM sys.table_types
WHERE name = 'Subject_Target_Session_Data'