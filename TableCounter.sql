
INSERT INTO dbo.TablePerformanceCounter
(TableName, TableRows, CaptureTime)
SELECT o.name As [tableName]
, p.[rows] As [rowCnt]
, SYSDATETIME() As [captureTime]
FROM sys.indexes As i
JOIN sys.partitions As p
    ON i.[object_id] = p.[object_id]
    AND i.index_id  = p.index_id
JOIN sys.objects As o
    ON i.[object_id] = o.[object_id]
WHERE i.[type] = 1 AND o.name = 'Olap_Behavior_Events'
--AND o.is_ms_shipped = 0

SELECT *
FROM dbo.TablePerformanceCounter
ORDER BY TableName, CaptureTime desc
