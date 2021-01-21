
sp_helpdb UBSP_Content_CL_Portal


--OLTP:  Set Auto Grow as Backup at 500 MB.
alter database UBSP_Content_CL_Portal
modify file (name = UBSP_Content_CL_Portal_log, filegrowth = 500 MB) 



--sp_cycle_errorlog



