select *
from sys.assemblies

SELECT * 
FROM sys.dm_clr_appdomains;

SELECT * 
FROM sys.dm_clr_loaded_assemblies;

--Too watch for memory problems.
select * 
from sys.dm_os_memory_clerks 
where type = 'MEMORYCLERK_SQLCLR'