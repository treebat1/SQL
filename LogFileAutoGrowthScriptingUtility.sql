SET NOCOUNT ON

Declare @DBName varchar(150)
, @FileGrowth VARCHAR(100)
, @Files NVARCHAR(4000)

DECLARE @filelist TABLE (LogicalName NVARCHAR(128) NOT NULL, PhysicalName NVARCHAR(260) NOT NULL)

SET @DBName = 'RedCatsUSA'
set @FileGrowth = '650'

SELECT @Files=Coalesce(@Files + CHAR(13), '') + 'alter database '+@DBName+' modify file (name = '''+name+''', filegrowth = '+@FileGrowth+' MB)'
FROM RedCatsUSA.sys.database_files 
WHERE type = 0 AND growth > 30

PRINT @Files
