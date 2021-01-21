--SetupLogShipping
--jewelrytv, jewelrytv, jewelrytv, jewelrytv, jewelry, jewelrytv, jewelrytv


/* Remove Client from current log backup job */
--done

/* Consider taking a full backup and/or diffential to minimize the number of logs backups to restore */
--done


/* Restore full and differential to secondary as NORECOVERY*/
--jewelrytv:  Done
--jewelrytv:  Done

exec master.dbo.RestoreScriptingUtility @DBName = 'jewelrytv', @TargetDBName = 'jewelrytv', @data_file_path = 'J:\SQLData\I7\'
, @client_folder = 'jewelrytv', @log_file_path = 'H:\SQLLogs\I7\', @RecoveryOption = 'NORECOVERY'



-- Execute the following statements at the Primary to configure Log Shipping 
-- for the database [Raider7\I1].[jewelrytv],
-- The script needs to be run at the Primary in the context of the [msdb] database.  
------------------------------------------------------------------------------------- 
-- Adding the Log Shipping configuration 

-- ****** Begin: Script to be run at Primary ******
DECLARE @LS_BackupJobId	AS uniqueidentifier 
DECLARE @LS_PrimaryId	AS uniqueidentifier 
DECLARE @SP_Add_RetCode	As int 

EXEC @SP_Add_RetCode = master.dbo.sp_add_log_shipping_primary_database 
		@database = N'jewelrytv' 
		,@backup_directory = N'\\colo1-backup2\Raider7DifferentialLogBackup' 
		,@backup_share = N'\\colo1-backup2\Raider7DifferentialLogBackup' 
		,@backup_job_name = N'LSBackup_jewelrytv' 
		,@backup_retention_period = 4320
		,@backup_compression = 2
		,@monitor_server = N'RaiderSQL7\I2' 
		,@monitor_server_security_mode = 1 
		,@backup_threshold = 60 
		,@threshold_alert_enabled = 1
		,@history_retention_period = 5760 
		,@backup_job_id = @LS_BackupJobId OUTPUT 
		,@primary_id = @LS_PrimaryId OUTPUT 
		,@overwrite = 1 

IF (@@ERROR = 0 AND @SP_Add_RetCode = 0) 
BEGIN 

DECLARE @LS_BackUpScheduleUID	As uniqueidentifier 
DECLARE @LS_BackUpScheduleID	AS int 

EXEC msdb.dbo.sp_add_schedule 
		@schedule_name =N'LSBackupSchedule_Raider7\I1' 
		,@enabled = 1 
		,@freq_type = 4 
		,@freq_interval = 1 
		,@freq_subday_type = 4 
		,@freq_subday_interval = 15 
		,@freq_recurrence_factor = 0 
		,@active_start_date = 20160823 
		,@active_end_date = 99991231 
		,@active_start_time = 0 
		,@active_end_time = 235900 
		,@schedule_uid = @LS_BackUpScheduleUID OUTPUT 
		,@schedule_id = @LS_BackUpScheduleID OUTPUT 

EXEC msdb.dbo.sp_attach_schedule 
		@job_id = @LS_BackupJobId 
		,@schedule_id = @LS_BackUpScheduleID  

EXEC msdb.dbo.sp_update_job 
		@job_id = @LS_BackupJobId 
		,@enabled = 1 
END 

EXEC master.dbo.sp_add_log_shipping_primary_secondary 
		@primary_database = N'jewelrytv' 
		,@secondary_server = N'RaiderSQL7\I7' 
		,@secondary_database = N'jewelrytv' 
		,@overwrite = 1 
-- ****** End: Script to be run at Primary: ******


-- ****** Begin: Script to be run at Monitor: [RAIDERSQL7\I2] ******
EXEC msdb.dbo.sp_processlogshippingmonitorprimary 
		@mode = 1 
		,@primary_id = N'26889209-4f56-44fc-90e8-8f0d99e1fc28' 
		,@primary_server = N'Raider7\I1' 
		,@monitor_server = N'RAIDERSQL7\I2' 
		,@monitor_server_security_mode = 1 
		,@primary_database = N'jewelrytv' 
		,@backup_threshold = 60 
		,@threshold_alert = 14420 
		,@threshold_alert_enabled = 1 
		,@history_retention_period = 5760 
-- ****** End: Script to be run at Monitor: [RAIDERSQL7\I2] ******


-- Execute the following statements at the Secondary to configure Log Shipping 
-- for the database [RaiderSQL7\I7].[jewelrytv],
-- the script needs to be run at the Secondary in the context of the [msdb] database. 
------------------------------------------------------------------------------------- 
-- Adding the Log Shipping configuration 

