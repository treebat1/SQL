DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(2000) --for dynamic sql
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
and d.name not in ('distribution','tempdb','model','master','msdb')
and d.name not like '%restore%' and d.name not like '%test%'
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
				set @sql = N'update msdb.dbo.sysjobsteps set command = ''/*'' + command + ''*/'' + char(13) + char(10) + ''exec ' + @Name + '.dbo.Set_Day_Increment_Account_Setting ''''' + @Name + ''''', ''''' + @Name 
				+ ''''', ''''OLAP Last Update'''', 1'' where command like ''%' + @Name 
				+ '%'' and command like ''%account_settings%''and command not like ''%exec%'' and command not like ''%replay%'''
				print @sql
				--EXEC @Return = sp_executesql @sql
		END
	set @i = @i + 1
END   

drop table #tempDBName