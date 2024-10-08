/****** Script for SelectTopNRows command from SSMS  ******/
use msdb
go

SELECT bmf.media_set_id
      , bmf.physical_device_name
	  , bs.database_name
	  , bs.backup_start_date
	  , bs.backup_finish_date
	  , bs.type
FROM dbo.backupmediafamily bmf
join dbo.backupset bs on bmf.media_set_id = bs.media_set_id
--where database_name = 'Resonance_Administration'
order by database_name, backup_finish_date desc


declare @test as varchar(100)

WITH OrderedBackups AS 
(
SELECT 
physical_device_name
, ROW_NUMBER() OVER(ORDER BY backup_finish_date DESC) AS "RowNumber"
FROM dbo.backupmediafamily bmf
join dbo.backupset bs on bmf.media_set_id = bs.media_set_id
where database_name = 'AdidasGlobal'
and type = 'D'
)
select @Test = physical_device_name
from OrderedBackups
where RowNumber = 2

print @Test


