SELECT *
FROM sys.database_files

select df.name [DatabaseFileName], df.physical_name, f.name [FileGroupName]
from sys.database_files df
join sys.filegroups f on df.data_space_id = f.data_space_id
order by df.name, f.name


--filegroups missing files.
select f.name, df.name
from sys.filegroups f 
left join sys.database_files df on df.data_space_id = f.data_space_id
where df.data_space_id is null
order by f.name, df.name


select sum(CONVERT(DECIMAL(12,2),ROUND(size/128.000,2))) as TotalDataFileSizeInMB
from sys.master_files
where type_desc = 'rows'

select *
from sys.master_files
