--select * from sys.databases

--select * from sys.database_files


EXEC sp_MSForEachDB 'USE [?]; SELECT ''?'' AS DatabaseName, size * 8 as FileSizeKB  FROM sys.database_files'
