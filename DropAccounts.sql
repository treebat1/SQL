DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop


create table #tempAccountID
(idid int not null identity(1,1)
, Account_ID varchar(100))

insert into #tempAccountID
(Account_ID)
SELECT a.Account_ID
FROM Accounts a
where a.Account_ID like 'TrueReligion'
order by a.Account_ID


select @maxIdid = MAX(idid) from #tempAccountID

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = Account_ID from #tempAccountID where idid = @i
	print @name

--xx
	delete dbo.Account_Connections
	where Account_ID = @Name

	delete dbo.Account_Documents
	where Account_ID = @Name
	
--x
	delete dbo.Account_Users
	where Account_ID = @Name

--x
	delete dbo.Application_Users
	from dbo.Application_Users
	inner join dbo.applications as A on Application_Users.Application_ID = A.Application_ID
	where A.Account_ID = @Name

--xx
	delete dbo.Application_Modules
	from dbo.Application_Modules
	inner join dbo.applications as A on Application_Modules.Application_ID = A.Application_ID
	where A.Account_ID = @Name

--xx
	delete dbo.applications
	where Account_ID = @Name

--xx
	delete dbo.Accounts
	where Account_ID = @Name
				
	set @i = @i + 1
END   

drop table #tempAccountID
