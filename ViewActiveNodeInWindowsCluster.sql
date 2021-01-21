With ClusterActiveNode as 
(
SELECT SERVERPROPERTY('ComputerNamePhysicalNetBIOS') as NodeName, Cast('Active' as varchar(10)) as Active
),
ClusterNodes as 
(
SELECT NodeName FROM sys.dm_os_cluster_nodes
)

Select b.nodename, isnull(active,'Passive') as NodeStatus from ClusterNodes as b left join ClusterActiveNode as a
on a.NodeName = b.nodename