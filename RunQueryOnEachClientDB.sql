--select DB_NAME()

--sp_spaceused 'User_info'


DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(1000) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT distinct d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','master','msdb','ASP_NET_Session_State','FDC-Testing','RedGate'
,'CEMMaster')
--,'Monitor')
--AND d.name NOT LIKE '%Part'
and mf.state = 0  -- only online
--AND d.name NOT LIKE '%Avenue%'
--AND mf.name LIKE '[D-Z]%'
--AND mf.name = 'agjeans'
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	--print @name
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
		BEGIN	
								SET @sql = N'use ' + @Name + '; enable TRIGGER [Trg_LogDDLEvent] ON DATABASE'
				--print @SQL
				EXEC @Return = sp_executesql @sql
	END
	set @i = @i + 1
END   

drop table #tempDBName


--ALTER DATABASE [AdvanceAutoParts] SET COMPATIBILITY_LEVEL = 130

--SET @sql = N'use ' + @Name + '; disable TRIGGER [Trg_LogDDLEvent] ON DATABASE'


--SET @sql = N'use ' + @Name + '; enable TRIGGER [Trg_LogDDLEvent] ON DATABASE'



/*
SET @sql = N'use ' + @Name + '; SELECT
												a.file_id,
												LOGICAL_NAME = a.name,
												PHYSICAL_FILENAME = a.physical_name,
												FILEGROUP_NAME = b.name,
												FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.size/128.000,2)),
												SPACE_USED_MB = CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,''SpaceUsed'')/128.000,2)),
												FREE_SPACE_MB = CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,''SpaceUsed''))/128.000,2))
												FROM sys.database_files a 
												LEFT OUTER JOIN sys.data_spaces b
												ON a.data_space_id = b.data_space_id
												WHERE a.physical_name like ''%Catalog_Similarity%'''
*/

/*
set @sql = N'ALTER DATABASE [' + @Name + '] SET COMPATIBILITY_LEVEL = 130'
*/



/*
set @sql = N'use ' + @name + '; if exists (select * from sys.objects where name like ''Personalized_SearchTerm'' and type = ''u'') select DB_Name()'
*/

/*
set @sql = N'use ' + @name + '; if exists (select * from sys.objects where name like ''Behavior_Events'' and type = ''u'') select DB_Name()'
*/


/*
set @sql = N'use ' + @name + '; EXEC dbo.Get_Subject_Profile_Recent_Direct_Events ''43C2499C-07A0-42EA-958F-AB59755B8BE2'', 10000'
*/

/*
N'use ' + @Name + '; truncate table dbo.Web_Service_Trace'
*/


/* 
N'use ' + @Name + '; select value from dbo.Account_Settings where keyword = ''Reporting Server Live'''
*/


/*
alter database [fdc-testing] set recovery simple
*/

/* 
N'use ' + @Name + '; select value from dbo.Account_Settings where keyword = ''Write Web Service Trace'' and value = ''True'''
*/

/*
'; SELECT db_name(), a.name AS [Application Name]
FROM dbo.Applications a 
inner JOIN dbo.Application_Packages ap 
ON a.Application_ID = ap.Application_ID
inner JOIN dbo.Packages p 
ON ap.Package_ID = p.Package_ID
inner JOIN dbo.Package_Types pt 
on p.Subtype = pt.[Type_ID]
WHERE pt.Name = ''Search-Search Results'''
*/


