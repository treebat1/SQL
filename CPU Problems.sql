select *
from sys.dm_os_schedulers 
--WHERE status='VISIBLE ONLINE'
--WHERE status='VISIBLE OFFLINE'
where status like 'visible%'
order by parent_node_id, cpu_id

SELECT *
FROM sys.dm_os_nodes


/*
PROD - Before

Online Nodes
20

Offline Nodes
44

Total Nodes
64

31%
*/


/*
PROD - After

Online Nodes
40

Offline Nodes
24

Total Nodes
64

63%
*/



/*
TEST

ONLINE NODES
40

OFFLINE NODES
24

*/


/*
DEV

ONLINE NODES
40

OFFLINE NODES
24
*/