--Set Remote Query Timeout
--In Seconds


--I think setting at 24 hours would be a good starting point.
--24 hours * 60 minutes * 60 seconds = 86400
sp_configure

EXEC sp_configure 'remote query timeout', 86400;
GO
RECONFIGURE ;
GO