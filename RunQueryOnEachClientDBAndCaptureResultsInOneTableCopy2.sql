DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(2000) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

CREATE TABLE #tempResults
(DatabaseName varchar(100)
, UserName varchar(100)
, MemberOfDBRole varchar(100)
)

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('backupdb','distribution','model','master','msdb','ssisdb','sys_admin')
AND d.name NOT LIKE '%temp%'
and d.name not like 'x_%'
and d.name not like 'test%'
and d.name not like '%mis%'
and d.name not like '%report%'
and mf.state = 0  -- only online
--AND mf.name IN ('')
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	--print @name
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
		BEGIN	
				--PRINT @name
				SET @sql = N'use ' + @Name + '; insert into #tempResults
												SELECT db_name() AS DatabaseName, dp.name AS UserName,
												USER_NAME(drm.role_principal_id) AS MemberOfDBRole 
												FROM sys.database_principals dp
												INNER JOIN sys.database_role_members drm
												ON dp.principal_id=drm.member_principal_id 
												WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL 
												AND dp.type NOT IN (''C'',''R'') AND dp.is_fixed_role <> 1 
												AND dp.name NOT LIKE ''##%'' 
												and USER_NAME(drm.role_principal_id) not like ''%reader%'''

				--print @sql
				EXEC @Return = sp_executesql @sql
	END
	set @i = @i + 1
END  


SELECT *
FROM #tempResults
order by 1,2,3

drop table #tempDBName

DROP TABLE #tempResults


/*

SELECT db_name() AS DatabaseName, dp.name AS UserName,USER_NAME(drm.role_principal_id) AS MemberOfDBRole 
FROM sys.database_principals dp
INNER JOIN sys.database_role_members drm
ON dp.principal_id=drm.member_principal_id 
WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL AND dp.type NOT IN ('C','R') AND dp.is_fixed_role <> 1 
AND dp.name NOT LIKE '##%' and USER_NAME(drm.role_principal_id) not like '%reader%'


*/