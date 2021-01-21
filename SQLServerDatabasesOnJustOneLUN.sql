--Raider5\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE 'c:\SQLData%'
AND physical_name NOT LIKE '%Raider_LUN2%'
GROUP BY d.name
ORDER BY d.name



--Raider6\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE 'c:\SQLData%'
GROUP BY d.name
ORDER BY d.name



--Raider7\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE '[c-d]:\SQLData%'
GROUP BY d.name
ORDER BY d.name



--Raider8\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE 'd:\SQLData%'
GROUP BY d.name
ORDER BY d.name



--Raider9\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE 'd:\SQLData%'
GROUP BY d.name
ORDER BY d.name



--Raider10\i1
SELECT d.name--, mf.*
FROM sys.master_files mf
JOIN sys.databases d ON mf.database_id = d.database_id
WHERE physical_name LIKE 'd:\SQLData%'
AND physical_name NOT LIKE '%HDrive%'
AND physical_name NOT LIKE '%JDrive%'
AND physical_name NOT LIKE '%KDrive%'
AND physical_name NOT LIKE '%LDrive%'
GROUP BY d.name
ORDER BY d.name