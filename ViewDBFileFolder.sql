SELECT REPLACE(physical_name, 'alibris.mdf', 'alibris\Similarity_Lists.ndf') 
FROM alibris.sys.database_files 
WHERE physical_name LIKE '%.mdf'

SELECT physical_name, REVERSE(physical_name), CHARINDEX('\',REVERSE(physical_name)), LEN(physical_name)
,  LEN(physical_name) - CHARINDEX('\',REVERSE(physical_name))
,  LEFT(physical_name, LEN(physical_name) - CHARINDEX('\',REVERSE(physical_name)))
FROM alibris.sys.database_files 
WHERE physical_name LIKE '%.mdf'


SELECT LEFT(physical_name, LEN(physical_name) - CHARINDEX('\',REVERSE(physical_name))) + '\Alibris\Similarity_Lists.ndf'
FROM alibris.sys.database_files 
WHERE physical_name LIKE '%.mdf'