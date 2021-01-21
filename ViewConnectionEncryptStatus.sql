SELECT net_transport, encrypt_option, *
FROM sys.dm_exec_connections
order by session_id