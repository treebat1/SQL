DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(200) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','master','msdb','Resonance_Administration','Resonance_Log','Resonance_Configuration','Resonance_Geographic')
--AND d.name IN ('gamestop','forever21')
and mf.state = 0  -- only online
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	--print @name
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
		BEGIN	
				--set @sql = N'use ' + @Name + '; update dbo.application_settings set value = ''true'' where keyword = ''recommendation.profile.enable'' and Value = ''false'''
				set @sql = N'use ' + @Name + '; select * from  dbo.application_settings where keyword = ''recommendation.profile.enable'' and Value = ''false'''
				print @sql
				EXEC @Return = sp_executesql @sql
		END
	set @i = @i + 1
END   

drop table #tempDBName




--SELECT *
--FROM dbo.Application_Settings
--WHERE Keyword = 'recommendation.profile.enable'

--update dbo.application_settings 
--set value = 'false' 
--where keyword = 'recommendation.profile.enable' and Value = 'true'