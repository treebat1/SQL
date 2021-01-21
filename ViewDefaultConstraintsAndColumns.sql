




SELECT dc.*, o.name, c.name
FROM sys.default_constraints DC
JOIN sys.objects o ON dc.parent_object_id = o.object_id
JOIN sys.columns c ON c.object_id = o.object_id AND c.column_id = dc.parent_column_id


SELECT dc.*
FROM sys.default_constraints DC
ORDER BY name

SELECT *
FROM sys.objects
WHERE type = 'D'
ORDER BY name






SELECT dc.*, o.name, c.name
FROM sys.default_constraints DC
JOIN sys.objects o ON dc.parent_object_id = o.object_id
JOIN sys.columns c ON c.object_id = o.object_id AND c.column_id = dc.parent_column_id
WHERE c.name = 'ShowInCEM'
AND o.name ='Behavior_Event_Conversion'
ORDER by o.NAME, c.name



SELECT 1
FROM sys.default_constraints DC
JOIN sys.objects o ON dc.parent_object_id = o.object_id
JOIN sys.columns c ON c.object_id = o.object_id AND c.column_id = dc.parent_column_id
WHERE c.name = 'ShowInCEM'
AND o.name ='Behavior_Event_Conversion'