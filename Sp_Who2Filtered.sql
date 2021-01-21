--sp_who2 filtered
USE master
go

create table #temp
(SPID varchar(1000)
, [Status] varchar(1000)
,  [Login] varchar(1000)
,  [HostName] varchar(1000)
,  [BlkBy] varchar(1000)
,  [DBName] varchar(1000)
,  [Command] varchar(1000)
,  CPUTime BIGINT
,  DiskIO BIGINT
,  LastBatch varchar(1000)
,  ProgramName varchar(1000)
,  [SPID2] varchar(1000)
,  RequestID varchar(1000)
)

insert into #temp
exec sp_who2 active

select *
from #temp
--where column4 in ('CHDC-CAR-THSQL1')
--where column3 like '%rx95913%'
--order by column10 desc
order by 3

drop table #temp

--kill 80