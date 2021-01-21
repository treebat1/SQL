SET NOCOUNT ON

Declare @DBName varchar(150)
, @FileGrowth VARCHAR(100)
, @Files NVARCHAR(4000)

DECLARE @filelist TABLE (LogicalName NVARCHAR(128) NOT NULL, PhysicalName NVARCHAR(260) NOT NULL)

SET @DBName = 'DicksSportingGoods'
set @FileGrowth = '30'

--Get last full backup:
SELECT @Files=Coalesce(@Files + CHAR(13), '') + 'alter database '+@DBName+' modify file (name = '''+name+''', filegrowth = '+@FileGrowth+' MB)'
FROM DicksSportingGoods.sys.database_files 
WHERE type = 0 AND growth > 30

PRINT @Files
