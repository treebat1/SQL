select TOP 1 * 
from sys.dm_os_ring_buffers
WHERE ring_buffer_type='RING_BUFFER_RESOURCE_MONITOR'