--My Transfer Table



use tempdb
go

create table ChristopherTransfer
(field1 varchar(max))


insert into ChristopherTransfer
(field1)
values
('SELECT org.name
	  ,cm.[serial_number]
	  ,fg.[PRODUCT_CODE]
	  ,fg.[SOFTWARE] AS ''FG''
	  ,fg.[HUMIDIFIER_SOFTWARE] AS ''HUM''
	  ,cam.[SOFTWARE] AS ''CAM''
	  ,fg.[LAST_REGISTERED_TIME]
	  ,fg.[LAST_UPDATED_DATE]
      ,cm.[active]
      ,cm.[organisation_id]
      ,cm.[currently_assigned_patient]
  FROM [US1-ECOSQL-P01].[easycare].[dbo].[communication_module] cm
  JOIN [US1-ECOSQL-P01].easycare.dbo.organisation org
  on cm.organisation_id = org.id
  JOIN [US1-ECOSQL-P03].[ngcs].[dbo].[FLOW_GEN] fg
  ON fg.SERIAL_NO = cm.serial_number
  JOIN [US1-ECOSQL-P03].[ngcs].[dbo].[COMM_MODULE] cam
  ON cam.SERIAL_NO = cm.serial_number
  WHERE org.account_number = ''59421''
  AND cm.type = 3
  AND fg.SOFTWARE IN (''SX567-0205'', ''SX567-0302'')
  AND fg.HUMIDIFIER_SOFTWARE IN (''SX556-0202'', ''SX556-0203'')
  AND cam.SOFTWARE IN (''SX558-0304'', ''SX558-0308''')


--drop table ChristopherTransfer
