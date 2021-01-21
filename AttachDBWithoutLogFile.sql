
USE [master]
GO
CREATE DATABASE [ProductsDB] ON 
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQL2008\MSSQL\DATA\ProductsDB.mdf' )
FOR ATTACH
GO

/*
Once the above T-SQL code has executed successfully you will get the below message which informs you that SQL Server has created a new transaction log file for the database.

File activation failure. The physical file name "C:\Program Files\Microsoft SQL Server\MSSQL10.SQL2008\MSSQL\DATA\ProductsDB_log.ldf" may be incorrect.

New log file 'C:\Program Files\Microsoft SQL Server\MSSQL10.SQL2008\MSSQL\DATA\ProductsDB_log.LDF' was created.
Verify Logical and Physical Integrity of Database

DBAs can check the logical and physical integrity of all the objects within the database by executing a DBCC CHECKDB.  In our case we are using the "ProductsDB" database.

*/