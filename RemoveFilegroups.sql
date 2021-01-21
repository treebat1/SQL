--Remove Filegroups


SELECT fg.name [FileGroupName], df.name [FileName], df.physical_name
FROM sys.filegroups fg
inner JOIN sys.database_files df ON fg.data_space_id = df.data_space_id

SELECT *
FROM sys.filegroups

ALTER DATABASE Template
REMOVE FILEGROUP behavior_events_2012