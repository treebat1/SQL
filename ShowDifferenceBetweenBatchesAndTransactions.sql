use backupdb
go

set nocount on
go

print 'One GO Statement and No Explicit Transaction'
select getdate() Column1
into dbo.tmpChris1
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris2
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris3
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go

drop table if exists dbo.tmpChris1
drop table if exists dbo.tmpChris2
drop table if exists dbo.tmpChris3



print 'Multiple GO Statements and No Explicit Transaction'
select getdate() Column1
into dbo.tmpChris1
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris2
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris3
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

drop table if exists dbo.tmpChris1
drop table if exists dbo.tmpChris2
drop table if exists dbo.tmpChris3

print 'One GO Statement and One Explicit Transaction'
begin transaction
select getdate() Column1
into dbo.tmpChris1
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris2

select getdate() Column1
into dbo.tmpChris3
commit transaction
go

drop table if exists dbo.tmpChris1
drop table if exists dbo.tmpChris2
drop table if exists dbo.tmpChris3

print 'Multiple GO Statements and One Explicit Transaction'
begin transaction
select getdate() Column1
into dbo.tmpChris1
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris2
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))

select getdate() Column1
into dbo.tmpChris3
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
go
select 'Trancount: ' + cast(@@TRANCOUNT as char(1))
commit transaction

drop table if exists dbo.tmpChris1
drop table if exists dbo.tmpChris2
drop table if exists dbo.tmpChris3