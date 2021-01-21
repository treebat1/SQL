SELECT *
FROM sys.dm_exec_connections
where net_transport = 'TCP'
order by session_id


SELECT *
FROM sys.dm_exec_connections
order by session_id

SELECT local_net_address, local_tcp_port, *
FROM sys.dm_exec_connections
order by 1, 2


SELECT net_transport 
FROM sys.dm_exec_connections 
WHERE session_id = @@SPID;