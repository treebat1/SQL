
create table #table
(DBName varchar(100)
, EarliestTimeStamp datetime
, LatestTimeStamp datetime
)

exec sp_MSforeachdb
N'

	USE ?
	IF ''?'' not in (''master'',''distribution'',''tempdb'',''model'',''msdb'')  --system
	BEGIN
		insert into #table
		(DBName, EarliestTimeStamp, LatestTimeStamp)
		select
			''?''
			, min(TimeStamp)
			, max(TimeStamp)
		from dbo.Web_Service_Trace with (nolock)

END'
, N'?'

select DBName, EarliestTimeStamp, LatestTimeStamp
from #table
where LatestTimeStamp is null
order by DBName

drop table #table




--use CafePress
--select MAX(timestamp) from dbo.Web_Service_Trace
--truncate table dbo.Web_Service_Trace

