declare @CSVList as varchar(2000)

set @CSVList = ''

select @CSVList = @CSVList + ', ' + name
from sys.databases
where --name like '[A-Z]%'
name not in ('msdb','model','master','sysadmin','tempdb')
order by name

print @CSVList


