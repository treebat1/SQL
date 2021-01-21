SELECT *
FROM  sys.servers
ORDER BY name

SELECT @@SERVERNAME


sp_dropserver 'CHDC-CAR-THSQL1\DATAMARTDEV'

sp_addserver 'CAR-DMSQL-DEV\DATAMARTDEV', 'local'


/* Restart SQL Server Services */



SELECT *
FROM  sys.servers
ORDER BY name

SELECT @@SERVERNAME