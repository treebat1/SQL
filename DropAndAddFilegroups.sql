--drop and add filegroups

alter database staples_test
remove filegroup fg_staging

alter database staples_test
add filegroup Staging