declare @Name varchar(100)
create table #t (
    db				varchar(50),
    Ref_Object			varchar(255),
    Ref_Object_Name		varchar(255),
    uses_quoted_identifier	int
)

select name
into #a
from sys.databases
where database_id > 4
    and name not in ('Resonance_Administration', 'distribution')

declare db_Cursor cursor for
select name
from #a
order by 1

open db_Cursor

FETCH NEXT FROM db_Cursor 
INTO @Name

WHILE @@FETCH_STATUS = 0
BEGIN
    exec( 'use ' + @name + ';
	insert into #t
	select ''' + @name + ''' as db, Ref_Object, Ref_Object_Name, uses_quoted_identifier
	from (	SELECT  DISTINCT OBJECT_NAME(sd.referencing_id)Ref_Object,
			CASE WHEN OBJECTPROPERTYEX(sd.referencing_id,N''ISTABLE'')= 1
				     THEN''Table''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsTableFunction'')= 1
				     THEN''Function''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsTableFunction'')= 1
				     THEN''Function''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsScalarFunction'')=1
				     THEN''Function''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsTrigger'')= 1
				     THEN''Trigger''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsView'')= 1
				     THEN''View''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsUserTable'')= 1
				     THEN''Table''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsProcedure'')= 1
				     THEN''Procedure''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsIndexed'')= 1
				     THEN''Index''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsForeignKey'')= 1
				     THEN''ForeignKey''
			WHEN OBJECTPROPERTYEX(sd.referencing_id,N''IsPrimaryKey'')= 1
				     THEN''PrimaryKey''
			END AS Ref_Object_Name, sm.uses_quoted_identifier
		FROM    sys.sql_expression_dependencies SD
			INNER JOIN sys.objects obj
				     ON obj.object_id=sd.referenced_id
			left JOIN sys.sql_modules sm
				     ON sd.referencing_id=sm.object_id
		WHERE obj.is_ms_shipped = 0
		    AND referenced_id in (object_id(''Catalog_Default_Lists''), object_id(''Catalog_Similarity_Lists'')) /*Where one can Replace table Name*/
		    AND sm.uses_quoted_identifier = 0
		) as t
	WHERE t.Ref_Object not like ''Get_%''
	    and t.Ref_Object not like ''usp_Get_%''
	    and t.Ref_Object not like ''spCheck_%''
	    and t.Ref_Object not like ''usp_Check_%''
	    and t.Ref_Object not in (''Insert_Catalog_Default_List_Item'', ''Populate_Best_Sellers'', 
			''Populate_Best_Selling_Recs'', ''Populate_Browsed_Bought'', 
			''Populate_Catalog_Similarity_Lists_Browsed_Bought'', ''Populate_Catalog_Similarity_Lists_Category_Similarity_Associations'', 
			''Populate_Catalog_Similarity_Lists_Co_Purchased'', ''Populate_Catalog_Similarity_Lists_Co_Purchased_Normalized'', 
			''Populate_Catalog_Similarity_Similarity_Direct'', ''Populate_Catalog_Similarity_Similarity_Object_Vectors'', 
			''Populate_Hot_Sellers'', ''Populate_Hot_Selling_Recs'', 
			''Populate_Most_Clicked'', ''Populate_Most_Ordered'', 
			''Populate_Most_Ordered_Recs'', ''Populate_Most_Popular'', 
			''Populate_Most_Purchased'', ''Populate_Most_Units'', 
			''Populate_New_Products'', ''Populate_Top_Rated'', 
			''Set_New_Product_Promotion'', ''Update_Hot_Sellers_Promotion'')
	ORDER BY Ref_Object, Ref_Object_Name
	')

    FETCH NEXT FROM db_Cursor 
    INTO @Name
END

CLOSE db_Cursor
DEALLOCATE db_Cursor

select * from #t
order by db, Ref_Object

drop table #t
drop table #a

