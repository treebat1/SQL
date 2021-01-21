SELECT *
FROM sys.servers


sp_dropserver 'PT2'
GO
sp_addserver 'DEV-BASE', local
GO
