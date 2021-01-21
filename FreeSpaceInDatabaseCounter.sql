--Set Up Free Space Counter


SELECT  name AS 'File Name' , 
 physical_name AS 'Physical Name', 
 size/128 AS 'Total Size in MB',
 size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS 'Available Space In MB',
 round((CAST(FILEPROPERTY(name, 'SpaceUsed') AS float)/size)* 100 ,2) AS  'Percentage Used',
 *
FROM sys.database_files
WHERE type_desc = 'rows'


SELECT  ROUND(AVG((CAST(FILEPROPERTY(name, 'SpaceUsed') AS float)/size)* 100), 2)
FROM sys.database_files
WHERE type_desc = 'rows';


DECLARE @FreePercent int

SELECT @FreePercent = 100 - ROUND(AVG((CAST(FILEPROPERTY(name, 'SpaceUsed') AS float)/size)* 100), 2)
FROM sys.database_files
WHERE type_desc = 'rows';

EXEC sp_user_counter10 @FreePercent