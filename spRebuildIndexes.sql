USE [master]
GO

/****** Object:  StoredProcedure [dbo].[spRebuildIndexes]    Script Date: 4/17/2015 3:45:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO






CREATE Procedure [dbo].[spRebuildIndexes]
@DBname nvarchar(128),@Edition nvarchar(40)=' '
AS
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
SET NOCOUNT ON;

DECLARE @objectid int;
DECLARE @indexid int;
DECLARE @partitioncount int;
DECLARE @schemaname nvarchar(130); 
DECLARE @objectname nvarchar(130); 
DECLARE @indexname nvarchar(130); 
DECLARE @partitionnum int;
DECLARE @partitions int;
DECLARE @frag float;
DECLARE @command nvarchar(4000); 
DECLARE @stmt nvarchar(2000); 
DECLARE @err smallint;
DECLARE @online nchar(20);
DECLARE @count int;

SET @err=0
--If Server is Enterprise Edition, indexes can be rebuilt online.
If @Edition='E'
	SET @online=' with (online=on)';
else
	SET @online='';

-- Conditionally select tables and indexes from the sys.dm_db_index_physical_stats function 
-- and convert object and index IDs to names.

set @stmt ='Use ['+@Dbname+'] ; SET QUOTED_IDENTIFIER OFF; SET ARITHABORT OFF; 
SELECT TOP 20
    a.object_id AS objectid,QUOTENAME(object_name(a.object_id)) as objectname,
    a.index_id AS indexid,
    indexname = QUOTENAME(b.name),
	schemaname=QUOTENAME(d.name),
    partition_number AS partitionnum,
    avg_fragmentation_in_percent AS frag
FROM sys.dm_db_index_physical_stats ('+str(db_id(@Dbname)) +',Null, NULL, NULL, ''LIMITED'') AS a
JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
join sys.objects AS c on a.object_id= c.object_id
JOIN sys.schemas as d ON d.schema_id = c.schema_id
where isnull(objectproperty(a.object_id,''IsUserTable''),0) = 1 AND isnull(a.index_id,0) > 0
and avg_fragmentation_in_percent>10.0 and a.page_count  > 1000'


print @stmt
declare @cur table (
	[objectid] [int] NULL,
	[objectname] [nvarchar](258) NULL,
	[indexid] [int] NULL,
	[indexname] [nvarchar](258) NULL,
	[schemaname] [nvarchar](258) NULL,
	[partitionnum] [int] NULL,
	[frag] [float] NULL)
insert into @cur
EXEC (@stmt);
if @@error<>0
	Begin
		print 'Error while fetching fragmented indexes'
		return 1
	end

DECLARE index_cur cursor for 
Select * from @cur

OPEN index_cur

-- Declare the cursor for the list of partitions to be processed.
-- Loop through the partitions.
WHILE ( 1=1 )
    BEGIN
		FETCH NEXT
           FROM index_cur
           INTO @objectid, @objectname, @indexid,@indexname,@schemaname,@partitionnum, @frag;
        IF @@FETCH_STATUS < 0 
			BREAK;
			
		print @indexname
       	-- 30 is an arbitrary decision point at which to switch between reorganizing and rebuilding.
        IF @frag < 30.0
            SET @command = 'Use ['+@Dbname+ N'] ; SET QUOTED_IDENTIFIER ON ; ALTER INDEX ' + @indexname + N' ON ' + @schemaname + N'.' + @objectname + N' REORGANIZE ';
	    IF @frag >= 30.0
            SET @command = 'Use ['+@Dbname+ N'] ;  SET QUOTED_IDENTIFIER ON ; ALTER INDEX ' + @indexname + N' ON ' + @schemaname + N'.' + @objectname + N' REBUILD '+@online;
		PRINT (@command)
		EXEC (@command);
		if @@error<>0
			begin
				SET @Err=1
				print 'Error while '+@command
				Break;
			end
        PRINT N'Executed: ' + @command;
		delete @cur where [indexname] = @indexname and schemaname = @schemaname and objectname = @objectname
    END;
BEGIN TRY
close index_cur
deallocate index_cur
END TRY
BEGIN CATCH
END CATCH    

PRINT 'Any Error Message:'
select @Err









GO


