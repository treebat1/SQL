SET NOCOUNT ON

Declare @DBName varchar(150)
, @FileGrowth VARCHAR(100)  -- In MB
, @FileLocation NVARCHAR(4000)
, @SQL NVARCHAR(4000)
, @ParmDef NVARCHAR(1000)
, @Return INT

SET @DBName = db_name()
set @FileGrowth = '600'  

--SELECT LEFT(physical_name, LEN(physical_name) - CHARINDEX('\',REVERSE(physical_name))) + '\Alibris\Similarity_Lists.ndf'
--FROM alibris.sys.database_files 
--WHERE physical_name LIKE '%.mdf'

SET @SQL = 'SELECT @FileLocationOUT = LEFT(physical_name, LEN(physical_name) - CHARINDEX(''\'',REVERSE(physical_name)))' 
+ ' + ''\'
+ @DBName
+ '\Similarity_Lists.ndf'' FROM ' 
+ @DBName 
+ '.sys.database_files WHERE physical_name LIKE ''%.mdf'''
SET @ParmDef = '@FileLocationOUT nvarchar(1000) OUTPUT'
--print @sql
EXEC @Return = sp_executesql @sql, @ParmDef, @FileLocationOUT = @FileLocation OUTPUT

--SET @FileLocation = 'D:\SQL_Data_QA\' + @DBName + '\Similarity_Lists.ndf'

--PRINT @FileLocation

IF LEN(@FileLocation) > 0
begin 
	--Add Filegroups
	SET @SQL = 'Alter DATABASE ' + @DBName + ' ADD FILEGROUP Similarity_Lists'
	--print @sql
	EXEC @Return = sp_executesql @sql


	--Add Files
	SET @SQL = 'Alter DATABASE ' 
	+ @DBName
	+ ' ADD FILE (NAME = N''Similarity_Lists'', FILENAME = ''' 
	+ @FileLocation + ''', SIZE = 100MB, MAXSIZE = UNLIMITED, FILEGROWTH = ' 
	+ @FileGrowth + 'MB) to FILEGROUP Similarity_Lists'
	--print @sql
	EXEC @Return = sp_executesql @sql


	EXEC sp_helpdb @DBName
	
	PRINT 'Files Created.'
end
ELSE
	PRINT 'Error'


-------------------------
--ALTER DATABASE DicksSportingGoods
--REMOVE file Similarity_Lists
	