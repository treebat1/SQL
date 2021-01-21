
--Recommendation_Refresh Past Run Times
WITH CTE
AS
(
	SELECT ROW_NUMBER() OVER (ORDER BY d.Timestamp desc) AS RowNum, d.name, d.account_id, d.server, d.status, d.timestamp
	FROM 
	(
		SELECT name, account_id, server, status, Timestamp
		FROM dbo.Activity_Log AL
		where name = 'Recommendation_Refresh'
		--and server = 'resx100'
		AND status IN ('success','start')
	) d
)
SELECT t1.Name, t1.account_id, t1.server, t1.Status AS StartStatus, t1.Timestamp AS StartTime, t2.Status AS EndStatus, t2.Timestamp AS EndTime
, DATEDIFF(MINUTE, t1.Timestamp, t2.timestamp) AS RunTimeInMinutes
FROM CTE t1
inner JOIN CTE t2 ON t1.RowNum = t2.RowNum + 1
WHERE t1.Status = 'start'
AND t2.Status = 'success'




/*
--Last Recommendation_Refresh Run Time
WITH CTE
AS
(
	SELECT ROW_NUMBER() OVER (ORDER BY d.Timestamp) AS RowNum, d.name, d.account_id, d.server, d.status, d.timestamp
	FROM 
	(
		SELECT name, account_id, server, status, Timestamp
		FROM dbo.Activity_Log AL
		WHERE name = 'Recommendation_Refresh'
		AND server = 'resx100'
		AND status IN ('success')
		AND timestamp = (SELECT MAX(timestamp) FROM dbo.Activity_Log AL2 WHERE AL2.Name = AL.Name AND AL2.Server = AL.Server AND AL2.status = AL.status)
		UNION
		SELECT name, account_id, server, status, timestamp
		FROM dbo.Activity_Log AL
		WHERE name = 'Recommendation_Refresh'
		AND server = 'resx100'
		AND status IN ('Start')
		AND timestamp = (SELECT MAX(timestamp) FROM dbo.Activity_Log AL2 WHERE AL2.Name = AL.Name AND AL2.Server = AL.Server AND AL2.status = AL.status)
	) d
)
SELECT t1.Name, t1.account_id, t1.server, t2.Timestamp AS StartTime, t1.Timestamp AS EndTime, DATEDIFF(MINUTE, t2.Timestamp, t1.timestamp)
FROM CTE t1
LEFT JOIN CTE t2 ON t1.RowNum = t2.RowNum + 1
*/



/*
SELECT TOP 100000 *
FROM dbo.Activity_Log
where name = 'Recommendation_Refresh'
--and server = 'resx63'
ORDER BY Timestamp DESC
*/
