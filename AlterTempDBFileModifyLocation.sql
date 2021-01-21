sp_helpdb tempdb

alter database tempdb modify file (name = templog, FILENAME = 'H:\TempLogs\I2\templog.ldf')

alter database tempdb modify file (name = tempdev, FILENAME = 'F:\TempData\I1\Tempdev.mdf')

declare @i as int
declare @sql as nvarchar(2000)

set @i = 1

while @i <= 31
BEGIN
	set @sql = N'alter database tempdb modify file (name = tempdev' 
					+ cast(@i as nvarchar(3)) + ', FILENAME = ''G:\TempData\tempdev'+ cast(@i as nvarchar(3)) +  '.ndf'')'
	print @sql
	
	set @i = @i + 1
end

alter database tempdb modify file (name = tempdev, FILENAME = 'G:\TempData\tempdev.mdf')

alter database tempdb modify file (name = tempdev1, FILENAME = 'G:\TempData\tempdev1.ndf')
alter database tempdb modify file (name = tempdev2, FILENAME = 'G:\TempData\tempdev2.ndf')
alter database tempdb modify file (name = tempdev3, FILENAME = 'G:\TempData\tempdev3.ndf')
alter database tempdb modify file (name = tempdev4, FILENAME = 'G:\TempData\tempdev4.ndf')
alter database tempdb modify file (name = tempdev5, FILENAME = 'G:\TempData\tempdev5.ndf')
alter database tempdb modify file (name = tempdev6, FILENAME = 'G:\TempData\tempdev6.ndf')
alter database tempdb modify file (name = tempdev7, FILENAME = 'G:\TempData\tempdev7.ndf')
alter database tempdb modify file (name = tempdev8, FILENAME = 'G:\TempData\tempdev8.ndf')
alter database tempdb modify file (name = tempdev9, FILENAME = 'G:\TempData\tempdev9.ndf')
alter database tempdb modify file (name = tempdev10, FILENAME = 'G:\TempData\tempdev10.ndf')
alter database tempdb modify file (name = tempdev11, FILENAME = 'G:\TempData\tempdev11.ndf')
alter database tempdb modify file (name = tempdev12, FILENAME = 'G:\TempData\tempdev12.ndf')
alter database tempdb modify file (name = tempdev13, FILENAME = 'G:\TempData\tempdev13.ndf')
alter database tempdb modify file (name = tempdev14, FILENAME = 'G:\TempData\tempdev14.ndf')
alter database tempdb modify file (name = tempdev15, FILENAME = 'G:\TempData\tempdev15.ndf')
alter database tempdb modify file (name = tempdev16, FILENAME = 'G:\TempData\tempdev16.ndf')
alter database tempdb modify file (name = tempdev17, FILENAME = 'G:\TempData\tempdev17.ndf')
alter database tempdb modify file (name = tempdev18, FILENAME = 'G:\TempData\tempdev18.ndf')
alter database tempdb modify file (name = tempdev19, FILENAME = 'G:\TempData\tempdev19.ndf')
alter database tempdb modify file (name = tempdev20, FILENAME = 'G:\TempData\tempdev20.ndf')
alter database tempdb modify file (name = tempdev21, FILENAME = 'G:\TempData\tempdev21.ndf')
alter database tempdb modify file (name = tempdev22, FILENAME = 'G:\TempData\tempdev22.ndf')
alter database tempdb modify file (name = tempdev23, FILENAME = 'G:\TempData\tempdev23.ndf')
alter database tempdb modify file (name = tempdev24, FILENAME = 'G:\TempData\tempdev24.ndf')
alter database tempdb modify file (name = tempdev25, FILENAME = 'G:\TempData\tempdev25.ndf')
alter database tempdb modify file (name = tempdev26, FILENAME = 'G:\TempData\tempdev26.ndf')
alter database tempdb modify file (name = tempdev27, FILENAME = 'G:\TempData\tempdev27.ndf')
alter database tempdb modify file (name = tempdev28, FILENAME = 'G:\TempData\tempdev28.ndf')
alter database tempdb modify file (name = tempdev29, FILENAME = 'G:\TempData\tempdev29.ndf')
alter database tempdb modify file (name = tempdev30, FILENAME = 'G:\TempData\tempdev30.ndf')
alter database tempdb modify file (name = tempdev31, FILENAME = 'G:\TempData\tempdev31.ndf')






