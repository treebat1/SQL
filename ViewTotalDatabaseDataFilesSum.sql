--select sum(CONVERT(DECIMAL(12,2),ROUND(size/128.000,2))) as TotalDataFileSizeInMB
--from sys.master_files
--where type_desc = 'rows'


--dev
select SUM(CONVERT(DECIMAL(12,2),ROUND(size/128.000,2))) as TotalDataFileSizeInMB
from sys.master_files mf
JOIN sys.databases D ON mf.database_id = d.database_id
where type_desc = 'rows'
AND d.name NOT IN ('Sonar')

--qa
select SUM(CONVERT(DECIMAL(12,2),ROUND(size/128.000,2))) as TotalDataFileSizeInMB
from sys.master_files mf
JOIN sys.databases D ON mf.database_id = d.database_id
where type_desc = 'rows'
AND d.name NOT IN ('ActiveLifeCanada', 'Bebe', 'CEMMaster_Template', 'DBA', 'eBags', 'Forever21', 'Forever21_Reporting', 'JoesJeans', 'JReport'
, 'JReport_Repository', 'jrprepository_old', 'ReebokGlobal', 'ResonanceRecords_Reporting', 'SoftSurroundings', 'UniqloJP_old')




select d.name, SUM(CONVERT(DECIMAL(12,2),ROUND(size/128.000,2))) as TotalDataFileSizeInMB
from sys.master_files mf
JOIN sys.databases D ON mf.database_id = d.database_id
where type_desc = 'rows'
GROUP BY d.name


--select *
--from sys.master_files
