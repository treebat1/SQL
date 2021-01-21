create PROCEDURE [dbo].[Utils_DeleteAllIndexesOnTable] 
-- Add the parameters for the stored procedure here
@TableName VarChar(100)
AS
BEGIN
Declare @IndexName varchar(100)


DECLARE index_cursor CURSOR FOR
SELECT name FROM sysindexes where id = object_id(@TableName)
AND NAME IS NOT NULL

OPEN index_cursor

-- Perform the first fetch.
FETCH NEXT FROM index_cursor into @IndexName

WHILE @@FETCH_STATUS = 0
BEGIN

if left(@IndexName,2) = 'PK'
BEGIN
print 'drop constraint ' + @IndexName + ' on ' + @TableName
Exec( 'ALTER TABLE ' + @TableName +
'DROP CONSTRAINT ' + @IndexName )

END
ELSE
BEGIN
-- This is executed as long as the previous fetch succeeds.
print 'drop index ' + @IndexName + ' on ' + @TableName


Exec('drop index ' + @IndexName + ' on ' + @TableName)
END

FETCH NEXT FROM index_cursor into @IndexName

END

CLOSE index_cursor
DEALLOCATE index_cursor
END


'-----------------------------------------------------------------------------'

DECLARE @RC int
DECLARE @TableName varchar(100)

set @RC = 0
set @TableName = 'dbo.Subject_Target_Session_Load'

EXECUTE @RC = [Staples_Test].[dbo].[Utils_DeleteAllIndexesOnTable] 
   @TableName
GO
