--print out all dates starting with current year.  t-sql

with x (dy, yr)
 as (
select dy, year (dy) yr
from (
     select getdate () - datepart (dy, getdate ()) + 1 dy
     -- the first date of the current year
     ) tmp1
union all
select dateadd (dd, 1, dy), yr
from x
--where year (dateadd (dd, 1, dy)) = yr
 )
select '''' + cast(cast(cast(floor(cast(x.dy as float)) as datetime) as date) as varchar(10)) + ''','
from x
option (maxrecursion 10000)    




--print out all dates starting with a specific date.  t-sql

with x (dy, yr)
 as (
select dy, year (dy) yr
from (
     select cast('2010-07-01' as datetime) dy
     -- the first date of the current year
     ) tmp1
union all
select dateadd (dd, 1, dy), yr
from x
--where year (dateadd (dd, 1, dy)) = yr
 )
select '''' + cast(cast(cast(floor(cast(x.dy as float)) as datetime) as date) as varchar(10)) + ''','
from x
option (maxrecursion 152)    


select #t