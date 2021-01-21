SELECT session_id, 
    SUM(internal_objects_alloc_page_count) AS task_internal_objects_alloc_page_count,
    SUM(internal_objects_dealloc_page_count) AS task_internal_objects_dealloc_page_count 
FROM sys.dm_db_task_space_usage 
GROUP BY session_id
ORDER BY SUM(internal_objects_alloc_page_count) desc


/*
CREATE VIEW all_task_usage
AS 
    SELECT session_id, 
      SUM(internal_objects_alloc_page_count) AS task_internal_objects_alloc_page_count,
      SUM(internal_objects_dealloc_page_count) AS task_internal_objects_dealloc_page_count 
    FROM sys.dm_db_task_space_usage 
    GROUP BY session_id;
GO
*/