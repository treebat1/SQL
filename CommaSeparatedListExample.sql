declare @t table(id int, name varchar(20),somecolumn varchar(10))
insert into @t
    select 1,'ABC','X' 
	union all
    select 1,'ABC','Y' 
	union all
    select 1,'ABC','Z' 
	union all
    select 2,'MNO','R' 
	union all
    select 2,'MNO','S'

--select ID,Name,
--    stuff((select ',' + CAST(t2.SomeColumn as varchar(10))
--     from @t t2 
--	 where t1.id = t2.id 
--	 and t1.name = t2.name
--     for xml path('')),1,1,'') SomeColumn
--from @t t1
--group by id,Name


SELECT *
FROM @t


select ',' + CAST(t2.SomeColumn as varchar(10))
     from @t t2
     for xml path('')