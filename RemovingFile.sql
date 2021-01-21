
use staples_test
go

DBCC SHRINKFILE('Staples_Test_Staging', EMPTYFILE)

alter database Template
remove file Behavior_Events_2012

--

alter database staples_test
add file (NAME = N'Staples_Test_Staging', FILENAME = N'E:\SQLData\Staples_Test\Staples_Test_Staging.NDF' , SIZE = 1000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 50000KB ) to filegroup staging