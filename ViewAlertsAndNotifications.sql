use msdb
go

EXEC sp_help_alert

exec sp_help_operator

exec sp_help_notification @object_type = 'alerts', @name = '#CTG-DatabaseAdministration-OnCall', @enum_type = 'all', @notification_method = '1'