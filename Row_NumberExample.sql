select row_number() over(order by mid, vid), *
from dbo.FLOW_GEN_INFO