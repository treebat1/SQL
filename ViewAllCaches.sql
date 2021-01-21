SELECT cache_address, name, [type]
FROM sys.dm_os_memory_cache_counters 
WHERE [type] LIKE 'CACHE%'