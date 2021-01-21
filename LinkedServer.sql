EXEC master.dbo.sp_addlinkedserver
@server = N'SSAS', -- name of linked server
@srvproduct=N'', 
@provider=N'MSOLAP', -- see list of providers avaoilable on SQL Server under Linked Server > Prover node in SSMS Object Browser
@datasrc=N'reporting3', -- machine that host Analysis Services
@catalog=N'DWPeapod' -- Analysis Services database (cube)


EXEC sp_addlinkedsrvlogin
@rmtsrvname= 'SSAS',
@useself= 'false',
@locallogin = 'Resonance',
@rmtuser = 'COLO\Colo1InsightDW',
@rmtpassword = ''


select *
from openquery (ssas, 'select [Measures].[Cart Revenue] on 0 from [Target Session]')




------------------------------


--Open Rowset

select *
from OpenRowset('MSOLAP'
,'DATASOURCE=reporting3;CATALOG = DWPeapod_bsf'
,'select [Measures].[Cart Revenue] on 0 from [Target Session]')


sp_configure 'show advanced options',1
go

reconfigure
go

sp_configure
go