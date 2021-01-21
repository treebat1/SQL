declare @text as varchar(100)

create table #temp
(first varchar(100))

set nocount on

insert into #temp
(first)
select o.*
from
OpenRowset('MSOLAP','DATASOURCE=COLO1-ANALYSIS1; USER ID=; PASSWORD=;Initial Catalog=AdidasDataMart;',
'select [Measures].[Pages] on 0
from  [Interactive Session]') as o

select @text = first
from #temp

print @text

drop table #temp