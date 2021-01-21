select suser_sname(owner_sid) AS [owner], name
from sys.databases
ORDER BY suser_sname(owner_sid)