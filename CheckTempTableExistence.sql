if OBJECT_ID('tempdb.dbo.#tempDBName') is null
BEGIN
create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))
end