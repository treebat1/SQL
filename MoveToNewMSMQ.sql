
--Move to New Queue
--
-------------------------------------
go

SELECT *
FROM dbo.applications

select *
from dbo.application_settings
where keyword = 'Recorder.Message.Queue.Path'
order by application_id

select *
from dbo.application_settings
where keyword like '%Queue%'
order by application_id


--New queue traffic to msmq
--  


update dbo.application_settings
set Value = 'FormatName:DIRECT=OS:colo1-vm-msmq30\private$\queue3'
where Keyword = 'Recorder.Message.Queue.Path'
--AND application_id = ''


--update dbo.application_settings
--set Value = 'FormatName:DIRECT=OS:colo1-vm-msmq32\private$\queue1'
--where Keyword = 'Recorder.Message.Queue.Path'

select *
from dbo.application_settings_history
ORDER BY last_update desc

--47,48,49



INSERT INTO dbo.Application_Settings
        ( Application_ID ,
          Keyword ,
          Value ,
          Class
        )
VALUES  ( 'SugarMemories01' , -- Application_ID - varchar(50)
          'Recorder.Message.Queue.Path' , -- Keyword - varchar(255)
          'FormatName:DIRECT=OS:colo1-vm-msmq21\private$\queue4' , -- Value - varchar(max)
          NULL  -- Class - varchar(50)
        )



		