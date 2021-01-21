DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(1000) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

CREATE TABLE #tempResults
(DBName VARCHAR(100)
, TotalRows BIGINT
, TotalMinutes BIGINT
, TotalSize BIGINT
, Label varchar(100))

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','master','msdb','Resonance_Administration','Resonance_Log'
,'Resonance_Configuration','Resonance_Geographic','Template','ASP_NET_Session_State','Monitor','LiteSpeedLocal')
AND d.name NOT LIKE '%temp'
--AND d.name LIKE '[A-M]%'
and mf.state = 0  -- only online
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	--print @name
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
	BEGIN							
		SET @sql = N'use ' + @Name + ';
					insert into #tempResults
					(DBName, Label)
					select ''' + @Name + ''', name
					from sys.database_principals 
					where type_desc = ''DATABASE_ROLE''
					and is_fixed_role = 0'
		--print @sql
		EXEC @Return = sp_executesql @sql
	END
	set @i = @i + 1
END  


SELECT DBName, Label
FROM #tempResults
order by 2,1

--SELECT SUM(totalsize) AS TotalFileSizeMB
--FROM #tempResults

drop table #tempDBName

DROP TABLE #tempResults

--SELECT db_name()

/*
SET @sql = N'use ' + @Name + ';
			insert into #tempResults
			(DBName, Label)
			select ''' + @Name + ''', name
			from sys.database_principals 
			where type_desc = ''DATABASE_ROLE''
			and is_fixed_role = 0'
*/


/*
SET @sql = N'use ' + @Name + '; insert into #tempResults
								(DBName, Label, TotalRows)
								SELECT ''' + @Name + ''', Name, COUNT(1)
								FROM [dbo].[Methods]
								GROUP BY name
								HAVING COUNT(1) > 1
								ORDER BY name'
*/

/*
SET @sql = N'use ' + @Name + '; insert into #tempResults
								(DBName, TotalRows)
								SELECT ''' + @Name + ''', COUNT(1)
								FROM sys.triggers T
								JOIN sys.tables ta on t.parent_id = ta.object_id
								WHERE t.parent_class = 1
								AND ta.name LIKE ''%account_settings%''
								AND T.is_disabled = 1'
*/

/*
				SET @sql = N'use ' + @Name + '; insert into #tempResults
												(DBName, TotalRows)
												SELECT ''' + @Name + ''', COUNT(1)
												FROM dbo.Remarketing_Abandonment_Candidates RAC'
*/

/*
				SET @sql = N'use ' + @Name + '; insert into #tempResults
												(DBName, TotalRows)
												SELECT Account_ID, [Value]
												FROM dbo.Account_Settings
												WHERE keyword = ''Reporting Hours Offset'''
*/
/*
SELECT Account_ID, [Value]
FROM dbo.Account_Settings
WHERE keyword = 'Reporting Hours Offset'
*/


/*
select count(1)
from dbo.Subject_Interactive_Session_Recommendation
*/


/*
select data_type
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'OLAP_Recommendation_List'
and column_name = 'Item_ID'
*/


--RedCatsUSA, SpencerGifts

/*
select data_type
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'Recommendation_List'
and column_name = 'Item_ID'
*/



--PRINT @name
--SET @sql = N'use ' + @Name + '; insert into #tempResults
--								(DBName, TotalRows, TotalMinutes)
--								SELECT ''' + @Name + ''', count(1) TotalRows, count(1)/3000000 TotalMinutes
--									FROM dbo.Subject_Lookup with (nolock)


--got up thru Altrec

--select * from sys.partition_functions where name = 'pfn_Recommendation_List_Hash'

--pfn_Recommendation_List_Hash




--SELECT prv.*
--FROM sys.partition_range_values prv
--JOIN sys.partition_functions pf ON prv.function_id = pf.function_id
--where pf.name = 'pfn_Recommendation_List_Hash'
--AND prv.value = 201440


--SELECT DB_NAME()