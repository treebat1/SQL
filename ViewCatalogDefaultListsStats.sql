select count(1)
from dbo.Catalog_Default_Lists cdl
join dbo.Items i on cdl.Item_ID = i.Item_ID
where i.disabled = 0
and cdl.list_name = 'Most Purchased'
and cdl.Catalog_ID = 'reebokcpl'
--0

select cdl.Catalog_ID, cast(i.Date_Introduced as date) WhichDay, count(1) As TotalPerDay
from dbo.Catalog_Default_Lists cdl
join dbo.Items i on cdl.Item_ID = i.Item_ID
where i.disabled = 0
and cdl.list_name = 'Most Purchased'
and cdl.Catalog_ID = 'reebokcpl'
group by cdl.Catalog_ID, cast(i.Date_Introduced as date)
order by cdl.Catalog_ID, cast(i.Date_Introduced as date) desc
--0