--set @sql = N'use ' + @name + '; SELECT db_name(), o.modify_date, o.create_date, sm.object_id, OBJECT_NAME(sm.object_id) AS object_name, o.type, o.type_desc, sm.definition
--FROM sys.sql_modules AS sm JOIN sys.objects AS o ON sm.object_id = o.object_id WHERE OBJECT_NAME(sm.object_id) = ''Get_Subject_Profile_by_Scheme'''



--SELECT o.modify_date, o.create_date, sm.object_id, OBJECT_NAME(sm.object_id) AS object_name, o.type, o.type_desc, sm.definition
--FROM sys.sql_modules AS sm JOIN sys.objects AS o ON sm.object_id = o.object_id WHERE OBJECT_NAME(sm.object_id) = 'Get_Subject_Profile_by_Scheme'


--set @sql = N'use ' + @name + '; if exists (select * from sys.objects where name like ''Behavior_Events'' and type = ''u'') select DB_Name()'

--use Bebe
--go
--select rc.remarketing_campaign_id, bec.event, rc.[abandonment_interval_id], rc.[lookback_interval_id]
--from dbo.Remarketing_Campaigns as RC
--inner join ResConfig.Resonance_Configuration.dbo.Remarketing_Campaign_Abandonments as RCA
--on RC.Abandonment_ID = RCA.Abandonments_ID
--inner join dbo.Behavior_Event_Conversion as BEC
--on BEC.Target_Model_Class_ID = RCA.Include_Target_Model_Class_ID
--and BEC.Application_ID = RC.Application_ID
--where RC.Status_ID in (1, 2) 
--AND RC.Abandonment_ID <> 0
--order by Remarketing_Campaign_ID, event

--select rc.remarketing_campaign_id, IC.Event, rc.[abandonment_interval_id], rc.[lookback_interval_id]
--from dbo.Remarketing_Campaigns as RC
--	inner join dbo.Remarketing_Include_Behavior_Events as IC
--		on RC.Remarketing_Campaign_ID = IC.Remarketing_Campaign_ID
--where RC.Status_ID in (1, 2) 
--AND RC.Abandonment_ID = 0


--select * from sys.objects where name like 'Behavior_Events' and type = 'u'

--				SET @sql = N'use ' + @Name + '; select bec.event, rc.[abandonment_interval_id], rc.[lookback_interval_id]
--from dbo.Remarketing_Campaigns as RC
--inner join ResConfig.Resonance_Configuration.dbo.Remarketing_Campaign_Abandonments as RCA
--on RC.Abandonment_ID = RCA.Abandonments_ID
--inner join dbo.Behavior_Event_Conversion as BEC
--on BEC.Target_Model_Class_ID = RCA.Include_Target_Model_Class_ID
--and BEC.Application_ID = RC.Application_ID
--where RC.Status_ID in (1, 2) 
--AND RC.Abandonment_ID <> 0'
				--SET @sql = N'use ' + @Name + '; SELECT DB_NAME()'
				--PRINT @name
				--print @sql
				--EXEC @Return = sp_executesql @sql
				--SET @sql = N'use ' + @Name + ' IF EXISTS 
				--								(SELECT 1
				--								from sys.partitions
				--								where object_id = object_id(''[dbo].[image_service_bookmark]'')
				--								AND (data_compression_desc <> ''Page'' OR data_compression_desc IS NULL))
				--								PRINT''Not Compressed'''
				--select @name
				--print @sql
				--EXEC @Return = sp_executesql @sql
				--SET @sql = N'use ' + @Name + '; SELECT
				--								a.file_id,
				--								LOGICAL_NAME = a.name,
				--								PHYSICAL_FILENAME = a.physical_name,
				--								FILEGROUP_NAME = b.name,
				--								FILE_SIZE_MB = CONVERT(DECIMAL(12,2),ROUND(a.size/128.000,2)),
				--								SPACE_USED_MB = CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(a.name,''SpaceUsed'')/128.000,2)),
				--								FREE_SPACE_MB = CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,''SpaceUsed''))/128.000,2))
				--								FROM sys.database_files a 
				--								LEFT OUTER JOIN sys.data_spaces b
				--								ON a.data_space_id = b.data_space_id
				--								WHERE CONVERT(DECIMAL(12,2),ROUND((a.size-FILEPROPERTY(a.name,''SpaceUsed''))/128.000,2)) > 100000
				--								and a.physical_name like ''F%'''
				--SET @sql = N'use ' + @Name + '; select value from dbo.Account_Settings where keyword = ''Write Web Service Trace'' and value = ''True'''