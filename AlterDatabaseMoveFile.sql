--
sp_Helpdb 'TestMirroring'

alter database TestMirroring
modify file (name = TestMirroring, filename = 'H:\MSSQL\Data\TestMirroring.mdf')