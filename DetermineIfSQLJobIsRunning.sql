use msdb
go

create table #temp
(column1 varchar(200)
, column2 varchar(200)
,  column3 varchar(200)
,  column4 varchar(200)
,  column5 varchar(200)
,  column6 varchar(200)
,  column7 varchar(200)
,  column8 varchar(200)
,  column9 varchar(200)
,  column10 varchar(200)
,  column11 varchar(200)
,  column12 varchar(200)
,  column13 varchar(200)
,  column14 varchar(200)
,  column15 varchar(200)
,  column16 varchar(200)
,  column17 varchar(200)
)

insert into #temp
exec sp_help_jobactivity

select *
from #temp
where column7 is not null
and column10 is null

drop table #temp
go


xp_cmdshell 'net stop SQLSERVERAGENT'
--SQLAgent$I1

xp_cmdshell 'net start SQLSERVERAGENT'
--SQLAgent$I1