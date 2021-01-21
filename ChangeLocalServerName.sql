--Change Local Server Name


SELECT *
FROM sys.servers

sp_addserver 'Raider7B\I1', 'LOCAL'

sp_dropserver 'RAIDER7\I1'