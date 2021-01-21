--Get history of full backups

SELECT s.backup_start_date, s.backup_finish_date, m.physical_device_name
FROM msdb..backupset S
JOIN msdb..backupmediafamily M ON M.media_set_id=S.media_set_id
WHERE S.database_name = 'hst' and Type = 'D'
order by backup_start_date desc