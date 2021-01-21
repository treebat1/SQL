SET NOCOUNT ON 

CREATE TABLE #VLFs ( 
	DBName varchar(100) null,
    FileId  INT NOT NULL, 
    FileSize BIGINT NOT NULL, 
    StartOffset BIGINT NOT NULL, 
    SeqNo INT NOT NULL, 
    Status INT NOT NULL, 
    Parity INT NOT NULL, 
    CreateLSN DECIMAL (25,0)) 



exec sp_MSforeachdb 
N'USE ? 
IF ''?'' not in (''master'',''distribution'',''model'',''msdb'')
BEGIN
	BEGIN TRY
	
		INSERT #VLFs 
		(FileID, FileSize, StartOffset, SeqNo, Status, Parity, CreateLSN)
		EXEC (''DBCC LOGINFO (?) WITH NO_INFOMSGS'') 
		
		update #VLFs
		set DBName = ''?''
		where DBName is null
		

	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS [Number], ERROR_STATE() AS [State], ERROR_PROCEDURE() AS [Procedure], ERROR_MESSAGE() AS [Message]
	END CATCH
END'
, N'?'


SELECT DBName, FileId , COUNT(1) AS VLF_Count 
FROM #VLFs 
GROUP BY DBName, FileId 
order by COUNT(1) desc


DROP TABLE #VLFs 

----------------------------------------------------


--IF ''?'' not in (''master'',''distribution'',''tempdb'',''model'',''msdb'')