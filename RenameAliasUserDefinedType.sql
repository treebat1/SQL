-- Create an alias type.  Function example
USE DBA;
GO
IF EXISTS (SELECT 'mytype' FROM sys.types WHERE name = 'mytype')
DROP TYPE mytype;
GO

CREATE TYPE mytype FROM nvarchar(5);
GO

IF OBJECT_ID ('dbo.to_upper', 'FN') IS NOT NULL
DROP FUNCTION dbo.to_upper;
GO

CREATE FUNCTION dbo.to_upper (@a mytype)
RETURNS mytype
WITH ENCRYPTION
AS
BEGIN
RETURN upper(@a)
END;
GO

SELECT dbo.to_upper('abcde');
GO

-- Increase the length of the alias type.
sp_rename 'mytype', 'myoldtype', 'userdatatype';
GO

CREATE TYPE mytype FROM nvarchar(10);
GO

-- The function parameter still uses the old type.
SELECT name, type_name(user_type_id) 
FROM sys.parameters 
WHERE object_id = OBJECT_ID('dbo.to_upper');
GO

SELECT dbo.to_upper('abcdefgh'); -- Fails because of truncation
GO

-- Refresh the function to bind to the renamed type.
EXEC sys.sp_refreshsqlmodule 'dbo.to_upper';

-- The function parameters are now bound to the correct type and the statement works correctly.
SELECT name, type_name(user_type_id) FROM sys.parameters
WHERE object_id = OBJECT_ID('dbo.to_upper');
GO

SELECT dbo.to_upper('abcdefgh');
GO

-------------------------------------------------------------------------------------------


-- Create an alias type.  Stored Procedure example
USE DBA;
GO
IF EXISTS (SELECT 'mysecondtype' FROM sys.types WHERE name = 'mysecondtype')
DROP TYPE mysecondtype;
GO

CREATE TYPE mysecondtype FROM nvarchar(5);
GO

IF OBJECT_ID ('dbo.ToUpper', 'P') IS NOT NULL
DROP PROCEDURE dbo.ToUpper;
GO

CREATE PROCEDURE dbo.ToUpper (@a mysecondtype)
AS
select upper(@a)
GO

exec dbo.ToUpper 'abcde';
GO

-- Increase the length of the alias type.
sp_rename 'mysecondtype', 'myoldsecondtype', 'userdatatype';
GO

CREATE TYPE mysecondtype FROM nvarchar(10);
GO

-- The function parameter still uses the old type.
SELECT name, type_name(user_type_id) 
FROM sys.parameters 
WHERE object_id = OBJECT_ID('dbo.ToUpper');
GO

exec dbo.ToUpper 'abcdefgh'; -- Fails because of truncation
GO

-- Refresh the function to bind to the renamed type.
EXEC sys.sp_refreshsqlmodule 'dbo.ToUpper';

-- The function parameters are now bound to the correct type and the statement works correctly.
SELECT name, type_name(user_type_id) FROM sys.parameters
WHERE object_id = OBJECT_ID('dbo.ToUpper');
GO

exec dbo.ToUpper 'abcdefgh';
GO
