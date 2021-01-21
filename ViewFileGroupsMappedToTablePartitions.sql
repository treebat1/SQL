DECLARE @FGName sysname = 'Catalog_Similarity_Lists';

SELECT p.partition_number, p.rows, OBJECT_NAME(p.object_id) [TableName], au.type_desc, fg.name [FileGroupName]
FROM sys.partitions p 
INNER JOIN sys.allocation_units au ON au.container_id = p.hobt_id 
INNER JOIN sys.filegroups fg ON fg.data_space_id = au.data_space_id 
WHERE fg.name = @FGName
order by p.partition_number
--Catalog_similarity_lists:
/*
Table Name
Catalog_Similarity_Lists
*/


--Similarity_Lists:
/*
TableName
Similarity_Lists_Numerator
Cooccurrence_Model_Event_Sets
Cooccurrence_Modeling_Numerator
Cooccurrence_Modeling_Denominator
Cooccurrence_Modeling_Logs
Cooccurrence_Modeling_Logs
Cooccurrence_Models
Cooccurrence_Models
Cooccurrence_Models_History
Cooccurrence_Modeling_Session_End_State
Cooccurrence_Modeling_Session_End_State
Cooccurrence_Models_History
*/



