--Only sysmessages errors written to the Microsoft Windows application log can cause an alert to be sent.


USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'HomeDepot Clickstream Latency Over 60 Seconds', 
		@message_id=50001, --This is the error number raised using Raise Error. Can be changed
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=900, 
		@include_event_description_in=1, 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'test', @operator_name=N'Production Support DBAs', @notification_method = 1
GO

USE master
GO
EXEC sp_addmessage @msgnum = 50001, @severity = 16, @msgtext =  N'HomeDepot clickstream latency over 60 seconds', @with_log = 'True'
GO

sp_dropmessage '50001'

SELECT *
FROM sys.messages
ORDER BY message_id desc