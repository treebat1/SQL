
select *
from resadmindb.Resonance_Administration.dbo.Account_Connections
where Account_ID like 'Lenox%'

--update Resonance_Administration.dbo.Account_Connections
--set Connection_String = REPLACE(Connection_String, 'raider7\i1', 'raider7\i2')
--where Account_ID like 'StylinTrucks'


delete 
from resadmindb.Resonance_Administration.dbo.Account_Connections
where Account_ID like 'Asics%'