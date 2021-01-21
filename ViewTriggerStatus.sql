--View Trigger Status


SELECT t.*, ta.name
FROM sys.triggers T
JOIN sys.tables ta on t.parent_id = ta.object_id
WHERE t.parent_class = 1
AND ta.name LIKE '%account_settings%'
AND T.is_disabled = 1




SELECT COUNT(1)
FROM sys.triggers T
JOIN sys.tables ta on t.parent_id = ta.object_id
WHERE t.parent_class = 1
AND ta.name LIKE '%account_settings%'
AND T.is_disabled = 1