-- ****** Begin: Script to be run at Secondary: [RaiderSQL7\I7] ******
DECLARE @LS_Secondary__CopyJobId	AS uniqueidentifier 
DECLARE @LS_Secondary__RestoreJobId	AS uniqueidentifier 
DECLARE @LS_Secondary__SecondaryId	AS uniqueidentifier 
DECLARE @LS_Add_RetCode	As int 

EXEC @LS_Add_RetCode = master.dbo.sp_add_log_shipping_secondary_primary 
		@primary_server = N'Raider7\I1' 
		,@primary_database = N'jewelrytv' 
		,@backup_source_directory = N'\\colo1-backup2\Raider7DifferentialLogBackup' 
		,@backup_destination_directory = N'\\colo1-backup2\Raider7DifferentialLogBackup' 
		,@copy_job_name = N'LSCopy_RaiderSQL7\I7_jewelrytv' 
		,@restore_job_name = N'LSRestore_RaiderSQL7\I7_jewelrytv' 
		,@file_retention_period = 4320 
		,@monitor_server = N'RaiderSQL7\I2' 
		,@monitor_server_security_mode = 1 
		,@overwrite = 1 
		,@copy_job_id = @LS_Secondary__CopyJobId OUTPUT 
		,@restore_job_id = @LS_Secondary__RestoreJobId OUTPUT 
		,@secondary_id = @LS_Secondary__SecondaryId OUTPUT 

IF (@@ERROR = 0 AND @LS_Add_RetCode = 0) 
BEGIN 

DECLARE @LS_SecondaryCopyJobScheduleUID	As uniqueidentifier 
DECLARE @LS_SecondaryCopyJobScheduleID	AS int 

EXEC msdb.dbo.sp_add_schedule 
		@schedule_name =N'DefaultCopyJobSchedule' 
		,@enabled = 1 
		,@freq_type = 4 
		,@freq_interval = 1 
		,@freq_subday_type = 4 
		,@freq_subday_interval = 15 
		,@freq_recurrence_factor = 0 
		,@active_start_date = 20160823 
		,@active_end_date = 99991231 
		,@active_start_time = 0 
		,@active_end_time = 235900 
		,@schedule_uid = @LS_SecondaryCopyJobScheduleUID OUTPUT 
		,@schedule_id = @LS_SecondaryCopyJobScheduleID OUTPUT 

EXEC msdb.dbo.sp_attach_schedule 
		@job_id = @LS_Secondary__CopyJobId 
		,@schedule_id = @LS_SecondaryCopyJobScheduleID  

DECLARE @LS_SecondaryRestoreJobScheduleUID	As uniqueidentifier 
DECLARE @LS_SecondaryRestoreJobScheduleID	AS int 

EXEC msdb.dbo.sp_add_schedule 
		@schedule_name =N'DefaultRestoreJobSchedule' 
		,@enabled = 1 
		,@freq_type = 4 
		,@freq_interval = 1 
		,@freq_subday_type = 4 
		,@freq_subday_interval = 15 
		,@freq_recurrence_factor = 0 
		,@active_start_date = 20160823 
		,@active_end_date = 99991231 
		,@active_start_time = 0 
		,@active_end_time = 235900 
		,@schedule_uid = @LS_SecondaryRestoreJobScheduleUID OUTPUT 
		,@schedule_id = @LS_SecondaryRestoreJobScheduleID OUTPUT 

EXEC msdb.dbo.sp_attach_schedule 
		@job_id = @LS_Secondary__RestoreJobId 
		,@schedule_id = @LS_SecondaryRestoreJobScheduleID  

END 

DECLARE @LS_Add_RetCode2	As int 

IF (@@ERROR = 0 AND @LS_Add_RetCode = 0) 
BEGIN 

EXEC @LS_Add_RetCode2 = master.dbo.sp_add_log_shipping_secondary_database 
		@secondary_database = N'jewelrytv' 
		,@primary_server = N'Raider7\I1' 
		,@primary_database = N'jewelrytv' 
		,@restore_delay = 0 
		,@restore_mode = 0 
		,@disconnect_users	= 0 
		,@restore_threshold = 45   
		,@threshold_alert_enabled = 1 
		,@history_retention_period	= 5760 
		,@overwrite = 1 
END 

IF (@@error = 0 AND @LS_Add_RetCode = 0) 
BEGIN 

EXEC msdb.dbo.sp_update_job 
		@job_id = @LS_Secondary__CopyJobId 
		,@enabled = 0 

EXEC msdb.dbo.sp_update_job 
		@job_id = @LS_Secondary__RestoreJobId 
		,@enabled = 1 
END 


-- ****** End: Script to be run at Secondary******


-------At Alert Server RaiderSQL7\I2-----------------------------

/* Add notification to alert job */

