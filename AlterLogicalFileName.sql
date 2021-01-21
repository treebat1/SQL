
sp_Helpdb 'CoastalContacts'

alter database CoastalContacts
modify file (name = CostalContacts_LOG, newname = CoastalContacts_LOG)