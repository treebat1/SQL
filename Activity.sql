------------------------------
/* Check for quietness.  Want to make sure queue active traffic goes away. */
create table #temp
(column1 varchar(100)
, column2 varchar(100)
,  column3 varchar(100)
,  column4 varchar(100)
,  column5 varchar(100)
,  column6 varchar(100)
,  column7 varchar(100)
,  column8 varchar(100)
,  column9 varchar(100)
,  column10 varchar(100)
,  column11 varchar(100)
,  column12 varchar(100)
,  column13 varchar(100)
)

insert into #temp
exec sp_who2 active

select *
from #temp
--where column6 = 'Staples'
order by column6

drop table #temp


--select *
--from application_settings