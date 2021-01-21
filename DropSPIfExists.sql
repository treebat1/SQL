if exists (select 1 from sys.procedures where name = 'CreateVariableParameterMapping_project')
drop procedure dbo.CreateVariableParameterMapping_project

if exists (select 1 from sys.procedures where name = 'CreateVariableParameterMapping')
drop procedure dbo.CreateVariableParameterMapping

if exists (select 1 from sys.procedures where name = 'CreateEnvironmentFromParameters_project')
drop procedure dbo.CreateEnvironmentFromParameters_project

if exists (select 1 from sys.procedures where name = 'CreateEnvironmentFromParameters')
drop procedure dbo.CreateEnvironmentFromParameters

if exists (select 1 from sys.procedures where name = 'CreateEnvironmentFromConfiguration')
drop procedure dbo.CreateEnvironmentFromConfiguration

if exists (select 1 from sys.procedures where name = 'SSIS_Execute')
drop procedure dbo.SSIS_Execute


select * 
from sys.procedures 
where name = 'CreateVariableParameterMapping_project'

--SQL2016 or higher only.
--DROP PROCEDURE IF EXISTS [dbo].[CreateVariableParameterMapping_project]


