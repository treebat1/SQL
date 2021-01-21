/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Account_ID]
  FROM [Resonance_Administration].[dbo].[Accounts]

DECLARE @account_id VARCHAR(5000)

SELECT @account_id = CASE WHEN @account_id IS NULL THEN account_id ELSE @account_id + ', ' + Account_id end
FROM dbo.Accounts

SELECT @account_id, Connection_String
FROM dbo.Account_Connections



