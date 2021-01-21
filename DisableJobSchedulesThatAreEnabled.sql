

DECLARE @ScheduleID VARCHAR(100) -- schedule_id
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(200) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempScheduleID
(idid int not null identity(1,1)
, ScheduleID varchar(100))

insert into #tempScheduleID
(ScheduleID)
SELECT schedule_id
FROM msdb.dbo.sysschedules
WHERE enabled = 0



select @maxIdid = MAX(idid) from #tempScheduleID

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @ScheduleID = ScheduleID from #tempScheduleID where idid = @i
	--print @ScheduleID
		set @sql = N'sp_update_schedule @schedule_id =  ' + @ScheduleID + ', @enabled = 0'
		print @sql
		--EXEC @Return = sp_executesql @sql
	set @i = @i + 1
END   

drop table #tempScheduleID




SELECT *
FROM msdb.dbo.sysschedules
WHERE enabled = 0

--sp_update_schedule @schedule_id = 1, @enabled = 0

