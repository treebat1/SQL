--Return CSV in only line


DECLARE @name VARCHAR(MAX) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop

SET NOCOUNT on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','msdb','master','Resonance_Administration')
and mf.state = 0  -- only online
--AND d.name LIKE '%test'
and d.name like '[S-Z]%'
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = coalesce(@name + ',', '') + DBName 
	from #tempDBName 
	where idid = @i
	set @i = @i + 1
END   

print @name

drop table #tempDBName

SET NOCOUNT off





----------------------------------------------------------

--Return Vertical List


DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop

SET NOCOUNT on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','msdb','master','Resonance_Administration')
and mf.state = 0  -- only online
--AND d.name LIKE '%test'
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	print @name
	set @i = @i + 1
END   

drop table #tempDBName

SET NOCOUNT off


------------------------



--Return CSV with x per line
DECLARE @name VARCHAR(MAX) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
SET NOCOUNT on
create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))
insert into #tempDBName
(DBName)
SELECT distinct(d.name)
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','msdb','master','Resonance_Administration')
and mf.state = 0  -- only online
--AND d.name LIKE '%test'
--and d.name like '[T-Z]%'
order by d.name
select @maxIdid = MAX(idid) from #tempDBName
set @i = 1
WHILE @i <= @maxIdid   
BEGIN   
	select @name = coalesce(@name + ',', '') + DBName 
	from #tempDBName 
	where idid = @i;

	if @i % 10 = 0 
		set @name = @name + char(10) + char(13);

	set @i = @i + 1;
END   
print @name
drop table #tempDBName
SET NOCOUNT off