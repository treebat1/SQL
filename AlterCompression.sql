sys.sp_spaceused user_info
GO 
--

SELECT 1
from sys.partitions
where object_id = object_id('[dbo].[user_info]')
AND data_compression_desc = 'None'

ALTER INDEX [pk_user_info]
ON dbo.user_info
REBUILD WITH (DATA_COMPRESSION = ROW, ONLINE = ON)
GO



sys.sp_spaceused user_info
GO 

SELECT *
from sys.partitions
where object_id = object_id('[dbo].[user_info]')
ORDER BY index_id, partition_number


--On 12/9/2014
--Cotswold Active = 13 GB at 16:17
--Farfetch Active = 102 GB at 16:19.   63GB at 10:11.  1GB/20minutes
--LandsEnd Active = 808 GB at 16:22.   431GB at 09:51  432GB at 9:54. 438GB at 10:09. 453GB at 10:53

--On 12/11/2014
--Nike Active = 1.25 TB at 10:08.

SELECT DATEDIFF(MINUTE, '12/10/2014 10:11', '12/10/2014 16:19')

--Cotswold: 13GB/13GB = 100%
--LandsEnd: 739GB/808GB = 92%
--FarFetch: 73GB/102GB = 72%