select (cast (datediff(SECOND, '3/1/2015 00:00:00', '4/1/2015 00:00:00') as float) - cast(datediff(second, '3/27/2015 18:09:25', '3/27/2015 19:19:03')  as float))
/ 
cast (datediff(SECOND, '3/1/2015 00:00:00', '4/1/2015 00:00:00') as float)
* 100
