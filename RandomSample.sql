/****** Script for SelectTopNRows command from SSMS  ******/
  SELECT TOP 1000 * --select count(1)
  FROM [HomeDepot].[dbo].[Clickstreams] WITH (NOLOCK)
  WHERE timestamp BETWEEN '2013-08-21' AND '2013-08-22'
  AND ISNUMERIC(session_id) = 0
  and(ABS(CAST((BINARY_CHECKSUM(page_id, tracking_id, NEWID())) as int))% 100) < 1


  --    44,247
  --12,926,155