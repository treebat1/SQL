/****** Script for SelectTopNRows command from SSMS  ******/
INSERT INTO dbo.Application_Modules
        (application_id, Module_ID , Last_Update)
SELECT 'Loreal06' AS [Application_ID]
      ,[Module_ID]
      ,SYSDATETIME()
  FROM [Resonance_Administration].[dbo].[Application_Modules]
  WHERE application_id = 'Loreal05'
  
  SELECT *
  FROM dbo.Application_Modules
  WHERE Application_ID = 'Loreal06'