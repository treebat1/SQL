SET NOCOUNT ON

Declare @DBName varchar(150)
, @FileGrowth VARCHAR(100)  -- In MB
, @FileLocation NVARCHAR(4000)
, @SQL NVARCHAR(4000)
, @ParmDef NVARCHAR(1000)
, @Return INT

SET @DBName = db_name()
set @FileGrowth = '1000'  

--SELECT LEFT(physical_name, LEN(physical_name) - CHARINDEX('\',REVERSE(physical_name))) + '\Recommendation_List.ndf'
--FROM DollarGeneral.sys.database_files 
--WHERE physical_name like '%Web_Service_Trace.ndf'

SET @SQL = 'SELECT @FileLocationOUT = LEFT(physical_name, LEN(physical_name) - CHARINDEX(''\'',REVERSE(physical_name)))' 
+ ' + ''\'
+ 'Recommendation_List.ndf'' FROM ' 
+ @DBName 
+ '.sys.database_files WHERE physical_name LIKE ''%Web_Service_Trace.ndf'''
SET @ParmDef = '@FileLocationOUT nvarchar(1000) OUTPUT'
--print @sql
EXEC @Return = sp_executesql @sql, @ParmDef, @FileLocationOUT = @FileLocation OUTPUT

--SET @FileLocation = 'D:\SQL_Data_QA\' + @DBName + '\Web_Service_Trace.ndf'

--PRINT @FileLocation

IF LEN(@FileLocation) > 0
begin 
	--Add Filegroups
	--SET @SQL = 'Alter DATABASE ' + @DBName + ' ADD FILEGROUP Recommendation_List'
	--print @sql
	--EXEC @Return = sp_executesql @sql

	--Add Files
	SET @SQL = 'Alter DATABASE ' 
	+ @DBName
	+ ' ADD FILE (NAME = N''Recommendation_List'', FILENAME = ''' 
	+ @FileLocation + ''', SIZE = 205MB, MAXSIZE = UNLIMITED, FILEGROWTH = ' 
	+ @FileGrowth + 'MB) to FILEGROUP [Recommendation_List]'
	--print @sql
	BEGIN TRY
		EXEC @Return = sp_executesql @sql
		PRINT 'File Added'
	END TRY
	BEGIN CATCH
		PRINT 'Error: File add'  
	END CATCH
end
ELSE
	PRINT 'Error: Can not determine location'

EXEC sp_helpdb @DBName


-------------------------
--ALTER DATABASE DicksSportingGoods
--REMOVE file Similarity_Lists
	