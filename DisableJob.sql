
	--print 'Test'
	EXEC msdb.dbo.sp_update_job @job_name = 'Reporting Generation LandsEnd Replay', @enabled = 0 