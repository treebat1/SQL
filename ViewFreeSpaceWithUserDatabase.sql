  --Percent free space.  Set to run only on user databases.  Alerts me MEDIUM when 25% left, HIGH when 15% left.  This is free space vs space allocated, not a pure disk space.
SELECT
(CONVERT(DECIMAL(12, 2), ROUND((CONVERT(DECIMAL(12, 2), ROUND((size - FILEPROPERTY(name, 'SpaceUsed')) / 128.000, 2)))
/ (CONVERT(DECIMAL(12, 2), ROUND(size / 128.000, 2))) * 100, 2)))
FROM
dbo.sysfiles
WHERE
fileId = 1
