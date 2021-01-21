--add new file Similarity_Lists.ndf for filegroup for Similarity_Lists

ALTER DATABASE Staples
ADD FILEGROUP Similarity_Lists

ALTER DATABASE Staples
ADD FILE 
(
    NAME = Similarity_Lists,
    FILENAME = 'J:\SQLData\Staples\Similarity_Lists.ndf',
    SIZE = 100MB,
    FILEGROWTH = 600MB
)
TO FILEGROUP Similarity_Lists

EXEC sp_helpdb 'Staples'

SELECT *
FROM sys.database_files