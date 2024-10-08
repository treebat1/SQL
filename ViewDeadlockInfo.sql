DECLARE @Dt date = '20150405'
;WITH Deadlock AS
(
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Id
, CAST(DL.value('.[1]', 'varchar(max)') AS XML) AS Graph
FROM 
(
SELECT CAST(st.target_data AS XML) AS TargetData
FROM sys.dm_xe_session_targets st
JOIN sys.dm_xe_sessions s
ON s.address = st.event_session_address
WHERE s.name = 'system_health'
AND st.target_name = 'ring_buffer'
) AS Data
CROSS APPLY Data.TargetData.nodes('RingBufferTarget/event[@name="xml_deadlock_report"]/child::node()') AS X1 ( DL )
WHERE @Dt IS NULL 
OR DL.value('../@timestamp', 'date') = @Dt
)
, Victim AS
(
SELECT d.Id
, V.value('(@id)[1]', 'varchar(50)') AS VictimId
FROM Deadlock d
CROSS APPLY d.Graph.nodes('deadlock/victim-list/victimProcess') AS X2 ( V )
)
, Process AS
(
SELECT d.Id
, P.value('(@id)[1]', 'varchar(50)') AS ProcessId
, P.value('(@spid)[1]', 'int') AS Spid
, P.value('(@clientapp)[1]', 'varchar(200)') as AppName
, P.value('(@loginname)[1]', 'varchar(50)') as LoginName
, P.value('(@hostname)[1]', 'varchar(50)') as HostName
, P.value('(inputbuf)[1]', 'varchar(max)') as Command
FROM Deadlock d
CROSS APPLY d.Graph.nodes('deadlock/process-list/process') AS X3 ( P )
)
, Resource AS
(
SELECT d.Id
, ROW_NUMBER() OVER (PARTITION BY d.id ORDER BY (SELECT NULL)) AS ResId
, R.value('(@associatedObjectId)[1]', 'bigint') AS HobtId
, R.value('(@dbid)[1]', 'int') AS DbId
, R.value('(@objectname)[1]', 'sysname') AS ObjName
, R.value('(@indexname)[1]', 'sysname') AS IdxName
, R.query('owner-list/owner') AS OwnerList
, R.query('waiter-list/waiter') AS WaiterList
, R.value('local-name(.)', 'varchar(15)') AS LockLevel
FROM Deadlock d
CROSS APPLY d.Graph.nodes('deadlock/resource-list/child::node()') AS X4 ( R )
)
, ResOwner AS
(
SELECT r.Id
, r.ResId
, RO.value('(@id)[1]', 'varchar(50)') AS OwnerProcessId
, RO.value('(@mode)[1]', 'varchar(3)') AS OwnerLockMode
FROM Resource r
CROSS APPLY r.OwnerList.nodes('owner') AS X5 ( RO )
)
, ResWaiter AS
(
SELECT r.Id
, r.ResId
, RW.value('(@id)[1]', 'varchar(50)') AS WaiterProcessId
, RW.value('(@mode)[1]', 'varchar(3)') AS WaiterLockMode
FROM Resource r
CROSS APPLY r.WaiterList.nodes('waiter') AS X6 ( RW )
)
SELECT DB_NAME(r.DbId) AS DbName
, r.ObjName
, r.IdxName
, r.HobtId
, r.LockLevel
, vp.Spid AS VictimSpid
, vp.AppName AS VictimAppName
, vp.HostName AS VictimHostName
, vp.LoginName AS VictimLoginName
, vp.Command AS VictimCommand
, rw.WaiterLockMode AS VictimLockMode
, op.Spid AS WinnerSpid
, op.AppName AS WinnerAppName
, op.HostName AS WinnerHostName
, op.LoginName AS WinnerLoginName
, op.Command AS WinnerCommand
, ro.OwnerLockMode AS WinnerLockMode
, d.Graph
FROM Deadlock d
INNER JOIN Victim v
ON v.Id = d.Id
INNER JOIN Process vp
ON vp.Id = d.Id
AND vp.ProcessId = v.VictimId
INNER JOIN ResWaiter rw
ON rw.Id = d.Id
AND rw.WaiterProcessId = v.VictimId
INNER JOIN Resource r
ON r.Id = d.Id
AND r.ResId = rw.ResId
INNER JOIN ResOwner ro
ON ro.Id = d.Id
AND ro.ResId = rw.ResId
INNER JOIN Process op
ON op.Id = d.Id
AND op.ProcessId = ro.OwnerProcessId
ORDER BY d.Id